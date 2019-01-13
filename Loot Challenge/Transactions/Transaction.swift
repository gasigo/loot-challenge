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
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.description = try values.decode(String.self, forKey: .description)
		self.date = try values.decode(Date.self, forKey: .date)
		guard let stringAmount = try? values.decode(String.self, forKey: .amount),
			let amount = Double(stringAmount) else {
			throw Errors.unableToSerializeAmount
		}
		self.amount = amount
	}

	enum CodingKeys: String, CodingKey {
		case amount
		case description
		case date = "settlement_date"
	}
	
	private enum Errors: Error {
		case unableToSerializeAmount
	}
}
