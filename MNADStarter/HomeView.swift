//
//  ContentView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

struct HomeView: View {

    // Dictionary to get the rate agains the LKR for a given currency
    let rates = [
        "USD": 308.81,
        "GBP": 390.31,
        "AUD": 204.40,
        "CAD": 232.82,
        "EUR": 334.92,
    ]

    @State private var tf1 = ""
    @State private var tf2 = ""
    @Binding var selectedCurrencyType: Currencies
    @State private var isToggleOn = false

    // SAMPLE INIT to demonstrate usage of caseiterable enums
    //    init() {
    //        let listOfCurrencies = Currencies.allCases  // [.usd, .gbp]
    //        let stringValueOfUSD = listOfCurrencies[0].rawValue  // "USD"
    //        let usdRate = rates[stringValueOfUSD]  // 308.81
    //    }

    var body: some View {
        //        Text("Add home view content here")
        //        TextField("", text: $text)
        //            .onChange(of: text) { newValue in
        //                print("Pass the functions below over here to convert")
        //                print(newValue)
        //            }

        //        ForEach(Currencies.allCases, id: \.self) { currency in
        //            Text(currency.rawValue)
        //        }
        VStack(alignment: .leading) {

            // home page name
            Text("Currency Converter")
                .font(.title)
                .fontWeight(.bold)

            // TF 1 -> foreign currency input
            HStack {
                TextField("", text: $tf1)
                    .border(.black)
                    .onChange(of: tf1) { newValue in
                        print("Pass the functions below over here to convert")
                        print(newValue)
                    }

                // Show the selected currency type
//                Text(selectedCurrencyType.rawValue)
//                    .fontWeight(.bold)

                // Picker to select currency
                Picker("Currency", selection: $selectedCurrencyType) {
                    ForEach(Currencies.allCases, id: \.self) { currency in
                        Text(currency.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            // TF 2 -> lkr input
            HStack {
                TextField("", text: $tf2)
                    .border(.black)
                    .onChange(of: tf2) { newValue in
                        print("Pass the functions below over here to convert")
                        print(newValue)
                    }
                Text("LKR")
                    .fontWeight(.bold)

            }

            // button to switch calculation
            Toggle(isOn: $isToggleOn) {
                Text("Switch calculation")
            }

            Spacer()

            // reset textfields btn
            Button("Reset Textfields") {
                tf1 = ""
                tf2 = ""
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(Color.red.opacity(0.75))

        }
        .padding()

    }

    // MARK: USE THESE FUNCTIONS WITHIN A SWIFTUI `onChange()` VIEW MODIFIER
    private func convert(newValue: String) {
        // To convert from foreign currency (F) to LKR you need to multiply the value of currency by the rate (R):
        // LKR = F * R
    }

    private func reverseConvert(newValue: String) {
        // To convert LKR to a foreign currency you need to divide the value of currency by the rate (R):
        // F = LKR / R
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedCurrencyType: .constant(.usd))
    }
}
