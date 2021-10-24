//
//  ViewController.m
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import "AddContactViewController.h"
#import "../Model/Contact.h"

@implementation AddContactViewController

//MARK: - INITIALIZERS

-(AddContactViewController *) initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
       self.contactDAO = [ContactDAO contatoDaoInstance];
    }
    
    return self;
}

//MARK: - Lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeToolbar];
   
    if(!self.contact) return;
    
    self.name.text = self.contact.name;
    self.address.text = self.contact.address;
    self.email.text = self.contact.email;
    self.phone.text = self.contact.phone;
    self.site.text = self.contact.site;
}

//MARK: - Interface
-(void) makeToolbar{
    UIBarButtonItem *addButton = nil;
    
    if(self.contact) {
        self.navigationItem.title = @"Alterar contato";
        
        addButton = [[UIBarButtonItem alloc]
                               initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain  target:self action:@selector(editContact)];
    }
    else {
        self.navigationItem.title = @"Adicionar contato";
        
        addButton = [[UIBarButtonItem alloc]
                               initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain  target:self action:@selector(addContact)];
    }
        
    self.navigationItem.rightBarButtonItem = addButton;
}

//MARK: - Intents

- (void)editContact {
    [self getFormData];
    [self.navigationController popViewControllerAnimated:true];
    [self.delegate updatedContact:self.contact];
}

- (void)addContact {
    self.contact = [Contact new];
    
    [self getFormData];
    [self.contactDAO addContact:self.contact];
    [self.navigationController popViewControllerAnimated:true];
    [self.delegate addedContact:self.contact];
}

-(void) getFormData{
    self.contact.name = self.name.text;
    self.contact.address = self.address.text;
    self.contact.email = self.email.text;
    self.contact.phone = self.phone.text;
    self.contact.site =  self.site.text;
}

@end
