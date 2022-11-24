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

    var friendIdebtifier = Int()

    // MARK: - Private Property

    private var photos: [PhotoItem]? = []
    private var allPhotos: [UIImage] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllPhotos()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.allFriendPhotoSegueIdentifier,
              let destination = segue.destination as? FriendPhotosViewController
        else { return }
        destination.images = allPhotos
    }

    // MARK: - Private Methods

    private func fetchAllPhotos() {
        NetworkService().fetchUserPhotos(ownerId: friendIdebtifier) { [weak self] response in
            self?.photos = response.response?.items
            self?.changeDataToImage()
            self?.collectionView.reloadData()
        }
    }

    private func changeDataToImage() {
        guard let photos = photos else { return }
        for photo in photos {
            guard let photo = photo.sizes.last?.url,
                  let url = URL(string: photo) else { return }
            let data = try? Data(contentsOf: url)
            if let imageData = data {
                DispatchQueue.main.async {
                    self.allPhotos.append(UIImage(data: imageData) ?? UIImage())
                }
            }
        }
        self.photos = photos
    }
}

// MARK: - UICollectionViewDataSource

extension FriendDetailCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos?.count ?? 0
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
            let photo = photos?[indexPath.row].sizes.last?.url
        else { return UICollectionViewCell() }
        cell.configurateCell(photo)
        return cell
    }
}
