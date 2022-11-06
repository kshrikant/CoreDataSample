//
//  Person+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var gender: String?
    @NSManaged public var hairColor: String?
    @NSManaged public var height: String?
    @NSManaged public var mass: String?
    @NSManaged public var name: String?

    func parseWith(response:[String:Any]){
        self.name = response["name"] as? String
        self.gender = response["gender"] as? String
        self.hairColor = response["hair_color"] as? String
        self.mass = response["mass"] as? String
        self.height = response["height"] as? String
    }
}
