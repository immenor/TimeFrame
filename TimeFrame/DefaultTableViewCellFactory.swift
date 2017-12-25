import Foundation
import UIKit

protocol TableViewCellFactory {
    func textFieldCell(identifier: String) -> TextFieldTableViewCell
    func addAvailabilityCell(identifier: String) -> UITableViewCell
    func setLocationCell(identifier: String, timezone: String?) -> UITableViewCell
}

struct DefaultTableViewCellFactory: TableViewCellFactory {
    func textFieldCell(identifier: String) -> TextFieldTableViewCell {
        return TextFieldTableViewCell(style: .default, reuseIdentifier: identifier)
    }

    func addAvailabilityCell(identifier: String) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "availabilityCell")
        cell.textLabel?.textColor = UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        cell.textLabel?.text = "Add Availability"
        return cell
    }

    func setLocationCell(identifier: String, timezone: String?) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "setTimezoneCell")
        if let tz = timezone {
            cell.textLabel?.text = tz
        } else {
            cell.textLabel?.text = "Set Location"
        }
        cell.textLabel?.textColor = UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return cell
    }
}
