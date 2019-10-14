//
//  ContentView.swift
//  ListCrudOperationsLBTA
//
//  Created by Brian Voong on 9/23/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import SwiftUI

struct PeopleList: View {
    
    @State var people: [Person] = [
        .init(firstName: "Steve",
              lastName: "Jobs", image: #imageLiteral(resourceName: "jobs"), jobTitle: "Founder of Apple"),
        .init(firstName: "Tim", lastName: "Cook", image: #imageLiteral(resourceName: "cook"), jobTitle: "Apple CEO"),
        .init(firstName: "Jony", lastName: "Ive", image: #imageLiteral(resourceName: "ive"), jobTitle: "Head of Design")
    ]
    
    @State var isPresentingAddModal = false
    
    var body: some View {
        NavigationView {
            List(people) { person in
                PersonRow(person: person, didDelete: { p in
                    self.people.removeAll(where: {$0.id == person.id})
                })
            }
            .navigationBarTitle("People")
            .navigationBarItems(trailing: Button(action: {
                print("Trying to add new person")
                self.isPresentingAddModal.toggle()
            }, label: {
                Text("Add")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.all, 12)
                    .background(Color.green)
            }))
            .sheet(isPresented: $isPresentingAddModal) {
                AddModal(isPresented: self.$isPresentingAddModal, didAddPerson: { person in
                    self.people.append(person)
                })
            }
        }
    }
}

struct AddModal: View {
    
    @Binding var isPresented: Bool
    
    @State var firstName = ""
    @State var lastName = ""
    
    var didAddPerson: (Person) -> ()
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text("First name")
                TextField("Enter first name", text: $firstName)
            }
            HStack(spacing: 16) {
                Text("Last name")
                TextField("Enter last name", text: $lastName)
            }
            Button(action: {
                self.isPresented = false
                self.didAddPerson(.init(firstName: self.firstName, lastName: self.lastName, image: UIImage(), jobTitle: "Engineer"))
            }) {
                Text("Add")
                    .foregroundColor(Color.white)
                    .padding(.all, 16)
                    .background(Color.green)
                    
            }
            Button(action: {
                self.isPresented = false
            }) {
                Text("Cancel")
            }
            Spacer()
        }.padding(.all, 16)
    }
    
}

struct PersonRow: View {
    
    var person: Person
    var didDelete: (Person) -> ()
    
    var body: some View {
        HStack {
            Image(uiImage: person.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2))
                        .foregroundColor(Color.black))
                .cornerRadius(60)
            
            VStack (alignment: .leading) {
                Text("\(person.firstName) \(person.lastName)")
                    .fontWeight(.bold)
                Text(person.jobTitle)
                    .fontWeight(.light)
            }.layoutPriority(1)
            
            Spacer()
            
            Button(action: {
                self.didDelete(self.person)
            }, label: {
                Text("Delete")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.all, 12)
                    .background(Color.red)
                    .cornerRadius(3)
            })
            
        }.padding(.vertical, 8)
    }
}
