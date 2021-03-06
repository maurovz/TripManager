import SwiftUI

struct ContactFormView: View {
  @Binding var contactFormViewModel: ContactFormViewModel
  @State var descriptionTextFieldHeight: CGFloat = 150
  @State var showingValidationAlert = false
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    UITableView.appearance().backgroundColor = .clear
    UITableView.appearance().separatorColor = .lightGray
    return VStack {
      HStack {
        Button("Dismiss") {
          self.presentationMode.wrappedValue.dismiss()
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
      ValidationErrorView(validationErrors: self.$contactFormViewModel.validationErrors)
      HStack {
        Button("Send Report") {
          let errorReport = self.contactFormViewModel.validateFormFields()
          if (errorReport.count) == 0 {
            self.contactFormViewModel.saveReport()
            self.contactFormViewModel.showReportView = false
            self.presentationMode.wrappedValue.dismiss()
          } else {
            self.showingValidationAlert = true
          }
        }.alert(isPresented: $showingValidationAlert) {
            Alert(title: Text("Validation Error"), message: Text("Please make sure textfields are not empty and email in the correct format"), dismissButton: .default(Text("Got it!")))
        }
        
      }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
        .foregroundColor(Color.white)
        .background(Color.red)
        .cornerRadius(8)
      Spacer()
    }
  }
}

struct ValidationErrorView: View {
  @Binding  var validationErrors: [ValidationError]
  var body: some View {
    ForEach(validationErrors, id: \.fieldName) { error in
      Text(error.validationMessage)
    }
    
  }
}

struct ContactFormView_Previews: PreviewProvider {
  static var previews: some View {
    ContactFormView(contactFormViewModel: .constant(ContactFormViewModel()))
  }
}
