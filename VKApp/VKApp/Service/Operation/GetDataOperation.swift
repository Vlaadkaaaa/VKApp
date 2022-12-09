// GetDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire

/// Получение данных из сети
final class GetDataOperation: AsyncOperation {
    // MARK: - Public Property

    var data: Data?

    // MARK: - Private Property

    private var request: DataRequest

    // MARK: - Init

    init(request: DataRequest) {
        self.request = request
    }

    // MARK: - Public Methods

    override func cancel() {
        request.cancel()
        super.cancel()
    }

    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.state = .finished
        }
    }
}
