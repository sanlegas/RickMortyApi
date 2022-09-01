
import Foundation
import Alamofire

class NetworkUtility{
    
    func getImageFromUrl(_ url: String, sucess: @escaping(_ image: Data) -> (), failure: @escaping( ) ->() ){
        AF.request(url,method: .get)
            .response{ response in
                switch response.result{
                case .success(let response):
                    print(response!)
                    sucess(response!)
                case .failure(let error):
                    print("error:", error)
                    failure()
                }
                
            }
    }
}



