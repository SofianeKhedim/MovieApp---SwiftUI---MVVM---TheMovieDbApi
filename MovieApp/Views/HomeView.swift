

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @Namespace var  namespace

    @StateObject private var vm = HomeViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading,spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold,20)
                
//                SearchBar(searchText: $searchText)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) {movie in
                            MovieCard(movie:movie)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(vm.genre) {genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedGenre = genre
                                        Task {
                                            await vm.fetchMoviesForSelectedGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                Text(vm.errorMsg)
                
                LazyVGrid(
                    columns : [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),],spacing: 20) {
                    
                        ForEach(vm.moviesForSelectedGenre) {movie in
                            MovieCard(movie: movie,type: .grid)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
        .fullScreenCover(item: $vm.selectedMovie) { movie in
             DetailView(movie: movie)
        }
        .task {
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
            await vm.fetchGenre()
            await vm.fetchMoviesForSelectedGenre()
        }
    }
}

#Preview {
    HomeView()
}
