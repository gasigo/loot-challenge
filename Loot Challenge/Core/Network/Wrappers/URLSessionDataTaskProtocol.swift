//
//  URLSessionDataTaskProtocol.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
	func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
