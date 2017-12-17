import XCTest
import Nimble

@testable import TimeFrame
class TimezoneSelectionTableViewControllerTests: XCTestCase {
    var tableViewController: TimeZoneSelectionTableViewController!
    var fakeRouter: FakeNavigationRouter!
    var fakeAddTimeZoneDelegate: FakeAddTimeZoneDelegate!

    override func setUp() {
        super.setUp()
        fakeRouter = FakeNavigationRouter()
        fakeAddTimeZoneDelegate = FakeAddTimeZoneDelegate()
        tableViewController = TimeZoneSelectionTableViewController(
            router: fakeRouter,
            addTimeZoneDelegate: fakeAddTimeZoneDelegate
        )
        _ = UINavigationController(rootViewController: tableViewController)
    }

    func test_displaysAListOfAvailableTimezones() {
        let firstTimeZone = TimeZone.knownTimeZoneIdentifiers[0]
        let cell = tableViewController.tableView(tableViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        expect(cell.textLabel?.text).to(equal(firstTimeZone))
    }

    func test_canChooseATimeZone() {
        let firstTimeZone = TimeZone.knownTimeZoneIdentifiers[0]
        let timeZone = TimeZone(identifier: firstTimeZone)
        tableViewController.tableView(tableViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        expect(self.fakeRouter.popViewController_arg).to(be(tableViewController.navigationController))
        expect(self.fakeAddTimeZoneDelegate.addTimeZone_arg).to(equal(timeZone))
    }
}

class FakeAddTimeZoneDelegate: AddTimeZoneDelegate {
    var addTimeZone_arg: TimeZone!
    func add(timezone: TimeZone) {
        addTimeZone_arg = timezone
    }
}
