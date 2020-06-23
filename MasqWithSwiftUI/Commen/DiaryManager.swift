//
//  DiaryManager.swift
//  MyDiary
//
//  Created by 温蟾圆 on 2020/6/23.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
import CoreData

class DiaryManager: NSObject, ObservableObject {
    
    @Published var willChange = PassthroughSubject<Void, Never>()
    
    var diaries = [Diary]() {
        willSet {
            willChange.send()
        }
    }
    
    static func getAllDiary() -> [Diary] {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Diary", in: managedObjectContext)
        let request = NSFetchRequest<Diary>(entityName: "Diary")
        var result = [Diary]()
        request.fetchOffset = 0
        request.entity = entity
        
        do{
            result = try managedObjectContext.fetch(request)
        } catch {
            _ = error as NSError
        }
        return result.reversed()
    }
    
    static func addArticle(content: String, date: Date) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let newDiary = NSEntityDescription.insertNewObject(forEntityName: "Diary", into: managedObjectContext) as! Diary
        newDiary.content = content
        newDiary.date = date
        do {
            try managedObjectContext.save()
        } catch {
            print("faliure")
        }
        diaries = getAllDiary()
    }
    
    static func getTestData() -> [Diary] {
        removeAllDiary()
        addArticle(content: "有的笑容背后是咬紧牙关的灵魂。", date: Date())
        addArticle(content: "如果多一次选择，你想变成谁？", date: Date())
        addArticle(content: "所谓女权运动的领袖往往就是出卖女权的人。她们所采取的一些理想，原是男人的理想，她们敝舌焦唇以劝告别的女子的，无非是要她们做一些第二级的男子；以女学男，画虎不成反类犬，自然是只好屈居第二级了。", date: Date())
        addArticle(content: "大多数的婚姻的结局是精神上的失望和生理上的剥夺。", date: Date())
        return getAllDiary()
    }
    
    static func removeAllDiary() {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Diary", in: managedObjectContext)
        let request = NSFetchRequest<Diary>(entityName: "Diary")
        request.fetchOffset = 0
        request.fetchLimit = 10
        request.entity = entity
        request.predicate = nil
        
        do {
            let results:[AnyObject]? = try managedObjectContext.fetch(request)
            for diary: Diary in results as! [Diary] {
                managedObjectContext.delete(diary)
            }
            try managedObjectContext.save()
        } catch {
            print("faliure")
        }
        diaries = getAllDiary()
    }
}
