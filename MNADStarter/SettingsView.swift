//
//  SettingsView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

enum Currencies: String, CaseIterable {
    case usd = "USD"
    case gbp = "GBP"
    case aud = "AUD"
    case cad = "CAD"
    case eur = "EUR"

}

struct SettingsView: View {

    @Binding var selectedCurrencyType: Currencies

    var body: some View {

        VStack {

            Section {
                // page title
                Text("Settings")
                    .font(.title)
                    .fontWeight(.bold)

                // currency
                Text("Currency")
                    .font(.title2)
                    .fontWeight(.bold)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            // picker
            Picker("\($selectedCurrencyType)", selection: $selectedCurrencyType)
            {

                ForEach(Currencies.allCases, id: \.self) { currency in
                    Text(currency.rawValue)
                }
            }
            .pickerStyle(.wheel)

            Spacer()

            // reset textfields btn
            Button("Reset Settings") {
                selectedCurrencyType = .usd
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(Color.red.opacity(0.75))
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(selectedCurrencyType: .constant(.usd))
    }
}
