import SwiftUI
import UIKit

struct TestView : View {
    var body: some View {
        
        NavigationViewController(vc: UIViewController(), title: "UIViewControllerRepresentable")
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
