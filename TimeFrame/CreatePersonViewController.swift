import Foundation
import UIKit

class CreatePersonViewController: UIViewController {
    let router: Router
    let tableView: UITableView
    var selectedTimeZone: String?

    init(router: Router) {
        self.router = router
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        setupNavigationBar()
        setupTableView()
    }

    private func setupViews() {
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "inputNameCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "setTimezoneCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "availabilityCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }

    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancel)
        )
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.reloadData()
    }

    private func setupConstraints() {
        let safeLayout = view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: safeLayout.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor).isActive = true
    }

    @objc func cancel() {
       router.dismissModal()
    }
}

extension CreatePersonViewController: UITableViewDataSource {
    enum Section: Int {
        case Name, Availability, Location
        static let count = 3
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Section.Name.rawValue:
            return TextFieldTableViewCell(style: .default, reuseIdentifier: "inputNameCell")
        case Section.Availability.rawValue:
            return setupAddAvailabilityCell()
        case Section.Location.rawValue:
            return setupSetTimezoneCell()
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case Section.Name.rawValue:
            return "Name"
        case Section.Availability.rawValue:
            return "Availability"
        case Section.Location.rawValue:
            return "Location"
        default:
            return ""
        }
    }

    private func setupSetTimezoneCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "setTimezoneCell")
        if let tz = selectedTimeZone {
            cell.textLabel?.text = tz
        } else {
            cell.textLabel?.text = "Set Timezone"
        }
        cell.textLabel?.textColor = UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return cell
    }

    private func setupAddAvailabilityCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "availabilityCell")
        cell.textLabel?.textColor = UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        cell.textLabel?.text = "Add Availability"
        return cell
    }
}

extension CreatePersonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case Section.Location.rawValue:
            if let navCtrl = navigationController {
                router.showTimeZoneSelectionTable(navCtrl: navCtrl, delegate: self)
            }
        default: break
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CreatePersonViewController: AddTimeZoneDelegate {
    func add(timezone: TimeZone) {
        selectedTimeZone = timezone.identifier
        tableView.reloadData()
    }
}
