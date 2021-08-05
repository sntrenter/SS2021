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
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var genLabel: UILabel!
    @IBOutlet weak var pokeTableView: UITableView!
    
    private var ability: Ability!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = "ID: " + String(ability.id)
        nameLabel.text = "Name: " + ability.name
        seriesLabel.text = "From main Series: " + String(ability.isMainSeries)
        genLabel.text = "Generatrion: " + (ability.generation.name ?? "No Gen Provided")
        pokeTableView.dataSource = self
    }
}

extension AbilityDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ability.pokemon.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = ability.pokemon[indexPath.row].pokemon.name
        cell.textLabel?.textAlignment = .center
        return cell
    }

}

extension AbilityDetailsViewController {
    
    static func instance(ability: Ability) -> AbilityDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "AbilityDetailsViewController", bundle: nil).instantiateInitialViewController() as! AbilityDetailsViewController
        viewController.ability = ability
        return viewController
    }
}
