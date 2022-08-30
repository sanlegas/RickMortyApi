//
//  MainModuleContract.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainModuleProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainModuleProtocol : class{
    
    var view: PresenterToViewMainModuleProtocol? { get set }
    var interactor: PresenterToInteractorMainModuleProtocol? { get set }
    var router: PresenterToRouterMainModuleProtocol? { get set }
    func loadCharacteres(successRes: @escaping() ->(), failureRes: @escaping() -> () )
    var characteresLocal: [Character]?  { get set }

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainModuleProtocol {
    
    var presenter: InteractorToPresenterMainModuleProtocol? { get set }
    func getAvatar(_ urlAvatar: String, sucess: @escaping(_ image: Data) -> (), failure: @escaping( ) ->() )
    func loadCharacteres(successRes: @escaping(_ characteres: [Character]) ->(), failureRes: @escaping() -> () )
    func loadEpisode(url: String, successRes: @escaping(_ episode: Episode) -> (), failureRes: @escaping() -> () )
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainModuleProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainModuleProtocol {
    
}
