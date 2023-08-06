//
//  ToDoViewController.swift
//  ToDo-Angela
//
//  Created by Павел Грицков on 22.03.23.
//

/*
 Ctrl + A – в начало строки

 Ctrl + E – в конец строки

 Ctrl + T – поменять местами символы, прилегающие к курсору

 Ctrl + K – удалить строку

 Ctrl + L – курсор в центр строки
 
 Cmd + L - перейти на строку
 */

import UIKit
import CoreData

class ToDoViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Item - CoreData type
    var itemsArray: [Item] = []
    
    // MyCategory - CoreData type
    var selectedCategory: MyCategory? {
        didSet {
            loadItems()
        }
    }

    // создаем ссылку на контекст
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - UITableViewDataSorce
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.ItemIdentifier, for: indexPath)
        
        let item = itemsArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // добавляет аксесуар для ячейки ✅
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row = indexPath.row
        
        /*
        // после удаления нам нужно сохранить изменения saveItems() иначе ничего не произойдет
        context.delete(itemsArray[row])
        // вместо отметки мы удаляем обьект из массива
        itemsArray.remove(at: row)
         */
        
        // меняет значение при нажатии на кнопку на противоположное
        itemsArray[row].done = !itemsArray[row].done
        
        saveItems()
        
        // deselectRow - получается прикольный эффект ячека сначала выделяется, потом выделение пропадает (как анимация нажатия)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        /*
         Еще один вариат сделать локальную переменную в
         которой можно сохранить textField
         let localTextField = UITextField()
         таким образом значения можно передать в кложур UIAlertAction
        */
        
        let alert = UIAlertController(title: K.Alert.title, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: K.Alert.actionTitle, style: .default) { [weak alert] action in
            // кложур вызывается в момент нажатия на кнопку
            // Force unwrapping because we know it exists.
            let text = alert?.textFields![0].text ?? ""
            if text != "" {

                let newItem = Item(context: self.context)
                newItem.title = text
                newItem.done = false
                // указываем родительскую категорию
                newItem.parentCategory = self.selectedCategory
                self.itemsArray.append(newItem)
                
                self.saveItems()
            }
        }
        alert.addTextField { textField in
            // это кложур срабатывает в момент добавления textField в алерт
            // потому мы не увидем значения textField при печате в нем
            textField.placeholder = "Create new item"
//            localTextField = textField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: - Save and load data
    
    /// Сохранения данных CoreData
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Ошибка в сохранении данных: \(error)")
        }
        tableView.reloadData()
    }
    
    
    /// Загружает сохраненные данные CoreData
    /// - Parameter request: Запрос с параметром по умолчанию который просто делает запрос данных
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        
        // добавляем предикат (логическое условие или фильтрацию) для запроса
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let predicate {
            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, predicate])
            request.predicate = compoundPredicate
        } else {
            request.predicate = categoryPredicate
        }
        
        do {
            // сохраняем результаты внутри нашего массива
            itemsArray = try context.fetch(request)
        } catch {
            print("Оштбка загрузки данных: \(error)")
        }
        tableView.reloadData()
    }
    
    deinit {
        print("deinit")
    }
}

// MARK: - UISearchBarDelegate

extension ToDoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//      NSPredicate(format: <#T##String#>, <#T##args: CVarArg...##CVarArg#>) - этот метод
        
        // сортировка в алфавитном порядке
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        loadItems(with: request, predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // если строка поиска пустрая то загружает сохраненные данные
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

