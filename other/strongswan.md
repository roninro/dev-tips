---
title: 使用 Strongswan 架设 Ipsec VPN
thumbnail: /uploads/1705.jpg
date: 2017-02-14 15:48:22
categories:
- vps
tags:
---

折腾完 `shadowsocks` 再搞搞 `VPN`.



- vps（ubuntu 14.0.1 x86） 
- OpenVZ 架构

## 安装Strongswam

```
apt-get update
apt-get install strongswan strongswan-plugin-xauth-generic strongswan-plugin-eap-mschapv2 strongswan-plugin-eap-md5 -y
```
<!-- more -->
```
wget https://download.strongswan.org/strongswan-5.4.0.tar.gz
tar zxvf strongswan-5.4.0.tar.gz
cd strongswan-5.4.0

./configure --sysconfdir=/etc --disable-sql --disable-mysql --disable-ldap --enable-dhcp --enable-eap-identity --enable-eap-mschapv2 --enable-md4 --enable-xauth-eap --enable-eap-peap --enable-eap-md5 --enable-openssl --enable-shared --enable-unity --enable-eap-tls --enable-eap-ttls --enable-eap-tnc --enable-eap-dynamic --enable-addrblock --enable-eap-radius --enable-radattr --enable-kernel-netlink --enable-kernel-libipsec

make && make install
```

## 证书

> **注意** 如果不生成证书，后面配置部分的配置中用 `pubkey` 认证的 `conn` 都不能用，甚至不能保留在配置中。
```
ipsec pki --gen --outform pem > caKey.pem
ipsec pki --self --in caKey.pem --dn "C=CH, O=strongSwan, CN=strongSwan CA" --ca --outform pem > caCert.pem
ipsec pki --gen --outform pem > serverKey.pem
ipsec pki --pub --in serverKey.pem | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "C=CH, O=strongSwan, CN=domainName" --san="domainName" --flag serverAuth --outform pem > serverCert.pem

ipsec pki --gen --outform pem > clientKey.pem
ipsec pki --pub --in clientKey.pem | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "C=CH, O=strongSwan, CN=client" --outform pem > clientCert.pem
openssl pkcs12 -export -inkey clientKey.pem -in clientCert.pem -name "client" -certfile caCert.pem -caname "strongSwan CA" -out clientCert.p12

```

安装证书
```
cp -r caCert.pem /etc/ipsec.d/cacerts/
cp -r serverCert.pem /etc/ipsec.d/certs/
cp -r serverKey.pem /etc/ipsec.d/private/
cp -r clientCert.pem /etc/ipsec.d/certs/
cp -r clientKey.pem /etc/ipsec.d/private/
```
CA 证书、客户证书（两个）和 .p12 证书用 FTP 复制出来给客户端用。


## 配置 Strongswan

### ipsec.conf

```
config setup
    uniqueids=never
conn %default
    ikelifetime=60m
    keylife=20m
    rekeymargin=3m
    keyingtries=1
    keyexchange=ike
conn ikev1
    keyexchange=ikev1
    authby=xauthpsk
    xauth=server
    left=%defaultroute
    leftsubnet=0.0.0.0/0
    leftfirewall=yes
    right=%any
    rightsourceip=10.0.0.0/24
    auto=add
conn ikev2-eap-mschapv2
    keyexchange=ikev2
    leftauth=pubkey
    leftcert=serverCert.pem
    leftid=@domainName
    leftsendcert=always
    left=%defaultroute
    leftsubnet=0.0.0.0/0
    leftfirewall=yes
    rightauth=eap-mschapv2
    eap_identity=%any
    right=%any
    rightsourceip=10.0.0.0/24
    auto=add
conn ikev2-eap-md5
    keyexchange=ikev2
    leftauth=pubkey
    leftcert=serverCert.pem
    leftid=@domainName
    leftsendcert=always
    left=%defaultroute
    leftsubnet=0.0.0.0/0
    leftfirewall=yes
    rightauth=eap-md5
    eap_identity=%any
    right=%any
    rightsourceip=10.0.0.0/24
    auto=add

```

### ipsec.secrets

```
: RSA server.pem
: PSK "PSK password"
marguerite : XAUTH "user password"
marguerite : EAP "user password"
```

### strongswan.conf

```
charon {
        duplicheck.enable = no
        install_virtual_ip = yes
        dns1 = 8.8.8.8
        dns2 = 8.8.4.4
        load_modular = yes
        plugins {
                include strongswan.d/charon/*.conf
        }
}
include strongswan.d/*.conf
```

## 配置iptables 转发

```
iptables -A INPUT -p esp -j ACCEPT
iptables -A INPUT -p udp --dport 500 -j ACCEPT
iptables -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT
```

保存iptables配置并配置开机自动载入
```
iptables-save > /etc/iptables.rules
cat > /etc/network/if-up.d/iptables<<EOF
#!/bin/sh
iptables-restore < /etc/iptables.rules
EOF
chmod +x /etc/network/if-up.d/iptables
```

## 启动 Strongswam

```
ipsec start
```


** 参考文章：**

[使用 Strongswan 架设 Ipsec VPN](https://zh.opensuse.org/index.php?title=SDB:Setup_Ipsec_VPN_with_Strongswan&variant=zh#.E4.BB.80.E4.B9.88.E6.98.AF_IPsec.EF.BC.9F)

[使用Strongswan搭建IPSec/IKEv2 VPN](https://hjc.im/shi-yong-strongswanda-jian-ipsecikev2-vpn/)

[一键安装IPsec及IKEv2VPN](https://github.com/mikumaycry/IPSecAndIKEv2VPNWithStrongswan)
