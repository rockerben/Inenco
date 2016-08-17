//
//  SDOrderDetailViewController.h
//

#import <UIKit/UIKit.h>


@class Markers;
@interface INMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
Markers *_markers;
    
}


@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property (nonatomic, retain) Markers *markers;



@end
