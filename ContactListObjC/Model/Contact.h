//
//  Contact.h
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

-(void) setName: (NSString *) newValue;
-(NSString *) name;
//podemos usar @property para declarar getters e setters sem tratamento
@property NSString *email;
@property NSString *phone;
@property NSString *address;
@property NSString *site;

@end

NS_ASSUME_NONNULL_END
