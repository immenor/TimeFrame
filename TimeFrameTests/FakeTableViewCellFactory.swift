import Foundation
import UIKit
@testable import TimeFrame

class FakeTableViewCellFactory: TableViewCellFactory {

    var textFieldCell_arg: String!
    var textFieldCell_returnValue: TextFieldTableViewCell!
    func textFieldCell(identifier: String) -> TextFieldTableViewCell {
        textFieldCell_arg = identifier
        return textFieldCell_returnValue
    }

    var addAvailabilityCell_arg: String!
    var addAvailabilityCell_returnValue: UITableViewCell!
    func addAvailabilityCell(identifier: String) -> UITableViewCell {
        addAvailabilityCell_arg = identifier
        return addAvailabilityCell_returnValue
    }

    var setLocationCell_firstArg: String!
    var setLocationCell_secondArg: String!
    var setLocationCell_returnValue: UITableViewCell!
    func setLocationCell(identifier: String, timezone: String?) -> UITableViewCell {
        setLocationCell_firstArg = identifier
        setLocationCell_secondArg = timezone
        return setLocationCell_returnValue
    }
}
