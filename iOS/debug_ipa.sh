echo " number "
#
APP_NAME="APP_NAME"
#WORKSPACE
WORKSPACE="______"
#SCHEME
APP_SCHEME="_____"

NET

# info.plist路径
project_infoplist_path="./__replace____/Info.plist"

#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")

#取build值
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")

# ipa name
DATE="$(date +%Y%m%d)"

IPANAME="V${bundleShortVersion}_${DATE}_$1.ipa"

# upload path
#要上传的ipa文件路径
IPA_PATH="Desktop/ipa_APP"
echo ${IPA_PATH}

# Xcode 8.0+ manager signing Automatically
echo "=================Debug clean================="
xcodebuild -workspace "${WORKSPACE}.xcworkspace" -scheme "${APP_SCHEME}"  -configuration 'Debug' clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -workspace "${WORKSPACE}.xcworkspace" -scheme "${APP_SCHEME}" -sdk iphoneos -configuration 'Debug' SYMROOT='$(PWD)/build'

echo "***************** upload *******************"
xcrun -sdk iphoneos PackageApplication "./build/Debug-iphoneos/${APP_NAME}.app" -o ~/"${IPA_PATH}/${IPANAME}"
