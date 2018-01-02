import XCTest
import Nimble
@testable import TimeFrame

class CreatePersonViewControllerTests: XCTestCase {
    var createPersonViewController: CreatePersonViewController!
    var fakeNavRouter = FakeNavigationRouter()
    var fakeCellFactory = FakeTableViewCellFactory()

    override func setUp() {
        super.setUp()
        fakeCellFactory.textFieldCell_returnValue = TextFieldTableViewCell()
        fakeCellFactory.addAvailabilityCell_returnValue = UITableViewCell()
        fakeCellFactory.setLocationCell_returnValue = UITableViewCell()
        createPersonViewController = CreatePersonViewController(
            router: fakeNavRouter,
            cellFactory: fakeCellFactory
        )
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
        expect(self.fakeNavRouter.dismissModal_arg).to(be(createPersonViewController.navigationController))
    }

    func test_viewControllerHasNameInputField() {
        _ = createPersonViewController.tableView(createPersonViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        expect(self.fakeCellFactory.textFieldCell_arg).to(equal("inputNameCell"))
    }

    func test_hasButtonToSetTimeZone() {
        _ = createPersonViewController.tableView(createPersonViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 2))
        expect(self.fakeCellFactory.setLocationCell_firstArg).to(equal("setTimezoneCell"))
        expect(self.fakeCellFactory.setLocationCell_secondArg).to(beNil())
    }

    func test_showTimeZoneSelectionTableView() {
        createPersonViewController.tableView(
            createPersonViewController.tableView,
            didSelectRowAt: IndexPath(row: 0, section: 2)
        )
        expect(self.fakeNavRouter.showTimeZoneSelectionTable_arg).to(
            equal(createPersonViewController.navigationController)
        )
    }

    func test_updatesButtonWhenAddingTimezone() {
        createPersonViewController.add(timezone: TimeZone(abbreviation: "JST")!)
        _ = createPersonViewController.tableView(createPersonViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 2))
        expect(self.fakeCellFactory.setLocationCell_firstArg).to(equal("setTimezoneCell"))
        expect(self.fakeCellFactory.setLocationCell_secondArg).to(equal("Asia/Tokyo"))
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
        _ = createPersonViewController.tableView(createPersonViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 1))
        expect(self.fakeCellFactory.addAvailabilityCell_arg).to(equal("availabilityCell"))
    }

    func test_showsAddAvailability() {
        createPersonViewController.tableView(
            createPersonViewController.tableView,
            didSelectRowAt: IndexPath(row: 0, section: 1)
        )
        expect(self.fakeNavRouter.showAddAvailability_arg).to(
            equal(createPersonViewController.navigationController)
        )
    }
}
