//
//  main.m
//  attributesforpreset
//
//  Created by Kevin Meaney on 10/01/2015.
//  Copyright (c) 2015 Kevin Meaney. All rights reserved.
//

@import Foundation;
@import AVFoundation;

// The following method definitions pulled from:
// https://github.com/billinghamj/iPhone6-iOS8-RuntimeHeaders/blob/master/Frameworks/AVFoundation.framework/AVAssetExportSession.h

@interface AVAssetExportSession ()

+ (id)_settingForPreset:(id)arg1;
+ (id)_utTypesForPresets;

@end

static void printNSString(NSString *string)
{
    printf("%s\n", [string cStringUsingEncoding:NSUTF8StringEncoding]);
}

static void printCVPixelBufferStringConstants()
{
    printf("===================================================\n");
    printf("CVPixelBuffer string constants. \n");
    printNSString(@"kCVPixelBufferPixelFormatTypeKey");
    printNSString((NSString *)kCVPixelBufferPixelFormatTypeKey);
    printNSString(@"kCVPixelBufferMemoryAllocatorKey");
    printNSString((NSString *)kCVPixelBufferMemoryAllocatorKey);
    printNSString(@"kCVPixelBufferWidthKey");
    printNSString((NSString *)kCVPixelBufferWidthKey);
    printNSString(@"kCVPixelBufferCGBitmapContextCompatibilityKey");
    printNSString((NSString *)kCVPixelBufferCGBitmapContextCompatibilityKey);
    printNSString(@"Format of CVPixelBuffer string constants is unvarying");
}

static void printAVFoundationVideoSettingsKeysAndValues()
{
    printf("===================================================\n");
    printf("AVFoundation video settings string constants. \n");
    printNSString(@"AVVideoCodecKey");
    printNSString(AVVideoCodecKey);
    printNSString(@"AVVideoCodecH264");
    printNSString(AVVideoCodecH264);
    printNSString(@"AVVideoCodecJPEG");
    printNSString(AVVideoCodecJPEG);
    printNSString(@"AVVideoCodecAppleProRes4444");
    printNSString(AVVideoCodecAppleProRes4444);
    printNSString(@"AVVideoCodecAppleProRes422");
    printNSString(AVVideoCodecAppleProRes422);
    printNSString(@"AVVideoWidthKey");
    printNSString(AVVideoWidthKey);
    printNSString(@"AVVideoProfileLevelKey");
    printNSString(AVVideoProfileLevelKey);
    printNSString(@"AVVideoProfileLevelH264Baseline41");
    printNSString(AVVideoProfileLevelH264Baseline41);
    printNSString(@"AVVideoProfileLevelH264Main32");
    printNSString(AVVideoProfileLevelH264Main32);
    printNSString(@"AVVideoPixelAspectRatioKey");
    printNSString(AVVideoPixelAspectRatioKey);
    printNSString(@"AVVideoCleanApertureWidthKey");
    printNSString(AVVideoCleanApertureWidthKey);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *presets = [AVAssetExportSession allExportPresets];
        for (NSObject *preset in presets)
        {
            NSDictionary *setting = [AVAssetExportSession _settingForPreset:preset];
            printf("================================================\n");
            printNSString((NSString *)preset);
            printNSString(setting.description);
            NSDictionary *videoSettings = setting[@"Video"];
            if (videoSettings)
            {
                NSNumber *codec = videoSettings[@"videoCodec"];
                if (codec)
                {
                    NSString *codecString;
                    codecString = [NSString stringWithFormat:@"Codec: %@",
                                   codec.stringValue];
                    printNSString(codecString);
                    FourCharCode codecVal = codec.unsignedIntValue;
                    if (codecVal == kCMVideoCodecType_H264)
                    {
                        printf("kCMVideoCodecType_H264\n");
                    }
                    else if (codecVal == kCMVideoCodecType_422YpCbCr8)
                    {
                        printf("kCMVideoCodecType_422YpCbCr8\n");
                    }
                    else if (codecVal == kCMVideoCodecType_JPEG)
                    {
                        printf("kCMVideoCodecType_JPEG\n");
                    }
                    else if (codecVal == kCMVideoCodecType_AppleProRes4444)
                    {
                        printf("kCMVideoCodecType_AppleProRes4444\n");
                    }
                    else if (codecVal == kCMVideoCodecType_AppleProRes422HQ)
                    {
                        printf("kCMVideoCodecType_AppleProRes422HQ\n");
                    }
                    else if (codecVal == kCMVideoCodecType_AppleProRes422)
                    {
                        printf("kCMVideoCodecType_AppleProRes422\n");
                    }
                    else if (codecVal == kCMVideoCodecType_AppleProRes422LT)
                    {
                        printf("kCMVideoCodecType_AppleProRes422LT\n");
                    }
                    else if (codecVal == kCMVideoCodecType_AppleProRes422Proxy)
                    {
                        printf("kCMVideoCodecType_AppleProRes422Proxy\n");
                    }
                }
            }
        }
        printf("================================================\n");
        printf("uti types available for presets\n");
        NSArray *utTypes = [AVAssetExportSession _utTypesForPresets];
        printNSString(utTypes.description);
        
        printCVPixelBufferStringConstants();
        printAVFoundationVideoSettingsKeysAndValues();
/*      // Passthrough returns nil for settings.
        NSDictionary *setting;
        setting = [AVAssetExportSession _settingForPreset:AVAssetExportPresetPassthrough];
        printf("================================================\n");
        printNSString(AVAssetExportPresetPassthrough);
        printNSString(setting.description);
*/
    }
    return 0;
}
