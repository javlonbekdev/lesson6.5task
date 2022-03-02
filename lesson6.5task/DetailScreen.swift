//
//  DetailScreen.swift
//  lesson6.5task
//
//  Created by Javlonbek on 01/02/22.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var firstName = ""
    @State var lastName = ""
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    @State var gender = ""
    let genders = ["Male", "Female"]
    
    func saveTask(firstName: String, lastName: String, phone: String, email: String, address: String, gender: String){
        let task = Task(context: self.moc)
        task.id = UUID()
        task.firstName = firstName
        task.lastName = lastName
        task.phone = phone
        task.email = email
        task.address = address
        task.gender = gender
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Firstname", text: $firstName)
                    TextField("Lastname", text: $lastName)
                    Picker("Gender", selection: $gender) {
                        ForEach(genders, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
                
            }
            .navigationBarItems(trailing: Button(action: {
                saveTask(firstName: firstName, lastName: lastName, phone: phone, email: email, address: address, gender: gender)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            }))
            .navigationBarTitle("Add Student", displayMode: .inline)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
