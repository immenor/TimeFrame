import XCTest
import Nimble
@testable import TimeFrame
class DefaultTableViewCellFactoryTests: XCTestCase {
    let factory = DefaultTableViewCellFactory()
 
    func test_createsTextFieldCell() {
        let cell = self.factory.textFieldCell(identifier: "cell")
        expect(cell).to(beAnInstanceOf(TextFieldTableViewCell.self))
    }
    
    func test_createsAddAvailabilityCell() {
        let cell = self.factory.addAvailabilityCell(identifier: "cell")
        expect(cell.textLabel?.textColor).to(equal(UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)))
        expect(cell.textLabel?.font.pointSize).to(equal(14))
        expect(cell.textLabel?.font).to(equal(UIFont.systemFont(ofSize: 14, weight: .bold)))
        expect(cell.textLabel?.text).to(equal("Add Availability"))
    }
    
    func test_createsSetLocationCell() {
        let cell = self.factory.setLocationCell(identifier: "cell", timezone: nil)
        expect(cell.textLabel?.textColor).to(equal(UIColor(red:0.55, green:0.76, blue:1.00, alpha:1.0)))
        expect(cell.textLabel?.font.pointSize).to(equal(14))
        expect(cell.textLabel?.font).to(equal(UIFont.systemFont(ofSize: 14, weight: .bold)))
        expect(cell.textLabel?.text).to(equal("Set Location"))
    }
    
    func test_createsSelectedLocationCell() {
        let cell = self.factory.setLocationCell(identifier: "cell", timezone: "Tokyo/Japan")
        expect(cell.textLabel?.text).to(equal("Tokyo/Japan"))
    }
}
