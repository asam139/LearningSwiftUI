//
//  HeightAnimationView.swift
//  WeekdaysBarChartDemo
//
//  Created by Brian Voong on 9/29/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import SwiftUI

struct HeightAnimationView: View {
    
    @State var barHeight: CGFloat = 200
    @State var index = 0
    
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
    
    var body: some View {
        VStack {
            
            HStack (alignment: .bottom) {
                Capsule().frame(width: 20, height: 100 * dataSet[index][0].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][1].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][2].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][3].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][4].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][5].value)
                Capsule().frame(width: 20, height: 100 * dataSet[index][6].value)
            }
            
//            HStack {
//                ForEach(dataSet[index]) { data in
//                    Capsule().frame(width: 50, height: 100 * CGFloat(self.index))
//                }
//            }
            
            
            SegmentedControl(selectedIndex: $index)
        }
    }
}
