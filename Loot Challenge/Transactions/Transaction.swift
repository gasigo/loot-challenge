//
//  Transaction.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
	let amount: Double
	let description: String
	let date: Date
	
	enum CodingKeys: String, CodingKey {
		case amount
		case description
		case date = "settlement_date"
	}
}
