//
//  AGTUniverseTableViewController.m
//  StarWars
//
//  Created by RAMON ALBERTI DANES on 26/3/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "AGTUniverseTableViewController.h"
#import "AGTCharacterViewController.h"

@interface AGTUniverseTableViewController ()

@end

@implementation AGTUniverseTableViewController

-(id) initWithModel:(AGTStarWarsUniverse*) model style:(UITableViewStyle) style{
    if(self=[super initWithStyle:style]) {
        _model = model;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section== IMPERIAL_SECTION) {
        return self.model.imperialCount;
    } else {
        return self.model.rebelCount;
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==IMPERIAL_SECTION) {
        return @"Imperials";
    } else {
        return @"Rebels";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Averiguar de que modelo estamos hablando (modelo = personaje)
    AGTStarWarsCharacter *character = nil;
    
    if(indexPath.section==IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    } else {
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    //Crear una celda
    static NSString *cellId=@"StarWarsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];

    if(cell==nil) {
        //La tenemos que crear nosotros desde 0
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //Configurar celda
    //Sinc model (personaje) -> vista (celda)
    cell.imageView.image=character.photo;
    cell.textLabel.text=character.alias;
    cell.detailTextLabel.text=character.name;
    
    
    //Devolver celda
    return cell;
}



#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar que modelo (personaje) me esta hablando
    
    //DEBERES:: -(AGTStarWarsCharacter *) CharacterAtIndexPath:(NSIndexPath*);
    
    AGTStarWarsCharacter *character;
    if(indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    } else {
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    // Crear un controller con el caracter
    AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc]initWithModel:character];
    [self.navigationController pushViewController:charVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/













/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
