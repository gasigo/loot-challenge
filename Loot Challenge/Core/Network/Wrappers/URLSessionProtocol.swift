//
//  URLSessionProtocol.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
	typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
	func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
	func dataTask(with request: URLRequest,
				  completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
		let dataTask: URLSessionDataTask = self.dataTask(with: request, completionHandler: completionHandler)
		return dataTask as URLSessionDataTaskProtocol
	}
}
