//  Sam Trenter
//  ViewController.swift
//  ASN5
//
//  Created by CompSci 4220 Student on 7/15/21.
//

import UIKit

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

    @IBOutlet weak var mainTableView: UITableView!
    
    private let signs: [AstrologicalSign] = AstrologicalSign.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "You Selected", message: signs[indexPath[1]].title, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //swiftlint:disable:next force_cast
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignTableViewCell") else {
            return UITableViewCell()
        }
        let sign = signs[indexPath.row]
        cell.textLabel?.text = sign.title
        cell.detailTextLabel?.text = sign.subTitle
        return cell
    }
}


