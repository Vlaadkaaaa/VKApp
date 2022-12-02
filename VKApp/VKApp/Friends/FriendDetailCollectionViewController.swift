// FriendDetailCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

///  Экран всех фотографий друга
final class FriendDetailCollectionViewController: UICollectionViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendDetailCellIdentifier = "friendDetailCell"
        static let allFriendPhotoSegueIdentifier = "allFriendPhotoSegue"
        static let titleErrorText = "Ошибка загрузки из БД"
    }

    // MARK: - Public Property

    var friendId = Int()

    // MARK: - Private Property

    private let networkService = NetworkService()
    private let realmService = RealmService()
    private var photosItem: [PhotoItem] = []
    private var allPhotosImage: [UIImage] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserPhotos()
        loadData()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.allFriendPhotoSegueIdentifier,
              let destination = segue.destination as? FriendPhotosViewController
        else { return }
        destination.images = allPhotosImage
    }

    // MARK: - Private Methods

    private func loadData() {
        guard let friendPhotos = realmService.loadData(PhotoItem.self) else { return }
        let friendsPhotos = Array(friendPhotos)
        if photosItem != friendsPhotos {
            photosItem = friendsPhotos
        } else {
            fetchUserPhotos()
        }
    }

    private func fetchUserPhotos() {
        networkService.fetchUserPhotos(ownerId: friendId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(photo):
                guard let photos = photo.response?.items else { return }
                self.photosItem = photos
                self.changeDataToImage()
                self.realmService.saveImageToRealm(photos)
                self.collectionView.reloadData()
            case let .failure(error):
                self.showAlertError(title: Constants.titleErrorText, message: error.localizedDescription)
            }
        }
    }

    private func changeDataToImage() {
        let photos = photosItem
        for photo in photos {
            guard let photo = photo.sizes.last?.url else { return }
            let imageData = UIImageView()
            imageData.loadImage(photo, networkService: networkService)
            allPhotosImage.append(imageData.image ?? UIImage())
        }
        photosItem = photos
    }
}

// MARK: - UICollectionViewDataSource

extension FriendDetailCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosItem.count
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
            let photo = photosItem[indexPath.row].sizes.last?.url
        else { return UICollectionViewCell() }
        cell.configurateCell(photo, networkService: networkService)
        return cell
    }
}
