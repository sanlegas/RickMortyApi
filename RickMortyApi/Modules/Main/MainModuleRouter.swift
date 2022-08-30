//
//  MainModuleRouter.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//  
//

import Foundation
import UIKit

class MainModuleRouter: PresenterToRouterMainModuleProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ViewController()
        
        let presenter: ViewToPresenterMainModuleProtocol & InteractorToPresenterMainModuleProtocol = MainModulePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainModuleRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainModuleInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
