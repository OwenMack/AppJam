//
//  JSTextViewClass.m
//  eMote
//
//  Created by John C Van Hoogenstyn on 4/21/15.
//  Copyright (c) 2015 Owen Mack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSTextViewClass.h"

@implementation JSTextViewClass
-(void)awakeFromNib{
    self.layer.borderWidth = 10.0;
    self.layer.borderColor = [[UIColor colorWithRed:59/255.0f green:95/255.0f blue:123/255.0f alpha:1.0f] CGColor];
    self.layer.cornerRadius = 6.5;
    self.layer.shadowColor = [[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1.0f] CGColor];

    self.delegate = self;
    self.returnKeyType = UIReturnKeyDone;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
    }
    return self;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    //Clear text view upon beginning of editing
    textView.text = @"";
    //Set the text colour to black, rather than the dark grey placeholder text
    textView.textColor = [UIColor blackColor];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}



@end
