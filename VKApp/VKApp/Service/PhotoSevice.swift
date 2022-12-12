// PhotoSevice.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Перезагрузка ячейки таблицы
protocol DataReloadable {
    func reloadRow(at indexPath: IndexPath)
}

/// Кэширование фото
final class PhotoSevice {
    // MARK: - Private Constants

    private enum Constants {
        static let separatorText = "/"
        static let imagesFolderText = "images"
    }

    // MARK: - Private Property

    private let container: DataReloadable
    private var imagesMap: [String: UIImage] = [:]
    private var fileManager = FileManager.default

    // MARK: - Init

    init(container: UITableViewController) {
        self.container = TableViewController(table: container)
    }

    init(container: UICollectionViewController) {
        self.container = CollectionViewController(collection: container)
    }

    // MARK: - Public Methods

    func photo(url: String, indexPath: IndexPath) -> UIImage? {
        if let image = imagesMap[url] {
            return image
        } else if let image = getImageFromDisk(url: url) {
            return image
        } else {
            loadPhoto(url: url, at: indexPath)
            return UIImage()
        }
    }

    // MARK: - Private Methods

    private func getImageFromDisk(url: String) -> UIImage? {
        guard
            let filePath = getImagePath(url: url),
            let image = UIImage(contentsOfFile: filePath)
        else { return nil }
        imagesMap[url] = image
        return image
    }

    private func loadPhoto(url: String, at indexPath: IndexPath) {
        AF.request(url).responseData { [weak self] response in
            guard let data = response.data,
                  let image = UIImage(data: data),
                  let self = self
            else { return }
            self.imagesMap[url] = image
            self.saveImageToDisk(url: url, image: image)
            self.container.reloadRow(at: indexPath)
        }
    }

    private func saveImageToDisk(url: String, image: UIImage) {
        guard let filePath = getImagePath(url: url) else { return }
        fileManager.createFile(atPath: filePath, contents: image.pngData())
    }

    private func getImagePath(url: String) -> String? {
        guard
            let folderURL = getCasheFolderPath(),
            let fileName = url.split(separator: Constants.separatorText).last
        else { return nil }
        return folderURL.appendingPathComponent("\(fileName)").path
    }

    private func getCasheFolderPath() -> URL? {
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = documentDirectory.appendingPathComponent(Constants.imagesFolderText)
        try? fileManager.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }
}
