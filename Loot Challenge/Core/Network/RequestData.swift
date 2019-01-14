//
//  RequestData.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

protocol RequestData {
	var method: HTTPMethod { get }
	var host: String { get }
	var path: String { get }
}
