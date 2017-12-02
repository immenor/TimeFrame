import XCTest
import Nimble
@testable import TimeFrame

class CreatePersonViewControllerTests: XCTestCase {
    var createPersonViewController: CreatePersonViewController!
    var fakeNavRouter = FakeNavigationRouter()

    override func setUp() {
        super.setUp()
        createPersonViewController = CreatePersonViewController(router: fakeNavRouter)
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
}
