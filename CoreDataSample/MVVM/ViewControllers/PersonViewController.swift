//
//  PersonViewController.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import UIKit

class PersonViewController: UITableViewController {
    
    fileprivate let viewModel = PersonViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Persons"
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self.viewModel
            DataBaseManger.savePersonsToDb {
            let persons = DataBaseManger.loadPersonsFromDb()
            self.viewModel.refreshWith(persons: persons, {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
}
