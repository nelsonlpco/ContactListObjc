//
//  ContactDAO.h
//  ContactListObjC
//
//  Created by nelson oliveira on 23/10/21.
//

#import <Foundation/Foundation.h>
#import "../Model/Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactDAO : NSObject

@property NSMutableArray *contacts;

+(ContactDAO *) contatoDaoInstance;
-(void) addContact:(Contact *)contact;
-(NSInteger) count;
-(Contact *) getContactBy:(NSInteger) row;
-(void) remove:(Contact *) contact;
-(NSInteger) getIndexBy:(Contact *)contact;

@end

NS_ASSUME_NONNULL_END
