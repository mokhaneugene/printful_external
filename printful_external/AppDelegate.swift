//
//  AppDelegate.swift
//  printful_external
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import UIKit
import Services

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var services: ServicesContextProtocol!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        services = ServicesContext()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let viewController = createCategoriesController()
        window?.rootViewController = viewController

        return true
    }
}

private extension AppDelegate {
    func createCategoriesController() -> UIViewController {
        let handlers = CategoriesResources.Handlers()
        let categoriesFactory = CategoriesFactory()
        let viewController = categoriesFactory.createController(handlers: handlers, services: services)
        return viewController
    }
}
