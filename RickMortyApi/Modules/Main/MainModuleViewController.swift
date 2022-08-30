//
//  MainModuleViewController.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//  
//

import UIKit

class MainModuleViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMainModuleProtocol?
    
}

extension MainModuleViewController: PresenterToViewMainModuleProtocol{
    // TODO: Implement View Output Methods
}
