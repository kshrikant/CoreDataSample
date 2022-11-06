//
//  PersonViewModel.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import UIKit

class PersonViewModel: NSObject {
    
    var gender: String?
    var name: String?
    var hairColor: String?
    var height: String?
    var mass: String?

    init?(data: Person) { 
        self.name = data.name
        self.gender = data.gender
        self.hairColor = data.hairColor
        self.height = data.height
        self.mass = data.mass
    }
}
