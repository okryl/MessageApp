//
//  ServiceManager.swift
//  MojilalaMessageApp
//
//  Created by Omer Karayel on 22/02/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

typealias successBlock = (_ response: [String: AnyObject]) ->Void
typealias failureBlock = (_ error: ErrorHandler) -> Void

final class ServiceManager: NSObject {
    
    private let urlStr = "https://jsonblob.com/api/jsonBlob/3cf871b2-f7cd-11e6-95c2-115605632e53"
    private static var instance : ServiceManager?
    
    static func sharedInstance() -> ServiceManager {
        if instance == nil {
            instance = ServiceManager()
        }
        return instance!
    }
    
    //MARK: - Fetch Message
    func request(success:@escaping (_ messageResponse: MessageResponse) -> Void, failure: @escaping failureBlock) {
        
        guard let url = URL(string: urlStr)
            else {
                failure(ErrorHandler.urlError(urlStr: urlStr))
                return
        }
        
        let task = startTask(withURL: url, success: { (response) in
            debugPrint(response)
            let responseObje = MessageResponse(json: response)
            success(responseObje)
        }) { (error) in
            failure(error)
        }
        task.resume()
        
    }
    
    //MARK: - Start Task
    private func startTask(withURL url: URL,success:@escaping successBlock, failure: @escaping failureBlock) -> URLSessionTask{
        return URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpResponse =  response as? HTTPURLResponse else {
                mainThread {
                    failure(ErrorHandler.httpResponseError)
                }
                return
            }
            
            guard httpResponse.statusCode == 200
                else {
                    mainThread {
                        failure(ErrorHandler.httpResponseStatusCodeError(statusCode: httpResponse.statusCode))
                    }
                    return
            }
            
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                else {
                    mainThread {
                        failure(ErrorHandler.jsonError)
                    }
                    return
            }
            mainThread {
                success(json)
            }
        })
    }
}

