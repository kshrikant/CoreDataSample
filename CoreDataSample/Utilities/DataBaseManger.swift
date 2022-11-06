//
//  DataBaseManger.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import Foundation
import UIKit

class DataBaseManger: NSObject {
    
    class func savePersonsToDb(_ completionBlock : @escaping ()->()) {
        NetworkManger.getPersonsData(completionBlock: { response, error in
            if response != nil {
                //TODO - Out of the scope - Use background context to improve performance
                let context = CoreDataStack.persistentContainer.viewContext
                for dictionary in response! {
                    let person = Person(context:context)
                    person.parseWith(response: dictionary as! [String : Any])
                }
                CoreDataStack.clearStorage(forEntity: "Person")
                CoreDataStack.saveContext()
                completionBlock()
            }else{
                // Do nothing -  no error, response is empty
            }
            if error != nil {
                //Show error
            }
        })
    }
    
   class func loadPersonsFromDb() -> [PersonViewModel] {
        let context = CoreDataStack.persistentContainer.viewContext
        var viewModelArray = [PersonViewModel]()
        do {
            let persons : [Person] = try context.fetch(Person.fetchRequest())
            if persons.count > 0{
                for person in persons{
                    let viewModel = PersonViewModel(data: person)
                    viewModelArray.append(viewModel!)
                }
            }
        }catch {
            print("Error fetching data from CoreData")
        }
        return viewModelArray
    }
    
}
