// News.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// News
struct News {
    let name: String
    let date: String
    let postImageName: String?
    let avatarImageName: String
    let description: String
}

/// NewsPosts
struct NewsPosts {
    static func getNews() -> [News] {
        [
            News(
                name: "Alex",
                date: "29.03.2323",
                postImageName: "adsLogo",
                avatarImageName: "people-19",
                description: "Представляю вашему вниманию самый ожидаемый фильм 2323 года"
            ),
            News(
                name: "Vlad",
                date: "01.11.2022",
                postImageName: "logoVk",
                avatarImageName: "logoVk",
                description: "Поздравляю своего лучшего друга с днем рождения"
            ),
            News(
                name: "Jony",
                date: "01.01.2023",
                postImageName: "people-18",
                avatarImageName: "people-7",
                description: "Являясь всего лишь частью общей картины, акционеры крупнейших компаний набирают " +
                    "популярность среди определенных слоев населения, а значит, должны быть " +
                    "заблокированы в рамках своих собственных рациональных ограничений."
            )
        ]
    }
}
