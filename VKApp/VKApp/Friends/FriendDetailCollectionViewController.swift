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
    var friendIdebtifier = Int()
    var responsePhoto: Photo?
    var photos: [PhotoItem] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService().fetchUserPhotos(ownerId: friendIdebtifier) { [weak self] response in
            self?.responsePhoto = response
            self?.photos = response.response?.items ?? [PhotoItem(
                albumID: 0,
                date: 0,
                id: 0,
                ownerID: 0,
                text: "",
                sizes: [Size(height: 0, width: 0, url: "")]
            )]
            self?.collectionView.reloadData()
        }
    }

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
        photos.count
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
        let photo = photos[indexPath.row].sizes.last?.url ?? ""
        cell.configurateCell(photo)
        return cell
    }
}
