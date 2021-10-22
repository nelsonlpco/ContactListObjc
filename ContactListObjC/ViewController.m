//
//  ViewController.m
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import "ViewController.h"
#import "Model/Contact.h"

@implementation ViewController

-(ViewController *) initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain  target:self action:@selector(addContact)];
        self.navigationItem.rightBarButtonItem = addButton;
        self.navigationItem.title = @"Novo contato";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addContact {
    NSLog(@"clicou ");
    
    Contact *contact = [Contact new];
    [contact setName:self.name.text];
    contact.address = self.address.text;
    contact.email = self.email.text;
    contact.phone = self.phone.text;
    contact.site =  self.site.text;

    NSLog(@"Add contact %@, %@, %@, %@, %@", [contact name], contact.address, contact.email, contact.phone, contact.site);
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
