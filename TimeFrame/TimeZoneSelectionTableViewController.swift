import Foundation
import UIKit

class TimeZoneSelectionTableViewController: UITableViewController {
    let timezones = TimeZone.knownTimeZoneIdentifiers
    let router: Router
    let delegate: AddTimeZoneDelegate

    init(router: Router, addTimeZoneDelegate: AddTimeZoneDelegate) {
        self.router = router
        self.delegate = addTimeZoneDelegate
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "timezone")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timezones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "timezone")
        cell.textLabel?.text = timezones[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let navCtrl = navigationController,
            let timezone = TimeZone(identifier: timezones[indexPath.row]) {
            router.popViewController(with: navCtrl)
            delegate.add(timezone: timezone)
        }
    }
}

protocol AddTimeZoneDelegate {
    func add(timezone: TimeZone)
}
