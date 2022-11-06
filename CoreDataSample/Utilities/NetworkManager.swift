//
//  NetworkManager.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import Foundation

let defaultSession = URLSession(configuration: .default)
var dataTask: URLSessionDataTask?

class NetworkManger: NSObject {

    class func getPersonsData(completionBlock :@escaping (_ response:Array<Any>?,_ error: NSError?) -> ()) {
        
        if let urlComponents = URLComponents(string: "https://swapi.dev/api/people") {
          guard let url = urlComponents.url else {
            return
          }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
            defer {
                dataTask = nil
            }
            if let error = error {
              print("DataTask error: " +
                                      error.localizedDescription + "\n")
            } else if
              let data = data,
              let response = response as? HTTPURLResponse,
              response.statusCode == 200 {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    if let responseValue = jsonData["results"] as? Array<Any> {
                        completionBlock(responseValue, nil)
                    } else {
                        print("Failed to get data")
                    }
                } catch let error {
                    print("Decoding error \(error)")
                }
            }
          }
          dataTask?.resume()
        }
    }
}
