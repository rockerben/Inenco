//
//  Markers.m


#import "Markers.h"

@implementation Markers
@synthesize branches = _branches;

- (id)init {
 
    if ((self = [super init])) {
        self.branches = [[NSMutableArray alloc] init];
    }
    return self;
    
}

- (void) dealloc {
    self.branches = nil;
   // [super dealloc];
}

@end
