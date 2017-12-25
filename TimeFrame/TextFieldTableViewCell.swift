import Foundation
import UIKit

class TextFieldTableViewCell: UITableViewCell {
    let textField: UITextField
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textField = UITextField()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setupViews() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.white
        contentView.addSubview(textField)
    }

    private func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        textField.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
