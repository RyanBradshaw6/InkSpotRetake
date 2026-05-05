//
//  ContentView.swift
//  InkSpotRetake
//
//  Created by Ryan Bradshaw on 5/4/26.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Query private var tattoos: [Tattoo]
    @Environment(\.modelContext) private var modelContext
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            List(tattoos){ tattoo in
                NavigationLink{
                    DetailView(tattoo: tattoo)
                } label:{
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(tattoo.location.emoji)
                            Text(tattoo.tatDescription)
                        }
                        
                        .font(.title)
                        
                        Text(tattoo.notes)
                            .font(.title3)
                            .italic()
                    }
                }
                .swipeActions{
                    Button("", systemImage: "trash", role: .destructive){
                        modelContext.delete(tattoo)
                        guard let _ = try? modelContext.save() else{return}
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle(Text("Tattoos:"))
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("", systemImage: "plus"){
                        sheetIsPresented.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack{
                DetailView(tattoo: Tattoo())
            }
        }
    }
}

#Preview {
    ListView()
        .modelContainer(Tattoo.preview)
}
