//
//  BaseAPI.swift
//  SportsApp
//
//  Created by tasnem on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Swift.Result<M?, NSError>) -> Void) {
        guard let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue) else { return  }
      
         let headers = target.headers
        let params = buildParams(task: target.task)
        Alamofire.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
        guard let statusCode = response.response?.statusCode else {
                          
                           completion(.failure(NSError()))
                           return
        }
            
           if statusCode == 200 {
                          
              guard let jsonResponse = try? response.data
                else {
                    completion(.failure(NSError()))
                              return
                          }
            guard let responseObj = try? JSONDecoder().decode(M.self, from: jsonResponse) else {
                    
                    completion(.failure(NSError()))
                    return
                }
                completion(.success(responseObj))
            } else {
                
               
              
                completion(.failure(NSError()))
                return
            }
    }
    
    }
    


    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
