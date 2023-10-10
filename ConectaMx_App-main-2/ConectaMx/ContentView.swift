//
//  ContentView.swift
//  ConectaMx
//
//  Created by Guillermo Garcia Acosta on 18/09/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var activePage: ActivePage = .home
    /*@State private*/
    var tagsModel = TagsModel()
    var orgModel = OrganizationModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(tagsModel.tags) { tag in
                            Text(tag.tags)
                        }
                    }
//                    switch activePage {
//                    case .home:
//                        HomeView()
//                    case .search:
//                        SearchView()
//                    case .favorites:
//                        FavoritesView()
//                    case .profile:
//                        ProfileView(tags: <#[String]#>)
//                    }
                }
                VStack {
                    Spacer()
                    BottomBarView(activePage: $activePage)
                }
            }
        }
        .onAppear(){
            tagsModel.fetchTags()
            orgModel.fetchOrganizations()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
