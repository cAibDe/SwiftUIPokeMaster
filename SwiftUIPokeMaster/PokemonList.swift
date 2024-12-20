//
//  PokemonList.swift
//  SwiftUIPokeMaster
//
//  Created by 张鹏 on 2023/9/18.
//

import SwiftUI

struct PokemonList: View {
    //    var body: some View {
    //        List(PokemonViewModel.all) { pokemon in
    //            PokemonInfoRow(model: pokemon, expanded: false).listRowSeparatorTint(.clear)
    //        }
    //    }
    
    @State var expandingIndex:Int? //展开的单元格的下标
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(PokemonViewModel.all) { pokemon in
                    PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                        .onTapGesture {
                            withAnimation(.spring(
                                response: 0.55,
                                dampingFraction: 0.425,
                                blendDuration: 0
                            )){
                                if self.expandingIndex == pokemon.id {
                                    self.expandingIndex = nil
                                }else{
                                    self.expandingIndex = pokemon.id
                                }
                            }
                        }
                }
            }
        }.overlay {
            VStack{
                Spacer()
                PokemonInfoPanel(model: .sample(id: 1))
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    } 
}
