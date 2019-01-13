//
//  Result.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

enum Result<T> {
	case success(T?)
	case error(Error?)
}
