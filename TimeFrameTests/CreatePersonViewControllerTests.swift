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
        let nameTextField = createPersonViewController.nameTextField
        expect(nameTextField).toNot(beNil())
        expect(nameTextField).to(beAnInstanceOf(UITextField.self))
    }

    func test_hasButtonToSetTimeZone() {
        let button = createPersonViewController.setTimeZoneButton
        expect(button).toNot(beNil())
        expect(button).to(beAnInstanceOf(UIButton.self))
    }

    func test_showTimeZoneSelectionTableView() {
        let button = createPersonViewController.setTimeZoneButton
        button.sendActions(for: .touchUpInside)
        expect(self.fakeNavRouter.showTimezoneSelectionTable_arg).to(equal(createPersonViewController.navigationController))
    }
}
