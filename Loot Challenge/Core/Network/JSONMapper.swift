//
//  JSONMapper.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol JSONMapperProtocol {
	func map<T: Decodable>(from: Data) -> T?
}

struct JSONMapper: JSONMapperProtocol {
	private let decoder: JSONDecoderProtocol
	
	init(decoder: JSONDecoderProtocol) {
		self.decoder = decoder
	}
	
	func map<T: Decodable>(from data: Data) -> T? {
		guard let entity = try? self.decoder.decode(T.self, from: data) else {
			return nil
		}
		
		return entity
	}
}
