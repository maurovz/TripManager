import SwiftUI

struct ContactFormView: View {
  @Binding var contactFormViewModel: ContactFormViewModel
  @State var isPresented: Bool = false
  @State var descriptionTextFieldHeight: CGFloat = 150
  
  var body: some View {
    UITableView.appearance().backgroundColor = .clear
    UITableView.appearance().separatorColor = .lightGray
    return VStack {
      HStack {
        Button("Dismiss") {
          self.isPresented = false
        }
      }
      Text("Report an issue with the app")
        .font(.title)
        .padding()
      Form {
        TextField("Enter your name", text: self.$contactFormViewModel.name)
        TextField("Enter your surname", text: self.$contactFormViewModel.surname)
        TextField("Enter your email", text: self.$contactFormViewModel.email)
        TextField("Enter your phone (Optional)", text: self.$contactFormViewModel.phone)
        VStack {
          Text("Please describe your problem")
          TextView(
            text: self.$contactFormViewModel.description
          )
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: descriptionTextFieldHeight, maxHeight: .infinity)
        }
      }
      
      HStack {
        Button("Send Report") {
                      self.contactFormViewModel.saveReport()
                      self.isPresented = false
        }
        
      }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
        .foregroundColor(Color.white)
        .background(Color.red)
        .cornerRadius(8)
      Spacer()
    }
  }
}

struct ContactFormView_Previews: PreviewProvider {
  static var previews: some View {
    ContactFormView(contactFormViewModel: .constant(ContactFormViewModel()))
  }
}
