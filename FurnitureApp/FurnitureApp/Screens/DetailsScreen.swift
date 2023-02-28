//
//  DetailsScreen.swift
//  FurnitureApp
//
//  Created by Prince on 22/02/23.
//

import SwiftUI

struct DetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
                //.navigationBarBackButtonHidden(true)
               
            ScrollView (.vertical, showsIndicators: false){
              VStack {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(1,contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                   // .aspectRatio(contentMode: .fit)
                   
               DiscriptionView()
                   // .offset(y: -40)
             }
              .edgesIgnoringSafeArea(.top)
            
                HStack {
                    Text("$ 1250")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    
                   // Text("Add to Cart")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color("Primary"))
//                        .padding()
//                        .padding(.horizontal, 8)
//                        .background(Color.white)
//                        .cornerRadius(10.0)
                    
                  //  NavigationView{
                        Button(action: {}, label: {
                            Text("Add to Cart")
                                .padding()
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(10.0)
                        })
//                        NavigationLink(destination: MyCart, label: {
//                            print("")
//                        })
                        
                   // }
                    
                   
                }
                .padding()
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
           }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("three"))
            
        }
    }
    
  
}


// For one side cornerRedius

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}


struct ColorView: View {
    var color: Color
    var body: some View {
            color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DiscriptionView : View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Luruxy Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            
            // Size Work
            
            HStack (alignment: .top) {
                VStack (alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            // Color and Counter work
           
            HStack (alignment: .bottom) {
                VStack (alignment: .leading){
                    Text("Color")
                        .fontWeight(.semibold)
                    HStack {
                        ColorView(color: .white)
                        ColorView(color: .black)
                        ColorView(color: .red)
                        ColorView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack (alignment: .leading){
                    Text("Quantit")
                        .fontWeight(.semibold)
                    // Minus Button
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        // Plus Button
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        //.frame(width: 30, height: 30)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
                
                
            }
            
        }
        .padding(.top)
        .padding()
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
        //.cornerRadius(40.0)
    }
}


struct BackButtonView: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
