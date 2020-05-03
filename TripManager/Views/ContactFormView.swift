import SwiftUI

struct ContactFormView: View {
  @Binding var contactFormViewModel: ContactFormViewModel
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(contactFormViewModel: .constant(ContactFormViewModel()))
    }
}
