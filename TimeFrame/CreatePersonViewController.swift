import Foundation
import UIKit

class CreatePersonViewController: UIViewController {
    let router: Router
    let nameTextField: UITextField
    let setTimeZoneButton: UIButton

    init(router: Router) {
        self.router = router
        nameTextField = UITextField()
        setTimeZoneButton = UIButton(type: .system)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancel)
        )
    }

    private func setupViews() {
        view.backgroundColor = UIColor.groupTableViewBackground
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor = UIColor.white
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)

        setTimeZoneButton.translatesAutoresizingMaskIntoConstraints = false
        setTimeZoneButton.backgroundColor = UIColor.white
        setTimeZoneButton.setTitle("Set Timezone", for: .normal)
        setTimeZoneButton.addTarget(
            self,
            action: #selector(showTimeZoneSelectionTable),
            for: .touchUpInside
        )
        view.addSubview(setTimeZoneButton)
    }

    private func setupConstraints() {
        let safeLayout = view.safeAreaLayoutGuide
        nameTextField.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 16).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 64).isActive = true

        setTimeZoneButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        setTimeZoneButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        setTimeZoneButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        setTimeZoneButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
    }

    @objc func cancel() {
       router.dismissModal()
    }

    @objc func showTimeZoneSelectionTable() {
        if let navCtrl = navigationController {
            router.showTimeZoneSelectionTable(navCtrl: navCtrl)
        }
    }
}
