//
//  TestIonixTests.m
//  TestIonixTests
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IOXCryptoWrapper.h"

@interface TestIonixTests : XCTestCase

@end

@implementation TestIonixTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testEncryption{
    
    XCTAssertNotNil([[IOXCryptoWrapper sharedCryptoWrapper] DESEncrypt:@"1-9" withKey:@"ionix123456"]);
    
}

@end
