//
//  PSRQuizCell.h
//  Quiz
//
//  Created by M on 30.09.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

@interface PSRQuizCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *answerText;
@property (weak, nonatomic) IBOutlet UIImageView *answerImage;
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;

@end
