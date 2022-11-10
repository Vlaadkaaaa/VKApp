// Friend.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Друзья
struct Friend {
    let name: String
    let imageName: String
    let profileImagesName: [String]?
}

/// Словарь друзей
struct FriendDictionary {
    let dictionary: [Int: Friend]
}

/// Friends
struct Friends {
    static let friends = [
        FriendDictionary(dictionary: [0: Friend(
            name: "Liana Anderson",
            imageName: "people-1",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [1: Friend(
            name: "Callie Monkey",
            imageName: "monkeyAvatar",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [2: Friend(
            name: "Crypto Punks",
            imageName: "CryptoPunksAvatar",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [3: Friend(
            name: "Khloe Dominguez",
            imageName: "people-5",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [4: Friend(
            name: "Paige Poole",
            imageName: "people-4",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [5: Friend(
            name: "Paige Poole",
            imageName: "people-4",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [6: Friend(
            name: "Paige Poole",
            imageName: "people-4",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [7: Friend(
            name: "Mitchell Salas",
            imageName: "people-7",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [8: Friend(
            name: "Nicholas Ferrell",
            imageName: "people-8",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [9: Friend(
            name: "Carson Gonzalez",
            imageName: "people-9",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [10: Friend(
            name: "Andres Randolph",
            imageName: "people-10",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [11: Friend(
            name: "Tyrese Dominguez",
            imageName: "people-11",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [12: Friend(
            name: "Atticus Barnes",
            imageName: "people-12",
            profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
        )]),
        FriendDictionary(dictionary: [13: Friend(
            name: "Aliana Ellis",
            imageName: "people-13",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [14: Friend(
            name: "Kaeden Espinoza",
            imageName: "people-14",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [15: Friend(
            name: "Lauryn Macias",
            imageName: "people-15",
            profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
        )]),
        FriendDictionary(dictionary: [16: Friend(
            name: "Muhammad Guerrero",
            imageName: "people-16",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [17: Friend(
            name: "Yasmine Donaldson",
            imageName: "people-17",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [18: Friend(
            name: "Yair Ruiz", imageName: "people-18", profileImagesName: ["KodaThree", "KodaOne", "KodaThree"]
        )]),
        FriendDictionary(dictionary: [19: Friend(
            name: "Maliyah Golden",
            imageName: "people-19",
            profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
        )])
    ]

    static func getFriends() -> [Friend] {
        var friends: [Friend] = []

        for friend in self.friends {
            for key in friend.dictionary {
                friends.append(key.value)
            }
        }
        return friends
    }
}
