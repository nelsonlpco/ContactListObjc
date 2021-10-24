//
//  ViewController.h
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import <UIKit/UIKit.h>
#import "../Repository/ContactDAO.h"

@protocol AddContactViewDeletage <NSObject>

- (void) addedContact: (Contact *)contact;
- (void) updatedContact: (Contact *)contact;

@end


@interface AddContactViewController : UIViewController

@property IBOutlet UITextField *name;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *address;
@property IBOutlet UITextField *phone;
@property IBOutlet UITextField *site;

@property ContactDAO *contactDAO;
@property Contact *contact;
@property id<AddContactViewDeletage> delegate;

@end

