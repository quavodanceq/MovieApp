import Foundation
import Combine

class ViewModel {
    
    var trendingMovies = [Movie]()
    
    var topRatedMovies = [Movie]()
    
    var cancellable = [AnyCancellable]()
    
    init() {
        TMDBApi.shared.trendingMoviesPublisher().sink { completion in
            switch completion {
                
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
                
            }
        } receiveValue: { receivedMovies in
            self.trendingMovies = receivedMovies
        }.store(in: &cancellable)

        
        TMDBApi.shared.topRatedMoviesPublisher().sink { completion in
            switch completion {
                
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
                
            }
        } receiveValue: { topRatedMovies in
            self.topRatedMovies = topRatedMovies
        }.store(in: &cancellable)
    }
    
}
