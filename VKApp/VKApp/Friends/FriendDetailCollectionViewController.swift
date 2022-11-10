// FriendDetailCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран всех фотографий друга
final class FriendDetailCollectionViewController: UICollectionViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendDetailCellIdentifier = "friendDetailCell"
        static let allFriendPhotoSegueIdentifier = "allFriendPhotoSegue"
    }

    // MARK: - Public Property

    var friend: FriendDictionary?
    var frindIndex = Int()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.allFriendPhotoSegueIdentifier,
              let destination = segue.destination as? FriendPhotosViewController
        else { return }
        destination.index = frindIndex
        destination.friend = friend
    }
}

// MARK: - UICollectionViewDataSource

extension FriendDetailCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friend?.dictionary.count ?? 0
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constants.friendDetailCellIdentifier,
                for: indexPath
            ) as? FriendDetailViewCell,
            let friend = friend else { return UICollectionViewCell() }
        cell.setupUI(friend, index: frindIndex)
        return cell
    }
}
