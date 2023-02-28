//
//  MyCart.swift
//  FurnitureApp
//
//  Created by Prince on 28/02/23.
//

import SwiftUI

struct MyCart: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    HStack {
                        Image(systemName: "person")
                        VStack{
                            Text("Shart")
                            Text("$ 582")
                                .font(.subheadline)
                                //.color(.gray)
                        }
                    }
               }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("three"))
        }
        
      

    }
}

struct MyCart_Previews: PreviewProvider {
    static var previews: some View {
        MyCart()
    }
}

