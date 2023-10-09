////
////  SwiftUIView.swift
////  selfCheck
////
////  Created by Abdulaziz Jamaleddin on 10/4/23.
////
//
//import SwiftUI
//
//struct SwiftUIView: View {
//    var date = Date().formatted(date: .numeric, time: .omitted)
//    var body: some View {
//        Text("\(date)")
//    }
//    func readDailyTasks() -> [DailyTask] {
//        let currentDate = Date()
//        let lastStoredDate = DirectoryService.readDateFromDisk()
//        if lastStoredDate < currentDate {
//            //filter the completed dateStyle
//            //resave the dates
//        }
//        let components = DateComponents(calendar: .autoupdatingCurrent, year: <#T##Int?#>, month: <#T##Int?#>, day: <#T##Int?#>)
//        Calendar.autoupdatingCurrent.date(storedDate, matchesComponents: <#T##DateComponents#>)
//        
//        return try DirectoryService.readModelFromDisk()
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}
//
//if (Date() < (Date().formatted(date: .numeric, time: .omitted)))
//{
//    filter 0.iscompleted
//    
//}
