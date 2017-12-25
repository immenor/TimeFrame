import Foundation
import XCTest
import Nimble
@testable import TimeFrame

class TextFieldTableViewCellTests: XCTestCase {
    var cell = TextFieldTableViewCell()
    func test_cellContainsUITextField() {
        expect(self.cell.textField).to(beAnInstanceOf(UITextField.self))
    }

    func test_cellCanNotBeSelected() {
        expect(self.cell.selectionStyle).to(equal(UITableViewCellSelectionStyle.none))
    }
}
