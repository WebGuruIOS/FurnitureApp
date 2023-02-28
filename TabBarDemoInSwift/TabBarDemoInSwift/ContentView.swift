//
//  ContentView.swift
//  TabBarDemoInSwift
//
//  Created by Prince on 17/02/23.
//

import SwiftUI


struct HomeView: View{
    
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                
                                .animation(nil, value: tabSelected)
                        }
                        .tag(tab)
                        
                    }
                }
            }
            VStack {
                 Spacer()
                CustomTabBar(selectedTab: $tabSelected)
            }
        }
    }
/*
    var body: some View{
        NavigationView{
            ZStack{
                Color.pink
            }
            .navigationTitle("Home")
        }
    }
}

struct ProfileView: View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.blue
            }
            .navigationTitle("Profile")
        }
    }
}

struct SettingsView: View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.purple
            }
            .navigationTitle("Settings")
        }
    }
}




struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
            }
            
            
            
        }
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
