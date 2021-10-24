//
//  ContactsList.h
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import <UIKit/UIKit.h>
#import "../Repository/ContactDAO.h"
#import "./AddContactViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContactsListViewController : UITableViewController<AddContactViewDeletage>

@property ContactDAO *contactDAO;
@property Contact *selectedContact;
@property NSInteger selectedRow;

@end

NS_ASSUME_NONNULL_END
