//
//  ContentView.swift
//  selfCheck
//
//  Created by Abdulaziz Jamaleddin on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var taskPopup = false
    @State var taskInput: String = ""
    @State var overlay = false

    @State var tasks : [dailyTask] = []
    func breatheAction(){
        overlay.toggle()
    }
    func readTasks(model: [dailyTask])-> [dailyTask]{
        do {
            return try DirectoryService.readModelFromDisk()
            
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    func removeTask(at index: Int) {
        tasks.remove(at: index)
        do {
            try DirectoryService.writeModelToDisk(tasks)
            
        } catch {
            print(error.localizedDescription)
        }
    }

    func addTask(){
        if (!taskInput.isEmpty){
            tasks.append(dailyTask(taskGut: taskInput, isCompleted: false))
            taskInput=""
            
            do {
                try DirectoryService.writeModelToDisk(tasks)
                
            } catch {
                print(error.localizedDescription)
            }}
        
    }
    var body: some View {
        
        VStack {
            HStack{
                Image("logoLight").resizable().scaledToFit().frame(width: 50,height: 50)
                Spacer()
                if(overlay){}
                else{
                    Button{
                        taskPopup.toggle()
                    } label: {
                        Label("Add", systemImage: "plus").font(.system(size: 22)).foregroundColor(.blue)            }
                    .alert("Enter New Task", isPresented: $taskPopup) {
                        TextField("Enter Task", text: $taskInput)
                        Button("Ok", action: addTask)
                        //                        .disabled(taskInput.isEmpty)
                        //                    Text(taskInput)
                        Button("Cancel",role: .cancel, action: {} )
                        
                    }                }
//                    T
                
                
            }.padding([.leading,.trailing],7)
            Divider()
            
            HStack {
                Text("Self Check")
                    .font(.system(size:30)).bold().padding(.leading,5)
                
                Spacer()
            }
            VStack
            {
                if (tasks.isEmpty){
                    Image("placeholderList").resizable().scaledToFit()
                    
                }
                else{
                    List{
                        ForEach(tasks.indices, id: \.self) { task in
                            HStack {
                                
                                Button(action: {
                                    tasks[task].isCompleted.toggle()
                                    do {
                                        try DirectoryService.writeModelToDisk(tasks)
                                        
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                                ) {
                                    Image(systemName: tasks[task].isCompleted ? "checkmark.square.fill" : "square")
                                }
                                // [dailyTask(taskGut: taskInput, isCompleted: false),dailyTask(taskGut: taskInput, isCompleted: false),dailyTask(taskGut: taskInput, isCompleted: false),dailyTask(taskGut: taskInput, isCompleted: false),dailyTask(taskGut: taskInput, isCompleted: false)]
                                .buttonStyle(.bordered)
                                .tint(.clear)
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                
                                Text(tasks[task].taskGut).padding(.leading,10)
                            }
                            
                            .swipeActions {
                                Button(action: {
                                    removeTask(at: task)
                                }) {
                                    Label("", systemImage: "trash")
                                }
                                .tint(.red)
                            }
                        }
                        
                    } .cornerRadius(25).shadow(radius: 3)
                    
                    
                        .font(.system(size:20))
                        .listStyle(.plain)
                        .listStyle(.insetGrouped)
                }
            }.frame(maxHeight:1500)
            @State var progresser = (Float(tasks.filter{$0.isCompleted}.count)/Float(tasks.count))
            if (tasks.isEmpty){
                HStack{
                    
                    ZStack {
                        RoundedRectangle( cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(height:50).foregroundColor(.white).shadow(radius:30, x: 0,y:10)
                        
                        HStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width:0,height:38).foregroundColor(.blue).padding(.leading,8)
                            Spacer()
                        }
                        
                    }
                }                .padding(.bottom,20)

            }else{
                HStack{
                    
                    ZStack {
                        RoundedRectangle( cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(height:50).foregroundColor(.white).shadow(radius:30, x: 0,y:10)
                        
                        HStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width:(CGFloat(progresser)*360),height:38).foregroundColor(.blue).padding(.leading,8).shadow(radius: 20)
                            Spacer()
                        }
                        
                    }
                }                .padding(.bottom,20)

            }
            
            HStack{
                Button(action:{
                    breatheAction()
                }
                ){
                    if(overlay){}
                    else{
                        breatheView()
                    }
//                    Text("Breathe")
//                        .font(.system(size: 30))
//                        .frame(width: 150,height: 150)
//
//                        .foregroundColor(.white)
//                        .background(
//                            Image("cloudButton")
//                                .resizable()
//                                .frame(width: 300,height: 300)
//
//                                .scaledToFit()
//                                .clipShape(Circle()))
                }
//                .buttonStyle(PlainButtonStyle())
                
            }.frame(width: 150,height: 150)
            
            Spacer()
        }.sheet(isPresented: $overlay) {
            
            
            
            ZStack{
                
                ZStack{
                    VStack{
                        HStack{
                            Spacer()
                            Button{
                                overlay.toggle()
                            } label: {
                                Label("Dismiss", systemImage: "xmark.circle").font(.system(size: 22)).foregroundColor(.blue)            }
                            .padding(.top,15)
                            
                        }
                Spacer()
                    }
                    breathAnimation()
                }.padding([.leading,.trailing],20)
                    .presentationDetents([ .large])
                    .presentationBackground(Color.gray.opacity(0.6))
                    .presentationBackgroundInteraction(.enabled)
                    
            }
        }
//    content: {
//            
//        }
        
        .onAppear {
//            if (overlay){
//
//            }
            //            if (){
            //
            //            }else{
            tasks=readTasks(model: tasks)
        }        .padding([.trailing,.leading],8)

      
        
    }
}


#Preview {
    ContentView()
}
