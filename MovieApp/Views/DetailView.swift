


import SwiftUI


enum DetailViewSection: String {
    case about,review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About movie"
        case .review:
            return "Review"
        }
    }
     
}


struct DetailView: View {
    @StateObject private var vm : DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie) {
       _vm = StateObject(wrappedValue: DetailViewModel(movie:  movie))
    }
    var body: some View {
        VStack(alignment: .leading) {
            header
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate)
                    Text("|")
                    Image.ClockIcon
                    Text("90 Minutes")
                    Text("|")
                    Image.GenreIcon
                    Text("Action")
                }
                .foregroundColor(.AppGrayColor2)
                .frame(width: .infinity)
                
                HStack {
                    ForEach(vm.sections,id: \.self) { section in
                        DetailSectionCard(section: section, selectedSection: $vm.selectedSection, namespace: namespace)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    vm.selectedSection = section
                                }
                            }
                    }
                }
                
                switch vm.selectedSection {
                case .about:
                    Text(vm.movie.overview)
                case .review:
                
                    ScrollView {
                        VStack {
                            ForEach(vm.reviews) { review in
                                ReviewCard(review: review)
                                
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.top,contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.appBackground)
        .task {
            await vm.fetchReviews()
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    var backdropImageWSize: CGFloat {
        screenHeight * 0.15
    }
    var backdropImageHSize: CGFloat {
        screenHeight * 0.20
    }
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.12
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.10
    }
}

struct DetailView_Preview: PreviewProvider {
  static var previews: some View {
      DetailView(movie: dev.movie)
  }
}


private extension DetailView {
    var header: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
                HStack {
                    Image.BackIcon.onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text("Detail")
                    Spacer()
                    Image.BookmarkIcon
                }
                .padding()
                .background(Color.appBackground)
            }
            HStack {
                CustomImageView(itemWidth: backdropImageWSize, itemHeight: backdropImageHSize, movie: vm.movie,imageType: .backdrop)
                Text(vm.movie.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                    .padding(.top,titleOffset)
            }
            .padding()
            .offset(y:backdropImageOffset)
        }
    }
}
