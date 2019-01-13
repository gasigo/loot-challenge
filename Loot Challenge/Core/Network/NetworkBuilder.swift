//
//  NetworkBuilder.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

struct NetworkBuilder {
	static func makeNetworkService() -> NetworkServiceProtocol {
		let decoder = JSONDecoder()
		let mapper = JSONMapper(decoder: decoder)
		let session = URLSession.shared
		return NetworkService(mapper: mapper, session: session)
	}
}
