//
//  Contact.m
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import "Contact.h"

@implementation Contact

NSString *name;
NSString *phone;
NSString *email;
NSString *address;
NSString *site;
//
//-(void) setName:(NSString *)newValue {
//    name = newValue;
//}
//
//-(NSString *) name{
//    return name;
//}

-(NSString *)description {
    NSString *data = [NSString stringWithFormat:@"Contato: %@ %@ %@ %@ %@", self.name, self.phone, self.email, self.address, self.site];
    
    return data;
}


//Obs não é necessário definir a estrutura na inteface property a notation property cria a implementação dos gettets e setters

@end
