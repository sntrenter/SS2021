import UIKit

// TODO: - Use this enum's `CaseIterable` property as your data set.
enum AstrologicalSign: String, CaseIterable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
    
    var title: String { "\(rawValue.first?.uppercased() ?? "")\(rawValue.dropFirst())" }
    
    var subTitle: String {
        switch self {
        case .aries: return "The Ram"
        case .taurus: return "The Bull"
        case .gemini: return "The Twins"
        case .cancer: return "The Crab"
        case .leo: return "The Lion"
        case .virgo: return "The Maiden"
        case .libra: return "The Scales"
        case .scorpio: return "The Scorpion"
        case .sagittarius: return "The Archer"
        case .capricorn: return "The Goat-fish"
        case .aquarius: return "The Water-bearer"
        case .pisces: return "The Fishes"
        }
    }
}

final class ViewController: UIViewController {
     // TODO: - Add a `UITableView` property

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - Constrain the `UITableView` object.
        // TODO: - Set the delegate and dataSource of the `UITableView` object.
    }
}

// TODO: - Conform `ViewController` to `UITableViewDelegate`.
// TODO: - Conform `ViewController` to `UITableViewDataSource`.
