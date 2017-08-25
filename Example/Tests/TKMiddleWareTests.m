//
//  TKMiddleWareTests.m
//  TKMiddleWareTests
//
//  Created by 云峰李 on 2017/8/23.
//  Copyright © 2017年 thinkWind. All rights reserved.
//
#import <Kiwi/Kiwi.h>
#import <TKMiddleWare/TKMiddleWare.h>

SPEC_BEGIN(MiddleWareTests)

describe(@"MiddleWare tests", ^{
    
    context(@"initial tests", ^{
        let(middleWare, ^id{
            return TKMiddleWareMgr;
        });
        
        it(@"show remote to invoke native", ^{
            NSNumber* retNumber = [middleWare performActionWithURL:[NSURL URLWithString:@"health://network/nativeactionc"]
                                   
                                                           options:nil
                                                        completion:^(NSDictionary * _Nonnull info) {
                                         
                                     }];
            [[retNumber should] equal:@NO];
        });
        
        it(@"show can not find target", ^{
            id ret = [middleWare performTarget:@"test" action:@"aaafea" params:nil];
            [ret beNil];
        });
        
        it(@"show can not find action", ^{
            id ret = [middleWare performTarget:@"Noraml" action:@"afafa" params:nil];
            [[ret should] equal:@4];
        });
    });
    
    context(@"perform tests", ^{
        it(@"show nomral", ^{
            id ret = [TKMiddleWareMgr performTarget:@"Noraml" action:@"testForTarget" params:nil];
            [[ret should] equal:@(3)];
        });
    });
    
    context(@"测试处理各种返回类型", ^{
        let(middleWare, ^id{
            return TKMiddleWareMgr;
        });
        
        it(@"test for void", ^{
            id ret = [middleWare performTarget:@"Noraml"
                               action:@"void"
                               params:nil];
            [ret beNil];
        });
        
        it(@"test for bool", ^{
            id ret = [middleWare performTarget:@"Noraml"
                               action:@"Bool"
                               params:nil];
            [[ret should] equal:@YES];
        });
        
        it(@"test for char", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"char"
                                        params:nil];
            [[ret should] equal:@(-10)];
        });
        
        it(@"test for unChar", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"unChar"
                                        params:nil];
            [[ret should] equal:@('B')];
        });
        
        it(@"test for short", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"short"
                                        params:nil];
            [[ret should] equal:@(-20)];
        });
        
        it(@"test for unShort", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"unShort"
                                        params:nil];
            [[ret should] equal:@(20)];
        });
        
        it(@"test for int", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"int"
                                        params:nil];
            [[ret should] equal:@(-30)];
        });
        
        it(@"test for unInt", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"unInt"
                                        params:nil];
            [[ret should] equal:@(30)];
        });
        
        it(@"test for long", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"long"
                                        params:nil];
            [[ret should] equal:@(-40)];
        });
        
        it(@"test for unLong", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"unLong"
                                        params:nil];
            [[ret should] equal:@(40)];
        });
        
        it(@"test for float", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"float"
                                        params:nil];
            [[ret should] equal:50.01 withDelta:0.1];
        });
        
        it(@"test for double", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"double"
                                        params:nil];
            [[ret should] equal:60.01 withDelta:0.1];
        });
        
        it(@"test for long double", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"longDouble"
                                        params:nil];
            [ret isKindOfClass:[NSString class]];
        });
        
        it(@"test for id", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"id"
                                        params:nil];
            [ret isKindOfClass:[NSObject class]];
        });
        
        it(@"test for Object", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"Object"
                                        params:nil];
            [ret isKindOfClass:NSClassFromString(@"TKTarget_Noraml")];
        });
        
        it(@"test for class", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"class"
                                        params:nil];
            [ret isKindOfClass:NSClassFromString(@"TKTarget_Noraml")];
        });
        
        it(@"test for SEL", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"SEL"
                                        params:nil];
            [[ret shouldNot] beNil];
        });
        
        it(@"test for block", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"block"
                                        params:nil];
            void(^test)() = ret;
            test();
        });
        
        it(@"test for pointer", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"pointer"
                                        params:nil];
            [ret isKindOfClass:[NSObject class]];
        });
        
        it(@"test for utfChar", ^{
            id ret = [middleWare performTarget:@"Noraml"
                                        action:@"utfChar"
                                        params:nil];
            char* value = (char *)[ret integerValue];
            if(strcmp(value, "哈哈哈哈") == 0){
                NSLog(@"成功");
            }
        });
    });
});

SPEC_END
