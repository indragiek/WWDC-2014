//
//  MNSPropertyViewController.m
//  Mensa
//
//  Created by Jordan Kay on 12/15/13.
//  Copyright (c) 2013 Jordan Kay. All rights reserved.
//

#import "MNSProperty.h"
#import "MNSPropertyView.h"
#import "MNSPropertyViewController.h"

@implementation MNSPropertyViewController
{
    MNSProperty *_inputProperty;
}

- (void)updateView:(MNSPropertyView *)view withObject:(MNSProperty *)property
{
    BOOL hasBooleanValue = ![property.value isEqual:@YES] && ![property.value isEqual:@NO];
    BOOL hasActionableValue = [property.value respondsToSelector:@selector(invoke)];
    BOOL showsDisclosureForValue = !(property.options & MNSPropertyOptionHidesDisclosureForValue);
    BOOL showsValue = hasBooleanValue && !hasActionableValue;
    _inputProperty = (property.options & MNSPropertyOptionAllowsUserInput) ? property : nil;

    [self _updateLabel:view.nameLabel withText:property.name];
    [self _updateLabel:view.valueLabel withText:(showsValue) ? [property.value description] : nil];
    view.nameLabel.textAlignment = (showsDisclosureForValue ? NSTextAlignmentLeft : NSTextAlignmentCenter);

    BOOL showsInputSwitch = (!showsValue && _inputProperty);
    view.inputSwitch.hidden = !showsInputSwitch;
    view.checkmarkView.hidden = (![property.value isEqual:@YES] || showsInputSwitch);
    view.disclosureView.hidden = !(hasActionableValue && showsDisclosureForValue);
    if (showsInputSwitch) {
        UISwitch *s = (UISwitch *)view.inputSwitch;
        [s removeTarget:nil action:NULL forControlEvents:UIControlEventValueChanged];
        [s addTarget:self action:@selector(_inputSwitchValueDidChange:) forControlEvents:UIControlEventValueChanged];
        s.on = [property.value boolValue];
    }

    if (!showsInputSwitch) {
        UITextField *inputField = view.inputField;
        if (property.options & MNSPropertyOptionAllowsUserInput) {
            inputField.placeholder = property.name;
            inputField.text = property.value;
            inputField.hidden = NO;
            inputField.delegate = self;
        } else {
            inputField.hidden = YES;
            inputField.delegate = nil;
        }
    }
}

- (void)_updateLabel:(UILabel *)label withText:(NSString *)text
{
    if (text) {
        label.text = text;
        label.hidden = NO;
    } else {
        label.text = nil;
        label.hidden = YES;
    }
}

- (void)_inputSwitchValueDidChange:(UISwitch *)sender
{
    _inputProperty.value = @(sender.on);
}

#pragma mark - NSObject

- (void)dealloc
{
    MNSPropertyView *view = (MNSPropertyView *)self.view;
    view.inputField.delegate = nil;
}

#pragma mark - MNSHostedViewController

- (void)selectObject:(MNSProperty *)property
{
    [super selectObject:property];
    if ([property.value respondsToSelector:@selector(invoke)]) {
        [property.value invoke];
    }
    if (property.options & MNSPropertyOptionTogglesBoolean) {
        if ([property.value isEqual:@YES]) {
            property.value = @NO;
        } else if ([property.value isEqual:@NO]) {
            property.value = @YES;
        }
    }
}

- (BOOL)canSelectObject:(id)object
{
    MNSPropertyView *view = (MNSPropertyView *)[self viewForObject:object];
    return view.inputSwitch.isHidden && view.valueLabel.isHidden;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _inputProperty.value = [textField.text length] ? textField.text : textField.placeholder;
}

@end
