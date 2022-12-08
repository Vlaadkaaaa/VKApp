// GetDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire

/// GetDataOperation
final class GetDataOperation: AsyncOperation {
    var data: Data?
    private var request: DataRequest

    init(request: DataRequest) {
        self.request = request
    }

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
