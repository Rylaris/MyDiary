//
//  EditorView.swift
//  MasqWithSwiftUI
//
//  Created by 温蟾圆 on 2020/6/18.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import SwiftUI
import UIKit

struct NavigationViewController: UIViewControllerRepresentable {
    
    var vc: UIViewController
    var title: String

    func makeUIViewController(context: Context) -> UIViewController {
        return vc
    }

    func updateUIViewController(_ navigationController: UIViewController, context: Context) {
        
    }
}


struct EditorView: View {
    var body: some View {
        NavigationViewController(vc: EditorViewController(), title: "UIViewControllerRepresentable")
    }
//    @State var text = ""
//
//    var title = Text(DateManager.formatterDate(date: Date(), with: "M月dd日"))
//
//    var body: some View {
//        VStack(alignment: .center) {
//            TextField("", text: $text)
//                .font(.system(size: 20))
//                .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        }
//        .padding(.all, 50.0)
//        .navigationBarTitle(title, displayMode: .inline)
//    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView()
    }
}


