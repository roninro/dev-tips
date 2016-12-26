

## Audio Queue : AudioQueueStart returns -50

在接入某第三方语音评测SDK时，在模拟器上运行正常，真机调试失败。

> An audio session is a singleton object that you employ to set the audio context for your app and to express to the system your intentions for your app’s audio behavior

原因是：没有为录音设置设置`AVAudioSession` 录音播放类型。

```
	VAudioSession * session = [AVAudioSession sharedInstance];
    if (!session) printf("ERROR INITIALIZING AUDIO SESSION! \n");
    else{
        
        NSError *nsError = nil;
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&nsError];
        
        if (nsError) printf("couldn't set audio category!");
        [session setActive:YES error:&nsError];
        if (nsError) printf("AudioSession setActive = YES failed");
    }
```
在` AudioQueueStart(myQueue, NULL);` 之前添加。


参考：[Audio Queue : AudioQueueStart returns -50](http://stackoverflow.com/questions/12650263/audio-queue-audioqueuestart-returns-50)