xcodebuild -workspace LETALK.xcworkspace -scheme LeTalk archive -archivePath ./build/LeTalk.xcarchive && \
rm -rf ./build/LZAlbum.ipa && \
xcodebuild -exportArchive -exportFormat ipa -archivePath build/LeTalk.xcarchive -exportPath build/LeTalk.ipa
