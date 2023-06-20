import Foundation
import Combine

class TMDBApi {
    
    static let shared = TMDBApi()
    
    func trendingMoviesPublisher() -> AnyPublisher <[Movie], Error> {
        
        let headers = [
          "accept": "application/json",
          "Authorization": AuthKey.key
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .map {
                $0.data
            }
            .decode(type: Result.self, decoder: JSONDecoder())
            .map({ result in
                result.results
            })
            .eraseToAnyPublisher()
    }
    
    func topRatedMoviesPublisher() -> AnyPublisher <[Movie], Error> {
        
        let headers = [
          "accept": "application/json",
          "Authorization": AuthKey.key
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .map {
                $0.data
            }
            .decode(type: Result.self, decoder: JSONDecoder())
            .map({ result in
                result.results
            })
            .eraseToAnyPublisher()
    }
    
}
