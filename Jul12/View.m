//
//  View.m
//  Jul12
//
//  Created by Matthew Fong on 7/11/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import "View.h"

@implementation View

- (void) valueChanged
{
	textView.text = [dateFormatter stringFromDate: datePicker.date];
}

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle: NSDateFormatterFullStyle];
		[dateFormatter setTimeStyle: NSDateFormatterFullStyle];
        
		//Let the date picker assume its natural size.
		datePicker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		datePicker.datePickerMode = UIDatePickerModeDate; //vs. UIDatePickerModeTime
        
		//Center the picker in the DatePickerView.
		CGRect b = self.bounds;
        
		datePicker.frame = CGRectMake(
                                      b.origin.x,
                                      b.origin.y,
                                      datePicker.bounds.size.width,
                                      datePicker.bounds.size.height
                                      );
        
		[datePicker addTarget: self
                       action: @selector(valueChanged)
             forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: datePicker];
        
		//TextView occupies all of the View below the picker.
        
		CGRect f = CGRectMake(
                              b.origin.x,
                              b.origin.y + datePicker.bounds.size.height,
                              b.size.width,
                              b.size.height - datePicker.bounds.size.height
                              );
        
		textView = [[UITextView alloc] initWithFrame: f];
		textView.editable = NO;
		textView.font = [UIFont systemFontOfSize: 22];
		[self valueChanged];
		[self addSubview: textView];
	}
	return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
