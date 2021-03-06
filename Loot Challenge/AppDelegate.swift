//
//  AppDelegate.swift
//  Loot Challenge
//
//  Created by Gabriel Gomes on 13/01/19.
//  Copyright © 2019 GDev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	let interactor = TransactionsInteractor(networkService: NetworkBuilder.makeNetworkService())
	
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = TransactionsBuilder.makeTransactionsView()
		self.window?.makeKeyAndVisible()
		return true
	}
}
