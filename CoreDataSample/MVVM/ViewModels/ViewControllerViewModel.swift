//
//  PersonViewControllerViewModel.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import Foundation
import UIKit


class PersonViewControllerViewModel: NSObject {
    
    var persons = [PersonViewModel]()
    func refreshWith(persons: [PersonViewModel], _ completionBlock : @escaping ()->()) {
        self.persons = persons
        completionBlock()
    }
}

extension PersonViewControllerViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath as IndexPath) as! PersonCell
        let personViewModel = self.persons[indexPath.row]
        cell.configure(personViewModel)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
}
