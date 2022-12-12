// PhotoService+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контейнер для таблиц и коллекций
extension PhotoService {
    class TableViewController: DataReloadable {
        // MARK: - Private Property

        private let tableVC: UITableViewController

        // MARK: - Init

        init(table: UITableViewController) {
            tableVC = table
        }

        // MARK: - Public methods

        func reloadRow(at indexPath: IndexPath) {
            tableVC.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

    class CollectionViewController: DataReloadable {
        // MARK: - Private Property

        private let collectionVC: UICollectionViewController

        // MARK: - Init

        init(collection: UICollectionViewController) {
            collectionVC = collection
        }

        // MARK: - Public methods

        func reloadRow(at indexPath: IndexPath) {
            collectionVC.collectionView.reloadItems(at: [indexPath])
        }
    }
}
