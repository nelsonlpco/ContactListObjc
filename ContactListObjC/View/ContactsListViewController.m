//
//  ContactsList.m
//  ContactListObjC
//
//  Created by nelson oliveira on 21/10/21.
//

#import "ContactsListViewController.h"
#import  "./AddContactViewController.h"
#import "../Model/Contact.h"

@implementation ContactsListViewController

//MARK: - Initializers

-(ContactsListViewController *)  init {
    self = [super init];
    if (self) {
        UIBarButtonItem *addItemButton = [ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
        self.navigationItem.rightBarButtonItem = addItemButton;
        self.navigationItem.title = @"Contatos";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.selectedRow = -1;
        
        self.contactDAO = [ContactDAO contatoDaoInstance];
    }
    return self;
}

//MARK: - LifeCycle
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.selectedRow inSection:0];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.selectedRow = -1;
}

//MARK: - Table Controllers

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contact *contact = [self.contactDAO getContactBy:indexPath.row];
        [self.contactDAO remove:contact];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactDAO.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"contactCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    Contact *contact= [self.contactDAO getContactBy:indexPath.row];
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedContact = [self.contactDAO getContactBy:indexPath.row];
    
    [self showForm];
}



//MARK: - user intents

-(void) showForm {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddContactViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    
    view.delegate = self;
    if(self.selectedContact) {
        view.contact = self.selectedContact;
    }
    
    [self.navigationController pushViewController:view animated:true];
}

- (void) addedContact: (Contact *)contact {
    NSLog(@"adicionado %@", contact);
    self.selectedRow = [self.contactDAO getIndexBy:contact];
    
    NSString *message = [NSString stringWithFormat:@"%@ Adicionado com sucesso", contact.name];
    
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Contato adicionado" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void) updatedContact: (Contact *)contact {
    NSLog(@"alterado %@", contact);
    self.selectedRow = [self.contactDAO getIndexBy:contact];
}

@end
