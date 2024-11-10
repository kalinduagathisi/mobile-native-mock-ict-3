//
//  CustomTabView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var selectedCurrencyType: Currencies = .usd
    
    var body: some View {
        HStack {
            // tab view
            TabView {

                // home view
                HomeView(selectedCurrencyType: $selectedCurrencyType)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                // settings view
                SettingsView(selectedCurrencyType: $selectedCurrencyType)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }

    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
