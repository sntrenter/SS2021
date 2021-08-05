import UIKit
import PokemonFoundation

final class PokemonDetailsViewController: UIViewController {
        
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var items: [FirstVCTableViewItem] = []
    private let model = AbilitiesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Abilities"
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
    }
}

extension PokemonDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        model.get(url: item.url)
    }
}

extension PokemonDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokeAbilityTableViewCell") else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
        
        return cell
    }

}

extension PokemonDetailsViewController {
    
    static func instance(items: [FirstVCTableViewItem]) -> PokemonDetailsViewController {
        // swiftlint:disable:next force_cast
        let viewController = UIStoryboard(name: "PokemonDetails", bundle: nil).instantiateInitialViewController() as! PokemonDetailsViewController
        viewController.items = items
        
        return viewController
    }
}
extension PokemonDetailsViewController: AbilitiesModelDelegate {
    //Networking lecture - weak self, custom error
    //GCD - Blocking UI, threading
    //MVC revisited - apply above to project
    func blockUI() {
        activityIndicator.startAnimating()
    }
    
    func displayError(error: String) {
        print(error)
    }
    
    func displayAbility(ability: Ability) {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.show(AbilityDetailsViewController.instance(ability: ability), sender: self)
        }

    }
}

protocol AbilitiesModelDelegate: AnyObject {
    //Block UI
    func blockUI()
    //display error
    func displayError(error: String)
    //Display ability object
    func displayAbility(ability: Ability)
}

struct Ability: Decodable {
    let id: Int
    let name: String
    let isMainSeries: Bool
    let generation: NamedAPIResource
    let pokemon: [AbilityPokemon]
}
struct AbilityPokemon: Decodable {
    let pokemon: Name
}
struct Name: Decodable {
    let name: String
}

final class AbilitiesModel {
    weak var delegate: AbilitiesModelDelegate?
    
    func get(url: URL) {
        delegate?.blockUI()
        print(url)
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task: URLSessionDataTask = session.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                self?.delegate?.displayError(error: error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                //delegate?.displayError(error: error) create custom error
                let error = "Error Getting HTTPResponse"
                self?.delegate?.displayError(error: error)
                return
                
            }
            let statusCode = 200...299 ~= httpResponse.statusCode
            
            guard statusCode else {
                let error = "Error: Status Came Back bad -> " + String(httpResponse.statusCode)
                self?.delegate?.displayError(error: error)
                return
                
            }
            guard let data = data else {
                let error = "Error: data Came Back bad"
                self?.delegate?.displayError(error: error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let ability = try decoder.decode(Ability.self, from: data)
                //self.pokeAbilities = abilities
                
                self?.delegate?.displayAbility(ability: ability)
            } catch {
                self?.delegate?.displayError(error: error.localizedDescription)
            }
        }
        task.resume()
    }
}
