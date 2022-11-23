// MultipartUpload.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Internal type which encapsulates a `MultipartFormData` upload.
final class MultipartUpload {
    lazy var result = Result { try build() }

    @Protected
    private(set) var multipartFormData: MultipartFormData
    let encodingMemoryThreshold: UInt64
    let request: URLRequestConvertible
    let fileManager: FileManager

    init(
        encodingMemoryThreshold: UInt64,
        request: URLRequestConvertible,
        multipartFormData: MultipartFormData
    ) {
        self.encodingMemoryThreshold = encodingMemoryThreshold
        self.request = request
        fileManager = multipartFormData.fileManager
        self.multipartFormData = multipartFormData
    }

    func build() throws -> UploadRequest.Uploadable {
        let uploadable: UploadRequest.Uploadable
        if $multipartFormData.contentLength < encodingMemoryThreshold {
            let data = try $multipartFormData.read { try $0.encode() }

            uploadable = .data(data)
        } else {
            let tempDirectoryURL = fileManager.temporaryDirectory
            let directoryURL = tempDirectoryURL.appendingPathComponent("org.alamofire.manager/multipart.form.data")
            let fileName = UUID().uuidString
            let fileURL = directoryURL.appendingPathComponent(fileName)

            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)

            do {
                try $multipartFormData.read { try $0.writeEncodedData(to: fileURL) }
            } catch {
                // Cleanup after attempted write if it fails.
                try? fileManager.removeItem(at: fileURL)
                throw error
            }

            uploadable = .file(fileURL, shouldRemove: true)
        }

        return uploadable
    }
}

extension MultipartUpload: UploadConvertible {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try request.asURLRequest()

        $multipartFormData.read { multipartFormData in
            urlRequest.headers.add(.contentType(multipartFormData.contentType))
        }

        return urlRequest
    }

    func createUploadable() throws -> UploadRequest.Uploadable {
        try result.get()
    }
}
