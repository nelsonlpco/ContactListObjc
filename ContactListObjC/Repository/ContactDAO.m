//
//  ContactDAO.m
//  ContactListObjC
//
//  Created by nelson oliveira on 23/10/21.
//

#import "ContactDAO.h"

@implementation ContactDAO

static ContactDAO *defaultDAO = nil;

-(id)init {
    self = [super init];
    if(self){
        self.contacts = [NSMutableArray new];
    }
    
    return self;
}

+(ContactDAO *) contatoDaoInstance {
    if(!defaultDAO) {
        defaultDAO = [ContactDAO new];
    }
    return defaultDAO ;
}

- (Contact *)getContactBy:(NSInteger)row{
    return self.contacts[row];
}

- (NSInteger)count {
    return self.contacts.count;
}

- (void)addContact:(Contact *)contact {
    [self.contacts addObject:contact];
}

- (void)remove:(Contact *)contact {
    [self.contacts removeObject:contact];
}

-(NSInteger)getIndexBy:(Contact *)contact {
    return [self.contacts indexOfObject:contact];
}

@end
