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
    }

    // MARK: - Public Property

    var friendId = Int()

    // MARK: - Private Property

    private var photos: [PhotoItem] = []
    private var allPhotosImage: [UIImage] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromRealm()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.allFriendPhotoSegueIdentifier,
              let destination = segue.destination as? FriendPhotosViewController
        else { return }
        destination.images = allPhotosImage
    }

    // MARK: - Private Methods

    private func loadDataFromRealm() {
        do {
            let realm = try Realm()
            let friendPhotos = Array(realm.objects(PhotoItem.self))
            if photos != friendPhotos {
                photos = friendPhotos
            } else {
                fetchUserPhotos()
            }
        } catch {
            print(error)
        }
    }

    private func fetchUserPhotos() {
        NetworkService().fetchUserPhotos(ownerId: friendId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(photo):
                guard let photos = photo.response?.items else { return }
                self.photos = photos
                self.changeDataToImage()
                RealmService().saveImageToRealm(photos)
                self.collectionView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
    }

    private func changeDataToImage() {
        let photos = photos
        for photo in photos {
            guard let photo = photo.sizes.last?.url else { return }
            let imageData = UIImageView()
            imageData.loadURL(photo)
            allPhotosImage.append(imageData.image ?? UIImage())
        }
        self.photos = photos
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
            ) as? FriendDetailViewCell,
            let photo = photos[indexPath.row].sizes.last?.url
        else { return UICollectionViewCell() }
        cell.configurateCell(photo)
        return cell
    }
}
