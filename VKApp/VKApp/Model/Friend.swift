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
struct Friends {
    // MARK: - Public Methods

    static func getFriends() -> [Friend] {
        let friends = [
            Friend(
                name: "Liana Anderson",
                imageName: "people-1",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            ),
            Friend(
                name: "Callie Monkey",
                imageName: "monkeyAvatar",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(
                name: "Crypto Punks",
                imageName: "CryptoPunksAvatar",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Paige Poole",
                imageName: "people-4",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            ),
            Friend(
                name: "Khloe Dominguez",
                imageName: "people-5",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(
                name: "Asia Simon",
                imageName: "people-6",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Mitchell Salas",
                imageName: "people-7",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            ),
            Friend(
                name: "Nicholas Ferrell",
                imageName: "people-8",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Carson Gonzalez",
                imageName: "people-9",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Andres Randolph",
                imageName: "people-10",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(
                name: "Tyrese Dominguez",
                imageName: "people-11",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Atticus Barnes",
                imageName: "people-12",
                profileImagesName: ["monkeyOne", "monkeyTwo", "monkeyThree"]
            ),
            Friend(
                name: "Aliana Ellis",
                imageName: "people-13",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(
                name: "Kaeden Espinoza",
                imageName: "people-14",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Lauryn Macias",
                imageName: "people-15",
                profileImagesName: ["CryptoPunksThree", "CryptoPunksOne", "CryptoPunksThreeFour"]
            ),
            Friend(
                name: "Muhammad Guerrero",
                imageName: "people-16",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(
                name: "Yasmine Donaldson",
                imageName: "people-17",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            ),
            Friend(name: "Yair Ruiz", imageName: "people-18", profileImagesName: ["KodaThree", "KodaOne", "KodaThree"]),
            Friend(
                name: "Maliyah Golden",
                imageName: "people-19",
                profileImagesName: ["KodaTwo", "KodaOne", "KodaThree"]
            )
        ]
        return friends
    }
}
