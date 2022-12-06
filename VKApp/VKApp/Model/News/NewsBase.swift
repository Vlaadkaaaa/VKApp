// News.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///
enum NewsItemType {
    case post
    case image
}

/// News
struct NewsBase {
    let name: String
    let date: String
    let postImageName: String?
    let avatarImageName: String
    let description: String?
    var type: NewsItemType
}

/// NewsPosts
struct NewsPosts {
    static func getNews() -> [NewsBase] {
        [
            NewsBase(
                name: "Alex",
                date: "29.03.2323",
                postImageName: "1",
                avatarImageName: "avatar",
                description: "Представляю вашему вниманию самый ожидаемый фильм 2323 года",
                type: Bool.random() ? .post : .image
            ),
            NewsBase(
                name: "Vlad",
                date: "01.11.2022",
                postImageName: "2",
                avatarImageName: "avatar",
                description: "Поздравляю своего лучшего друга с днем рождения",
                type: Bool.random() ? .post : .image
            ),
            NewsBase(
                name: "Jony",
                date: "01.01.2023",
                postImageName: "3",
                avatarImageName: "avatar",
                description: "Являясь всего лишь частью общей картины, акционеры крупнейших компаний набирают " +
                    "популярность среди определенных слоев населения, а значит, должны быть " +
                    "заблокированы в рамках своих собственных рациональных ограничений.",
                type: Bool.random() ? .post : .image
            )
        ]
    }
}
