//
//  NetworkService.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
	func request<Data: RequestData, Output: Decodable>(with: Data, handler: @escaping (Result<Output>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
	private let mapper: JSONMapperProtocol
	private let session: URLSessionProtocol
	
	init(mapper: JSONMapperProtocol, session: URLSessionProtocol) {
		self.mapper = mapper
		self.session = session
	}
	
	func request<Data: RequestData, Output: Decodable>(with requestData: Data,
													   handler: @escaping (Result<Output>) -> Void) {
		guard let url = URL(string: requestData.host + requestData.path) else {
			handler(.error(Errors.invalidURL))
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = requestData.method.rawValue
		self.perform(request: request, handler: handler)
	}
	
	private func perform<Output: Decodable>(request: URLRequest, handler: @escaping (Result<Output>) -> Void) {
		let dataTask = self.session.dataTask(with: request) { (data, _, error) in
			guard error == nil else {
				handler(.error(error))
				return
			}
			
			guard let data = data else {
				handler(.error(Errors.emptyResponse))
				return
			}
			
			guard let result: Output = self.mapper.map(from: data) else {
				handler(.error(Errors.unableToSerialize))
				return
			}
			
			handler(.success(result))
		}
		
		dataTask.resume()
	}
	
	enum Errors: Error {
		case invalidURL
		case emptyResponse
		case unableToSerialize
	}
}
