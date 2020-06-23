//
//  ContentView.swift
//  MasqWithSwiftUI
//
//  Created by 温蟾圆 on 2020/6/17.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var isPresent = false
    @State var text = ""
    
    var editorView = EditorView()
    
    @State var diaries: [Diary] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(diaries) { diary in
                    NavigationLink(destination: Text(diary.content!)) {
                        VStack(alignment: .leading) {
                            Text(DateManager.formatterDate(date: diary.date!))
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                                .padding(.top, 10.0)
                            Text(diary.content!)
                                .padding(.vertical, 10.0)
                        }
                    }
                }
                
                NavigationLink(destination: editorView) {
                    HStack {
                        TextField("你想说什么", text: $text)
                            .font(.body)
                            .environment(\.isEnabled, false)
                        Image(systemName: "pencil")
                            .font(.system(size: 20))
                            .foregroundColor(Color.gray)
                    }
                    .padding(20.0)
                    .background(Color("lightGray"))
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .shadow(radius: 10)
//                    .onTapGesture {
//                        self.isPresent.toggle()
//                    }
//                    .sheet(isPresented: $isPresent, content: {
//                        EditorView()
//                    })
                }
                .padding(.bottom, 20.0)
            }
            .navigationBarTitle("笔记", displayMode: .large)
        }.onAppear(perform: {
            withAnimation(.default, {
                self.diaries = DiaryManager.getAllDiary()
            })
        })

    }
    
    init(diaries: [Diary]) {
        if !diaries.isEmpty {
            self.diaries = diaries
        } else {
            self.diaries = DiaryManager.getTestData()
            DiaryManager.removeAllDiary()
        }
        UITableView.appearance().tableFooterView = UIView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(diaries: DiaryManager.getTestData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            ContentView(diaries: DiaryManager.getTestData())
                .environment(\.colorScheme, .dark)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        }
    }
}
