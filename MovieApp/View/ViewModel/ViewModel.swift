import Foundation
import Combine

class ViewModel {
    
    @Published var movies = [Movie]()
    
    private var cancellable = [AnyCancellable]()
    
    init() {
        TMDBApi.shared.MoviesPublisher().sink { completion in
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { receivedMovies in
            self.movies = receivedMovies
        }
        .store(in: &cancellable)

    }
    
}
