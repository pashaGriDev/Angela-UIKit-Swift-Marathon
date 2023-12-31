//
//  CategoryViewController.swift
//  ToDo-Angela
//
//  Created by Павел Грицков on 26.03.23.
//

import UIKit
import CoreData

/*
 Сталкнулся с проблемой что xcode  не мог найти MyCategory (CoreData Emtity)
 Регение - закрыть и снова откруть xcode
 */

class CategoryViewController: UITableViewController {
    
    var categoryArray: [MyCategory] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryArray = CoreDataManager.shared.loadCategory()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: K.Alert.title, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: K.Alert.actionTitle, style: .default) {[weak alert] action in
            let text = alert?.textFields?.first?.text ?? ""
            
            if text == "" { return }
            
            let newCategory = MyCategory(context: self.context)
            newCategory.name = text
            self.categoryArray.append(newCategory)
            CoreDataManager.shared.saveCategory()
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Create new item"
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    deinit {
        print("deinit")
    }
}

// MARK: - UITableViewDataSource

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.categoryIdentifier, for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         tableView.deselectRow(at: indexPath, animated: true)
         некоректно работает с методом
         tableView.indexPathForSelectedRow
         при переходе indexPath == nil
         */
        
        performSegue(withIdentifier: K.segue.items, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
}
