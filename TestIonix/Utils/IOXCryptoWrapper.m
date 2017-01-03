//
//  IOXCryptoWrapper.m
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import "IOXCryptoWrapper.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation IOXCryptoWrapper

+(instancetype)sharedCryptoWrapper{
    
    static IOXCryptoWrapper *sharedCryptoWrapper = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedCryptoWrapper = [[IOXCryptoWrapper alloc] init];
        
    });
    
    return sharedCryptoWrapper;
}

-(NSString *)DESEncrypt:(NSString *)toEncrypt withKey:(NSString *)key{
    
    const void *vplainText = [toEncrypt UTF8String];
    
    size_t plainTextBufferSize = [toEncrypt length];
    
    CCCryptorStatus ccStatus;
    
    uint8_t *bufferPtr = NULL;
    
    size_t bufferPtrSize = 0;
    
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES -1);
    
    bufferPtr = malloc(bufferPtrSize * sizeof(uint8_t));
    
    memset((void*)bufferPtr, 0x0, bufferPtrSize);
    
    Byte iv[] = {
        0x12,
        0x34,
        0x56,
        0x78,
        0x90,
        0xab,
        0xcd,
        0xef
    };
    
    const void *vkey = [key UTF8String];
    
    ccStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding | kCCOptionECBMode, vkey, kCCKeySizeDES, iv, vplainText, plainTextBufferSize, (void *)bufferPtr, bufferPtrSize, &movedBytes);
    
    NSData *cryptData = [NSData dataWithBytes:(const void*)bufferPtr length:(NSUInteger)movedBytes];
    
    NSString *result = [cryptData base64EncodedStringWithOptions:0];
    
    return result;
    
}



@end
