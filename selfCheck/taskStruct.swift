//
//  taskStruct.swift
//  selfCheck
//
//  Created by Abdulaziz Jamaleddin on 10/3/23.
//

import Foundation

struct dailyTask:  Hashable,Codable {
    var taskGut: String
    var isCompleted:Bool
}
final class DirectoryService {
    public static func readModelFromDisk<T: Decodable>() throws -> [T]{
        let directory = try FileManager.default
            .url(for: .documentDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
        let encodedModels = try Data(contentsOf: directory.appendingPathComponent("\(T.self).json"))
        let decodedModels = try JSONDecoder()
            .decode([T].self, from: encodedModels)
        return decodedModels
    }
    
    public static func writeModelToDisk<T:Encodable>(_ models: [T]) throws {
        let directory = try FileManager.default
            .url(for: .documentDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
        try JSONEncoder()
            .encode(models)
            .write(to: directory.appendingPathComponent("\(T.self).json"))
    }
    
    public static func writeSingleElementToDisk<T:Encodable>(_ element: T) throws {
        let directory = try FileManager.default
            .url(for: .documentDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
        try JSONEncoder()
            .encode(element)
            .write(to: directory.appendingPathComponent("\(T.self).json"))
    }
    public static func readSingleElementFromDisk<T: Decodable>() throws -> T{
        let directory = try FileManager.default
            .url(for: .documentDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
        let encodedModels = try Data(contentsOf: directory.appendingPathComponent("\(T.self).json"))
        let decodedModels = try JSONDecoder()
            .decode(T.self, from: encodedModels)
        return decodedModels
    }
}
//func readDate() -> Date {
//    do {
//        return try DirectoryService.readElementFromDisk()
//    } catch {
//        return Date()
//    }
//}
//
//var oldDate = readDate()
//
//
//let oldComponents = Calendar.autoupdatingCurrent.dateComponents([.year,.month,.day], from: oldDate)
//let oldFormattedDate = Calendar.autoupdatingCurrent.date(from: oldComponents) ?? Date()
//
//
//let currentComponents = Calendar.autoupdatingCurrent.dateComponents([.year,.month,.day], from: currentDate)
//let currentFormattedDate = Calendar.autoupdatingCurrent.date(from: currentComponents) ?? Date()
//
///// if we're in a new date
//if oldFormattedDate > currentFormattedDate {
//    DirectoryService.save(oldFormattedDate)
//    //filter old dates
//} else {
//    // nothing
//}
