//
//  MainModuleInteractor.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//  
//

import Foundation

class MainModuleInteractor: PresenterToInteractorMainModuleProtocol {
    func getAvatar(_ urlAvatar: String, sucess: @escaping(_ image: Data) -> (), failure: @escaping( ) ->() ){
        let networkingUtility = NetworkUtility()
        networkingUtility.getImageFromUrl(urlAvatar) { image in
            sucess(image)
        } failure: {
            failure()
        }

    }
    
    func loadCharacteres(successRes: @escaping(_ characteres: [Character]) ->(), failureRes: @escaping() -> () ) {
        let apiCharacteres = APIClient(baseUrl: APIManager.shared.characteres)
        apiCharacteres.getArray() { (result: Result<ResponseCharacters, Error>) in
            switch result {
            case .success(var success):
                print("success \(success)")
                
                successRes(success.results)
            case .failure(let failure):
                print("Falló \(failure)")
                failureRes()
            }
        }
    }
    
    func loadEpisode(url: String,successRes: @escaping(_ episode: Episode) -> (), failureRes: @escaping() -> () ){
        
        let apiEpisode = APIClient(baseUrl: url)
        apiEpisode.getArray(){ (result: Result<Episode, Error>) in
            switch result{
            case .success(let response):
                print("success \(response)")
                successRes(response)
            case .failure(let failure):
                print("Fallo")
            }
            
        }
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterMainModuleProtocol?
    
}
