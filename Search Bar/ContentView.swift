//
//  ContentView.swift
//  Search Bar
//
//  Created by Ermanno Fissore on 04/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["Hello","hi","Welcome","World"]
    @State var txt = ""
    var body: some View {
        VStack {
           
         searchView(txt: $txt)
            
            List(datas.filter{txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)},id: \.self){i in
                
                Text(i).fontWeight(.heavy)
                
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct searchView : UIViewRepresentable {
    func makeUIView(context: Context) -> UISearchBar {
    }
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> Coordinator {
        return searchView.Coordinator(parent1: self)
    }
    
    
    func makeUIview(context: UIViewRepresentableContext<searchView>) -> UISearchBar {
        
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        return searchbar
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<searchView>) {
    
    }
    
    class Coordinator : NSObject,UISearchBarDelegate{
        
        var parent : searchView!
        
        init(parent1 : searchView){
            parent = parent1
            
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            parent.txt = searchText
            
        }
    }
}
