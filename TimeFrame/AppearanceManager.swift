import Foundation
import UIKit

protocol AppearanceManager {
    func setupAppearance()
}

struct MainAppearanceManager: AppearanceManager {
    func setupAppearance() {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.black
        navBar.tintColor = UIColor.white

        let tableView = UITableView.appearance()
        tableView.backgroundColor = UIColor.black
        tableView.separatorColor = UIColor.darkGray

        let tableViewCell = UITableViewCell.appearance()
        tableViewCell.backgroundColor = UIColor(red:0.07, green:0.07, blue:0.07, alpha:1.0)
        tableViewCell.textLabel?.textColor = UIColor.white

        UIWindow.appearance().backgroundColor = UIColor.black
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
