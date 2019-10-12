//
//  AppDelegate.swift
//  MVVMObservedObjectsLBTA
//
//  Created by Saul Moreno on 9/25/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let price: Int
}

class CoursesViewModel: ObservableObject {
    
    @Published var courses: [Course] = [
        .init(name: "Course 1", price: 0),
        .init(name: "Course 2", price: 0),
        .init(name: "Course 3", price: 0)
    ]
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // make sure to check error / resp
            
            DispatchQueue.main.async {
                do {
                    self.courses = try JSONDecoder().decode([Course].self, from: data!)
                } catch {
                    print("Failed to decode JSON:", error)
                }
            }
            
        }.resume()
    }
    
}

struct ContentView: View {
    
    @ObservedObject var coursesVM = CoursesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(coursesVM.courses) { course in
                        HStack {
                            Text(course.name)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }.padding(.bottom, 4)
                        Text("Price: $\(course.price)")
                        .padding(.bottom, 16)
                    }
                }.padding(.horizontal, 22)
                    .padding(.top, 8)
                
                
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                print("Fetching json data")
                
                self.coursesVM.fetchCourses()
                
            }, label: {
                Text("Fetch Courses")
            }))
        }
    }
}
