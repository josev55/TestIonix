//
//  IOXCryptoWrapper.h
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FBENCRYPT_ALGORITHM     kCCAlgorithmDES
#define FBENCRYPT_BLOCK_SIZE    kCCBlockSizeDES
#define FBENCRYPT_KEY_SIZE      kCCKeySizeDES

@interface IOXCryptoWrapper : NSObject

+(instancetype)sharedCryptoWrapper;

-(NSString *)DESEncrypt:(NSString *)encryptValue withKey:(NSString *)key;

@end
