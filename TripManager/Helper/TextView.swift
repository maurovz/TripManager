import SwiftUI

struct TextView: UIViewRepresentable {
  @Binding var text: String
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> UITextView {
    let customTextView = UITextView()
    customTextView.delegate = context.coordinator
    customTextView.isScrollEnabled = true
    customTextView.isEditable = true
    customTextView.isUserInteractionEnabled = true
    customTextView.backgroundColor = .white
    return customTextView
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }
  
  class Coordinator : NSObject, UITextViewDelegate {
    var parent: TextView
    
    init(_ uiTextView: TextView) {
      self.parent = uiTextView
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
      return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
      self.parent.text = textView.text
    }
  }
}
