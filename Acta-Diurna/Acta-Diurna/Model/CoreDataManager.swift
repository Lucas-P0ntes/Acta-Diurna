//
//  CoreDataManager.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//


import Foundation
import CoreData

class CoreDataManager {
    // Singleton instancia
    static let shared = CoreDataManager()

    // MARK: Carregar Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Acta_Diurna")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Erro ao carregar o core data: \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: Salvar Contexto
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Erro ao salvar o contexto: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

