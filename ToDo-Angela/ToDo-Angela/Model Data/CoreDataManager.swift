//
//  CoreDataManager.swift
//  ToDo-Angela
//
//  Created by Павел Грицков on 28.03.23.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    // контекст что-то вроде предварительное облости в которой можно сохранять изменять данные до сохранения
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCategory() {
        do {
            try context.save()
        } catch {
            print("Ошибка в сохранении данных: \(error)")
        }
    }
    
    
    func loadCategory() -> [MyCategory] {
        let request: NSFetchRequest<MyCategory> = MyCategory.fetchRequest()
        do {
            let categoryArray = try context.fetch(request)
            
            return categoryArray
            
        } catch {
            print("Ошибка загрузки данных: \(error)")
        }
        
        return []
    }
}
