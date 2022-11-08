// NewsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class NewsViewCell: UITableViewCell {
    @IBOutlet private var avatarImageView: UIImageView!

    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var postDateLabel: UILabel!
    @IBOutlet private var postDescriptionLabel: UILabel!
    @IBOutlet private var postImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
//        userNameLabel.text = "userNameLabel"
//        postDateLabel.text = "24.02.2021"
//        postDescriptionLabel
//            .text =
//            "postDescriptionLabel postDescriptionLabelpostDescriptionLabelpost" +
//            "DescriptionLabelpostDescriptionLabelpostDescriptionLabelpostDescriptionLabelpostDescriptionLabel"
//        postImageView.image = UIImage(named: "logoVk")
//        avatarImageView.image = UIImage(named: "logoVk")
    }

    func setupUI(news: News) {
        avatarImageView.image = UIImage(named: news.avatarImageName)
        userNameLabel.text = news.name
        postDateLabel.text = news.date
        postDescriptionLabel.text = news.description
        postImageView.image = UIImage(named: news.postImageName ?? "")
    }
}
