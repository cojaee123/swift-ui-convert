//
//  ContentView.swift
//  convert
//
//  Created by Chalermchon COJ on 12/10/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
     
    //ตัวแปรแทนน้ําหนัก ส่วนสูงและผลการแปลค่า BMI
     @State var myWeight : String = ""
     @State var myHeight : String = ""
     @State var myBMIResult : String = ""
    @State var myWeightN : String = ""
    @State var myHeightN : String = ""
    
     //ตัวแปรแทนการตรวจสอบการแจ้งเตือนในกรณีที่ผู้ใช้กรอกข้อมูลไม่ครบถ้วน
     @State var showAlert : Bool = false
    //ฟังก์ชันทําการซ่อน Keyboard
     private func hideKeyboard(){
     let myScenes = UIApplication.shared.connectedScenes
     let windowScene = myScenes.first as? UIWindowScene
     windowScene?.windows.forEach({ $0.endEditing(true)})
     }
     //ฟังก์ชันทําการตรวจสอบข้อมูลนําเข้า
     private func checkInput(){
     if ((Double(self.myWeight) != nil) && (Double(self.myHeight) != nil)){
     self.bmiCalculationMethod()
     }
     else{
     self.showAlert = true
     }
     }
    
     private func bmiCalculationMethod() {
         let myWeightN = Double(self.myWeight)! * 2.204
     let myHeightN = Double(self.myHeight)! * 0.0328
     let myBMIResult = ""
  
     }
    var body: some View {
        //กําหนดสีพื้นหลังหน้าจอด้วย ZStack
         ZStack{
         Color.init(red: 239.0/255.0, green: 244.0/255.0, blue: 244.0/255.0)
         VStack {
             Text("แปลงค่า")
              .font(.title)
              .fontWeight(.bold)
              .offset(y:0)
              .padding(.bottom, 0)
             HStack{
                 Text("Weight (กก):")
                     .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                     .background(Color.white)
                     .offset(y : 20)
                     .keyboardType(.decimalPad)
                 TextField("น้ําหนัก(กก)", text: $myWeight)
                          .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                          .background(Color.white)
                          .offset(y : 20)
                          .keyboardType(.decimalPad)
             }
             HStack{
                 Text("Height(ซม):")
                     .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                     .background(Color.white)
                     .offset(y : 20)
                     .keyboardType(.decimalPad)
                 
                 TextField("ส่วนสูง", text: $myHeight)
                     .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                     .background(Color.white)
                     .offset(y : 25)
                     .keyboardType(.decimalPad)
             }
        HStack{
         Button(action: {
         self.checkInput()
         self.hideKeyboard()
         } ) {
         Text("แปลงค่า")
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
         .background(Color.gray)
         .foregroundColor(Color.white)
         }
         .alert(isPresented: $showAlert) { () -> Alert in
         return Alert(title: Text("BMICalculator"), message: Text("กรุณากรอกข้อมูลให้ครบถ้วน"), primaryButton: .cancel(Text("ปิดหน้าต่าง")), secondaryButton: .default(Text("เคลียร์ข้อมูล"), action: {
             self.myWeight = ""
         self.myHeight = ""
         self.myBMIResult = ""
         }))
         }
                 Button(action: {
         self.myWeight = ""
         self.myHeight = ""
         self.myBMIResult = ""
         }) {
         Text("เคลียร์แบบฟอร์ม")
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
         .background(Color.gray)
         .foregroundColor(Color.white)
         }
         }
         .offset(y : 35)

         //ส่วนของการแสดงผล BMI
         Text("\(myBMIResult)")
             
             VStack {
                 Text("ผลลัพธ์การแปลงค่า")
                     .font(.title)
                     .fontWeight(.bold)
                     .offset(y:0)
                     .padding(.bottom, 0)
                 HStack{
                     Text("Weight (ปอนด์):")
                         .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                         .background(Color.white)
                         .offset(y : 20)
                         .keyboardType(.decimalPad)
                     Text("\(myWeightN)")
                 }
                 HStack{
                     Text("Height(ฟุต):")
                         .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                         .background(Color.white)
                         .offset(y : 20)
                         .keyboardType(.decimalPad)
                     Text("\(myHeightN)")

                 }
                 
             }
             
         .lineLimit(nil)
         .multilineTextAlignment(.leading)
                 .frame(minWidth: 0, maxWidth: .infinity)
         .offset(y : 50)

         Spacer()
         }
         .padding(.horizontal, 15)
         .navigationBarTitle("คํานวณค่า BMI")
         }
         .onTapGesture {
         self.hideKeyboard()
         }
         
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
