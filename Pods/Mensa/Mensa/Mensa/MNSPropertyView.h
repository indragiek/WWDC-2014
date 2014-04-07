//
//  MNSPropertyView.h
//  Mensa
//
//  Created by Jordan Kay on 12/15/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

@interface MNSPropertyView : UIView

@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *valueLabel;
@property (nonatomic) IBOutlet UITextField *inputField;
@property (nonatomic) IBOutlet UIControl *inputSwitch;
@property (nonatomic) IBOutlet UIControl *inputSlider;
@property (nonatomic) IBOutlet UIImageView *disclosureView;
@property (nonatomic) IBOutlet UIImageView *checkmarkView;

@end
