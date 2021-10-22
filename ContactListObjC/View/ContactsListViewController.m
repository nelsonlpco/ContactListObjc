//
//  ContactsList.m
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import "ContactsListViewController.h"
#import  "../ViewController.h"

@implementation ContactsListViewController
-(ContactsListViewController *)  init {
    self = [super init];
    
    UIBarButtonItem *addItemButton = [ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
    self.navigationItem.rightBarButtonItem = addItemButton;
    
    return self;
}

-(void) showForm {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    [self.navigationController pushViewController:view animated:true];
}

@end
