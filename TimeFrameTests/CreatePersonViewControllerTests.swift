import XCTest
import Nimble
@testable import TimeFrame

class CreatePersonViewControllerTests: XCTestCase {
    var createPersonViewController: CreatePersonViewController!
    var fakeNavRouter = FakeNavigationRouter()

    override func setUp() {
        super.setUp()

        createPersonViewController = CreatePersonViewController(router: fakeNavRouter)
        _ = UINavigationController(rootViewController: createPersonViewController)
        createPersonViewController.view.setNeedsLayout()
    }

    func test_tableViewHasCorrectNumberOfSections() {
        let number = self.createPersonViewController.numberOfSections(in: createPersonViewController.tableView)
        expect(number).to(equal(3))
    }

    func test_tableViewHasDelegateAndDataSource() {
        expect(self.createPersonViewController.tableView.delegate).to(be(self.createPersonViewController))
        expect(self.createPersonViewController.tableView.dataSource).to(be(self.createPersonViewController))
    }

    func test_navBarHasCancelAction() {
        let leftAction = createPersonViewController.navigationItem.leftBarButtonItem
        expect(leftAction?.action?.description).to(equal("cancel"))
    }

    func test_leftActionDismissesModal() {
        let leftAction = createPersonViewController.navigationItem.leftBarButtonItem?.action
        createPersonViewController.perform(leftAction)
        expect(self.fakeNavRouter.dismissModal_wasCalled).to(beTrue())
    }

    func test_viewControllerHasNameInputField() {
        let nameCell = createPersonViewController.tableView(
            createPersonViewController.tableView,
            cellForRowAt: IndexPath(row: 0, section: 0)
        )

        expect(nameCell).to(beAnInstanceOf(TextFieldTableViewCell.self))
    }

    func test_hasButtonToSetTimeZone() {
        let buttonCell = createPersonViewController.tableView(
            createPersonViewController.tableView,
            cellForRowAt: IndexPath(row: 0, section: 1)
        )
        expect(buttonCell).to(beAnInstanceOf(UITableViewCell.self))
    }

    func test_showTimeZoneSelectionTableView() {
        createPersonViewController.tableView(
            createPersonViewController.tableView,
            didSelectRowAt: IndexPath(row: 0, section: 2)
        )
        expect(self.fakeNavRouter.showTimeZoneSelectionTable_arg).to(equal(createPersonViewController.navigationController))
    }

    func test_updatesButtonWhenAddingTimezone() {
        createPersonViewController.add(timezone: TimeZone(abbreviation: "JST")!)
        let buttonCell = createPersonViewController.tableView(
            createPersonViewController.tableView,
            cellForRowAt: IndexPath(row: 0, section: 2)
        )
        expect(buttonCell.textLabel?.text).to(equal("Asia/Tokyo"))
    }

    func test_displaysCorrectHeaderTitles() {
        let headerOne = createPersonViewController.tableView(createPersonViewController.tableView, titleForHeaderInSection: 0)
        expect(headerOne).to(equal("Name"))
        let headerTwo = createPersonViewController.tableView(createPersonViewController.tableView, titleForHeaderInSection: 1)
        expect(headerTwo).to(equal("Availability"))
        let headerThree = createPersonViewController.tableView(createPersonViewController.tableView, titleForHeaderInSection: 2)
        expect(headerThree).to(equal("Location"))
    }

    func test_displaysAddAvailabilityWhenNoneAreAdded() {
        let row = createPersonViewController.tableView(
            createPersonViewController.tableView,
            cellForRowAt: IndexPath(row: 0, section: 1)
        )
        expect(row.textLabel?.text).to(equal("Add Availability"))
    }
}
