//
//  DetailView.swift
//  InkSpotRetake
//
//  Created by Ryan Bradshaw on 5/4/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var tattoo: Tattoo
    @State private var tatDescription = ""
    @State private var location: TatLocation = .torso
    @State private var notes = ""
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Tattoo Description:")
                .bold()
            
            TextField("description", text:$tatDescription)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            HStack{
                Text("Tat Location:")
                    .bold()
                
                Spacer()
                
                Picker("", selection: $location){
                    ForEach(TatLocation.allCases, id: \.self){ location in
                        Text("\(location.emoji)\(location.rawValue)")
                    }
                }
                
                
                
            }
            .padding(.bottom)

            
            Text("Notes:")
                .bold()
            TextField("notes", text:$notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .font(.title)
        .padding(.horizontal)
        .onAppear{
            tatDescription = tattoo.tatDescription
            location = tattoo.location
            notes = tattoo.notes
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel){
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(role: .confirm){
                    tattoo.tatDescription = tatDescription
                    tattoo.location = location
                    tattoo.notes = notes
                    modelContext.insert(tattoo)
                    guard let _ = try? modelContext.save() else { return }
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        DetailView(tattoo: Tattoo(tatDescription: "Baldwin", location: .left_arm, notes: "BC for Life! For Boston, We Sing Out Proud Refrain!"))
    }
    }
