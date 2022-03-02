//
//  ContentView.swift
//  lesson6.5task
//
//  Created by Javlonbek on 01/02/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    @State var isModel = false
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks, id: \.id) {
                    task in
                    TaskCell(task: task)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailScreen()
            })
            )
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Student List"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
