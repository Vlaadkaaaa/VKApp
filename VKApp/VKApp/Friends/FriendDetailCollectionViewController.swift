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

    var friendPhotos: [String] = []

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.allFriendPhotoSegueIdentifier,
              let destination = segue.destination as? FriendPhotosViewController
        else { return }
        destination.friendPhotos = friendPhotos
    }
}

// MARK: - UICollectionViewDataSource

extension FriendDetailCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendPhotos.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constants.friendDetailCellIdentifier,
                for: indexPath
            ) as? FriendDetailViewCell else { return UICollectionViewCell() }
        let friend = friendPhotos[indexPath.row]
        cell.configurateCell(friend)
        return cell
    }
}
