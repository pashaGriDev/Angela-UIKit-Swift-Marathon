/*
 FileManager - может работать с пользовательским типом данных который соотвествует протоколу Codable.
 Формат сохранения это .plist (xml).
 Не стоит сохранять большой обьем информации, до 150кб
 */

import Foundation

class DataFileManager {
    static let shared = DataFileManager()
    
    private init() {}
    
    // создаем путь к файлу
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension(K.itemsFileName)
    
    /// сохраняет массив данных.
    /// массив данных должен быть соотвествовать протоколу Codable
    func saveData(_ items: [MyItem]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath!)
        } catch {
            print("Ошибка сохранения данных FileManager: \(error)")
        }
    }
    
    /// загружает и возвращает массив данных или пустой массив
    func loadData() -> [MyItem] {
        let decoder = PropertyListDecoder()
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            do {
                let items = try decoder.decode([MyItem].self, from: data)
                
                return items
            } catch {
                print("Ошибка загрузки данных FileManager: \(error)")
            }
        }
        return []
    }
}

