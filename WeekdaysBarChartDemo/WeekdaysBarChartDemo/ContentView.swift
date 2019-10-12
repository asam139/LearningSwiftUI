//
//  ContentView.swift
//  WeekdaysBarChartDemo
//
//  Created by Saul Moreno Abril on 12/10/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct DayDataPoint: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct ContentView: View {
    
    static let data: [DayDataPoint] = [
        .init(day: "Su", value: 0.2),
        .init(day: "M", value: 0.5),
        .init(day: "T", value: 0.3),
        .init(day: "W", value: 0.8),
        .init(day: "TH", value: 0.7),
        .init(day: "F", value: 0.4),
        .init(day: "Sa", value: 1.0),
    ]
    
    static let afternoonData: [DayDataPoint] = [
        .init(day: "Su", value: 0.1),
        .init(day: "M", value: 0.6),
        .init(day: "T", value: 0.2),
        .init(day: "W", value: 0.3),
        .init(day: "TH", value: 0.4),
        .init(day: "F", value: 0.9),
        .init(day: "Sa", value: 0.5),
    ]
    
    static let eveningData: [DayDataPoint] = [
        .init(day: "Su", value: 0.9),
        .init(day: "M", value: 0.4),
        .init(day: "T", value: 0.3),
        .init(day: "W", value: 0.3),
        .init(day: "TH", value: 0.5),
        .init(day: "F", value: 0.2),
        .init(day: "Sa", value: 0.1),
    ]
    
    @State var dataSet = [
        data, afternoonData, eveningData
    ]
    
    
    //[0.2, 0.5, 0.3, 0.8, 0.7, 0.4, 1.0]
    
    var spacing: CGFloat = 24
    
    @State var selectedTime = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.sRGB, red: 94/255, green: 244/255, blue: 198/255, opacity: 1)
                    .edgesIgnoringSafeArea(.all)
                VStack (spacing: 16) {
                    Spacer()
                    Text("Calory Intake")
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 14/255, green: 75/255, blue: 58/255))
                        .padding(.bottom, 0)
                    
                    SegmentedControl(selectedIndex: self.$selectedTime)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                    
                    HStack (spacing: self.spacing) {
                        // WARNING: Don't use a ForEach here, it doesn't animate.
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][0], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][1], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][2], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][3], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][4], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][5], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][6], width: (geometry.size.width - 8 * self.spacing) / 7)
                    }.transition(.opacity)
                    Spacer()
                }
            }
        }
    }
}

struct StackedBarView: View {
    var dataPoint: DayDataPoint
    var width: CGFloat
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule()
                    .frame(width: width, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 20).fill(Color(.sRGB, red: 74/255, green: 231/255, blue: 184/255)))
                Capsule()
                    .frame(width: width, height: dataPoint.value * 200)
                    .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                
            }.padding(.bottom, 8)
            Text(dataPoint.day)
                .font(.system(size: 14))
        }
        
    }
}

struct SegmentedControl: UIViewRepresentable {
    
    @Binding var selectedIndex: Int
    
    func makeCoordinator() -> SegmentedControl.Coordinator {
        return Coordinator(parent: self)
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: UIViewRepresentableContext<SegmentedControl>) {
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<SegmentedControl>) -> UISegmentedControl {
        let sc = UISegmentedControl(items: ["Morning", "Afternoon", "Evening"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(context.coordinator, action: #selector(Coordinator.handleValueChange), for: .valueChanged)
        return sc
    }
    
    class Coordinator: NSObject {
        let parent: SegmentedControl
        init(parent: SegmentedControl) {
            self.parent = parent
        }
        
        @objc func handleValueChange(control: UISegmentedControl) {
            withAnimation(.default, {
                self.parent.selectedIndex = control.selectedSegmentIndex
            })
            
        }
    }
    
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
