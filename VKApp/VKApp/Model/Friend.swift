// Friend.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Друзья
struct Friend {
    let name: String
    let imageName: String
    let profileImagesName: [String]?
}

///
struct FriendKey {
    let dictionary: [Int: Friend]
}

///
struct Friends {
    // MARK: - Public Methods
}

///
struct FriendsTwo {
    static func getFriend() -> [FriendKey] {
        let friend = [
            FriendKey(dictionary: [0: Friend(
                name: "Liana Anderson",
                imageName: "people-1",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [1: Friend(
                name: "Callie Monkey",
                imageName: "monkeyAvatar",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [2: Friend(
                name: "Crypto Punks",
                imageName: "CryptoPunksAvatar",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [3: Friend(
                name: "Khloe Dominguez",
                imageName: "people-5",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [4: Friend(
                name: "Paige Poole",
                imageName: "people-4",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [5: Friend(
                name: "Paige Poole",
                imageName: "people-4",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [6: Friend(
                name: "Paige Poole",
                imageName: "people-4",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [7: Friend(
                name: "Mitchell Salas",
                imageName: "people-7",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [8: Friend(
                name: "Nicholas Ferrell",
                imageName: "people-8",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [9: Friend(
                name: "Carson Gonzalez",
                imageName: "people-9",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [10: Friend(
                name: "Andres Randolph",
                imageName: "people-10",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [11: Friend(
                name: "Tyrese Dominguez",
                imageName: "people-11",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [12: Friend(
                name: "Atticus Barnes",
                imageName: "people-12",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            )]),
            FriendKey(dictionary: [13: Friend(
                name: "Aliana Ellis",
                imageName: "people-13",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [14: Friend(
                name: "Kaeden Espinoza",
                imageName: "people-14",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [15: Friend(
                name: "Lauryn Macias",
                imageName: "people-15",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksTwo"]
            )]),
            FriendKey(dictionary: [16: Friend(
                name: "Muhammad Guerrero",
                imageName: "people-16",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [17: Friend(
                name: "Yasmine Donaldson",
                imageName: "people-17",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [18: Friend(
                name: "Yair Ruiz", imageName: "people-18", profileImagesName: ["KodaThree", "KodaOne", "KodaThree"]
            )]),
            FriendKey(dictionary: [19: Friend(
                name: "Maliyah Golden",
                imageName: "people-19",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )])
        ]
        return friend
    }
}
