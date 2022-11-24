// UIImageView+Exstension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
extension UIImageView {
    func loadURL(_ url: String) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
