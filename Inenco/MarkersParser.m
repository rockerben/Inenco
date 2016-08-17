//
//  MarkersParser.m
//

#import "MarkersParser.h"
#import "Markers.h"
#import "Branch.h"
#import "GDataXMLNode.h"
#import <Parse/Parse.h>



@implementation MarkersParser


+ (NSString *)dataFilePath:(BOOL)forSave {
    return [[NSBundle mainBundle] pathForResource:@"samp" ofType:@"xml"];
}

+ (Markers *)loadMarkers{
    
    
    NSString *filePath = [self dataFilePath:FALSE];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil)
    {
        return nil;
    }
    
    
    //NSLog(@"%@", doc.rootElement);
    
    Markers *markers = [[Markers alloc] init];
    NSArray *branches = [doc.rootElement elementsForName:@"marker"];
    for (GDataXMLElement *branch in branches) {
        
        NSString * branchName     = [branch attributeForName:@"name"].stringValue;
        NSString * type     = [branch attributeForName:@"type"].stringValue;
        NSString * address  = [branch attributeForName:@"address"].stringValue;
        NSString * email    = [branch attributeForName:@"email"].stringValue;
        NSString * phone    = [branch attributeForName:@"phone"].stringValue;
        NSString * fax      = [branch attributeForName:@"fax"].stringValue;
        NSString * longitude = [branch attributeForName:@"lng"].stringValue;
        NSString * latitude  = [branch attributeForName:@"lat"].stringValue;
        NSLog(@"%@",latitude);
        //NSString * hours    = [branch attributeForName:@"hours"].stringValue
        
        NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
        
        // Build the predicate to find the branch sought
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"address ==[c] %@", address];
        
        NSLog(@"%@",branchName);
        NSLog(@"%@",address);
        
        Branch *branchFound = [Branch MR_findFirstWithPredicate:predicate inContext:localContext];
        
        // If a branch was found
        if (branchFound)
        {
            [markers.branches addObject:branchFound];
            
        }else
        {
            Branch *newBranch = [Branch  MR_createInContext:localContext];
            newBranch.branchName = branchName;
            newBranch.type = type;
            newBranch.address = address;
            newBranch.email = email;
            newBranch.phone = phone;
            newBranch.fax = fax;
            newBranch.longitude = longitude;
            newBranch.latitude = latitude;
            newBranch.date = [NSDate date];
            [newBranch setValue:[NSNumber numberWithInt:1] forKey:@"syncStatus"];
            [localContext MR_saveToPersistentStoreAndWait];
        
            [markers.branches addObject:newBranch];
            
        }
    
        
        
        
    }
    return markers;
    

    
}

@end