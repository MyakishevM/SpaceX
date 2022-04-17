//
//  NetworkManager.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 08.04.2022.
//

import Foundation

class NetworkManager {
    let urlScheme = "https"
    let urlHost = "api.spacexdata.com"
    let rocketsPath = "/v4/rockets"
    let flightsPath = "/v4/launches/query"


    func loadRocketsData(completion: @escaping ([RocketDTO]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        guard let url = configureURL(with: rocketsPath) else { return }

        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let rockets = try decoder.decode([RocketDTO].self, from: data)
                DispatchQueue.main.async {
                    completion(rockets)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }

    func loadFlightsData(id: String, completion: @escaping ([FlightDTO]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        guard let url = configureURL(with: flightsPath) else { return }

        let parameters = "\n{\n  \"query\": {\n    \"rocket\": {\n      \"$eq\": \"\(id)\"\n    }\n }\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        session.dataTask(with: request) { data, response, error in
            guard let data = data else {

                return
            }
            do {
                let docs = try JSONDecoder().decode(Docs.self, from: data)
                guard let flights = docs.docs else { return }
                DispatchQueue.main.async {
                    completion(flights)
                }
            } catch {
                print(error)
            }

        }.resume()
    }

    func configureURL(with path: String) -> URL? {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = urlScheme
        urlConstructor.host = urlHost
        urlConstructor.path = path

        return urlConstructor.url
    }
}

