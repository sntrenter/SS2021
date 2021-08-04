//
//  AbilityDetailsViewController.swift
//  Pokepedia
//
//  Created by CompSci 4220 Student on 8/4/21.
//
import UIKit
import PokemonFoundation
import AVFoundation
import PokemonCryKit

import Foundation

final class AbilityDetailsViewController: UIViewController {
        
    private var pokémon: Pokémon!
    private var url: String!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded viewController")
        print(url!)
        guard let url = URL(string: url) else {
            exit(1)
        }
        sendAPI(url: url)

    }
}



extension AbilityDetailsViewController {
    //call this in the didload function
    func sendAPI(url: URL) {
        print(url)
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task: URLSessionDataTask = session.dataTask(with: request) {data, response, error in
            if error != nil {
                print("fml")
                exit(1)
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("could not parse response")
                exit(1)
            }
            let statusCode = 200...299 ~= httpResponse.statusCode
            
            guard statusCode else {
                print(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                exit(1)
            }
            guard let data = data else {
                print("No Data")
                exit(1)
            }
            print("the data is \(data)")
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("could not parse JSON")
                exit(1)
            }
            do {
                let datajson: Data = try JSONSerialization.data(withJSONObject: json, options: [])
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                //let abilities  = try decoder.decode(Pokemon.self, from: datajson)
                //self.pokeAbilities = abilities

            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


extension AbilityDetailsViewController {
    
    static func instance(pokemon: Pokémon, url: String) -> AbilityDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "AbilityDetailsViewController", bundle: nil).instantiateInitialViewController() as! AbilityDetailsViewController
        viewController.pokémon = pokemon
        viewController.url = url
        return viewController
    }
}
