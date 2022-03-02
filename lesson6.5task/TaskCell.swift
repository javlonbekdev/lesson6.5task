//
//  TaskCell.swift
//  lesson6.5task
//
//  Created by Javlonbek on 01/02/22.
//

import SwiftUI

struct TaskCell: View {
    
    @Environment(\.managedObjectContext) var moc
    var task: Task
    
    var body: some View {
        VStack{
            HStack{
                Text(task.firstName!)
                    .fontWeight(.bold)
                Text(task.lastName!)
                    .fontWeight(.bold)
                Spacer()
                Text(task.gender!)
                    .foregroundColor(.red)
                Button {
                    moc.delete(task)
                } label: {
                    Image(systemName: "trash")
                }
            }.font(.system(size: 13))
            HStack{
                Text(task.phone!)
                Text("|")
                Text(task.email!)
                Spacer()
            }.font(.system(size: 13))
            HStack {
                Text(task.address!)
                    .font(.system(size: 13))
                Spacer()
            }
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task())
    }
}
