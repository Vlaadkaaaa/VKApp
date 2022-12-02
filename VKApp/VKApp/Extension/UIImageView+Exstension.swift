// UIImageView+Exstension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension UIImageView
extension UIImageView {
    func loadImage(_ url: String, networkService: NetworkService) {
        networkService.loadImageData(url, completion: { [weak self] result in
            DispatchQueue.main.async {
                guard let self,
                      let image = UIImage(data: result) else { return }
                self.image = image
            }
        })
    }
}
