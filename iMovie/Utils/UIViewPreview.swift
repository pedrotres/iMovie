//
//  UIViewPreview.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    func makeUIView(context: Context) -> View {
        return view
    }

    func updateUIView(_ uiView: View, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

@available(iOS 13.0, *)
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {

        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    public var preview: some View {
        return Preview(viewController: self)
    }
}
#endif
