//
//  ArticleTableViewCell.m
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import "ArticleTableViewCell.h"
#import "AsyncImageView.h"
#import "NYTimes-Swift.h"
#import "Theme.h"

@interface ArticleTableViewCell ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UILabel *articleTypeLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIImageView *thumbnailImageView;
@end

@implementation ArticleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        [self applyTheme];
        [self setupConstraints];
    }
    return self;
}

- (void)applyTheme {
    self.articleTypeLabel.font = [UIFont systemFontOfSize:12.0f];
    self.dateLabel.font = [UIFont primaryFont];
    self.titleLabel.font = [UIFont primaryFont];
    self.detailLabel.font = [UIFont primaryFont];
    self.detailLabel.textColor = [UIColor primaryGrayColor];
    self.dateLabel.textColor = [UIColor primaryGrayColor];
    self.articleTypeLabel.textColor = [UIColor primaryGrayColor];
    self.thumbnailImageView.backgroundColor = [UIColor primaryGrayColor];
}

- (void)setupConstraints {
    
    
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.titleLabel.superview.topAnchor constant:15.0f].active = YES;
    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.thumbnailImageView.trailingAnchor constant:12.0f].active = YES;
    [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.titleLabel.superview.trailingAnchor].active = YES;
    
    [self.detailLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:15.0f].active = YES;
    [self.detailLabel.leadingAnchor constraintEqualToAnchor:self.thumbnailImageView.trailingAnchor constant:12.0f].active = YES;
    [self.detailLabel.trailingAnchor constraintEqualToAnchor:self.detailLabel.superview.trailingAnchor].active = YES;

    
    [self.articleTypeLabel.leadingAnchor constraintEqualToAnchor:self.thumbnailImageView.trailingAnchor constant:12.0f].active = YES;
    [self.articleTypeLabel.topAnchor constraintEqualToAnchor:self.detailLabel.bottomAnchor constant:2.0f].active = YES;
    [self.articleTypeLabel.bottomAnchor constraintGreaterThanOrEqualToAnchor:self.articleTypeLabel.superview.bottomAnchor constant:-12.0f].active = YES;


    [self.dateLabel.trailingAnchor constraintEqualToAnchor:self.dateLabel.superview.trailingAnchor constant:0.0f].active = YES;
    [self.dateLabel.topAnchor constraintEqualToAnchor:self.detailLabel.bottomAnchor constant:2.0f].active = YES;
    [self.dateLabel.bottomAnchor constraintGreaterThanOrEqualToAnchor:self.dateLabel.superview.bottomAnchor constant:-12.0f].active = YES;


    [self.thumbnailImageView.heightAnchor constraintEqualToConstant:35.0f].active = YES;
    [self.thumbnailImageView.widthAnchor constraintEqualToConstant:35.0f].active = YES;
    [self.thumbnailImageView.leadingAnchor constraintEqualToAnchor:self.thumbnailImageView.superview.leadingAnchor constant:6.0f].active = YES;
    [self.thumbnailImageView.topAnchor constraintEqualToAnchor:self.articleTypeLabel.bottomAnchor constant:20.0f].active = YES;
    [self.thumbnailImageView.bottomAnchor constraintEqualToAnchor:self.thumbnailImageView.superview.bottomAnchor constant:-42.0f].active = YES;

}

- (void)setup {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    self.articleTypeLabel = [UILabel new];
    [self.contentView addSubview:self.articleTypeLabel];
    self.articleTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;

    self.detailLabel = [UILabel new];
    self.detailLabel.numberOfLines = 2;
    [self.contentView addSubview:self.detailLabel];
    self.detailLabel.translatesAutoresizingMaskIntoConstraints = NO;

    self.titleLabel = [UILabel new];
    self.titleLabel.numberOfLines = 2;
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    self.dateLabel = [UILabel new];
    [self.contentView addSubview:self.dateLabel];
    self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;

    self.thumbnailImageView = [UIImageView new];
    [self.contentView addSubview:self.thumbnailImageView];
    self.thumbnailImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.thumbnailImageView.backgroundColor = [UIColor lightGrayColor];
}


- (void)prepareForReuse {
    [super prepareForReuse];

    self.titleLabel.text = nil;
    self.detailLabel.text = nil;
    self.articleTypeLabel.text = nil;
    self.dateLabel.text = nil;
    self.thumbnailImageView.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - Public

- (void)configureWithViewModel:(ArticleViewModel *)viewModel {
    self.articleTypeLabel.text = viewModel.articleType.uppercaseString;
    self.dateLabel.text = viewModel.publishedDateString;
    self.titleLabel.text = viewModel.titleText;
    self.detailLabel.text = viewModel.detailText;
    self.thumbnailImageView.imageURL = viewModel.thumbnailImageUrl;
    
    self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.frame.size.height /2;
    self.thumbnailImageView.layer.masksToBounds = YES;
    self.thumbnailImageView.layer.borderWidth = 0;

}

@end
