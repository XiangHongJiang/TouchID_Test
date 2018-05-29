//
//  Header_Define.h
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#ifndef Header_Define_h
#define Header_Define_h

#define  UD [NSUserDefaults standardUserDefaults]
#define  UD_SET(_Value,_Key)   [UD setObject:_Value forKey:_Key]
#define  UD_GET(_Key)  [UD objectForKey:_Key]
#define  SharedApplication  [UIApplication sharedApplication]


#endif /* Header_Define_h */
