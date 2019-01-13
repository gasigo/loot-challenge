//
//  JSONDecoderProtocol.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol JSONDecoderProtocol {
	func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: JSONDecoderProtocol {}
