//
//  MainModulePresenter.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//  
//

import Foundation

class MainModulePresenter: ViewToPresenterMainModuleProtocol {

    // MARK: Properties
    var view: PresenterToViewMainModuleProtocol?
    var interactor: PresenterToInteractorMainModuleProtocol?
    var router: PresenterToRouterMainModuleProtocol?
    var characteresLocal: [Character]?
    
    func loadCharacteres(successRes: @escaping () -> (), failureRes: @escaping () -> ()) {

        interactor?.loadCharacteres(successRes: { characteres in
            let dispatchGroup = DispatchGroup()
            var characteresMutable = characteres
            characteresMutable.indices.forEach{
                let i = $0
                dispatchGroup.enter()
                self.interactor?.loadEpisode(url: characteresMutable[$0].episode.first!, successRes: { episode in
                    characteresMutable[i].firstEpisode = episode.name
                    self.interactor?.getAvatar(characteresMutable[i].image, sucess: { image in
                        characteresMutable[i].avatar = image
                        dispatchGroup.leave()
                    }, failure: {
                        dispatchGroup.leave()
                        failureRes()
                    })
                  
                }, failureRes: {
                    dispatchGroup.leave()
                    failureRes()
                })
            }
        
            dispatchGroup.notify(queue: DispatchQueue.main){
                self.characteresLocal = characteresMutable
                successRes()
            }
        }, failureRes: {
            failureRes()
        })
    }
    
}

extension MainModulePresenter: InteractorToPresenterMainModuleProtocol {
    
}
