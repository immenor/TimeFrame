import XCTest
import UIKit
import Nimble

@testable import TimeFrame

class SummaryViewControllerTests: XCTestCase {
    var viewController: SummaryViewController!
    var fakeRouter: FakeNavigationRouter!

    override func setUp() {
        super.setUp()
        fakeRouter = FakeNavigationRouter()
        viewController = SummaryViewController(router: fakeRouter)
        viewController.view.setNeedsLayout()
    }

    func test_navBarHasAddPersonAction() {
        let rightAction = viewController.navigationItem.rightBarButtonItem
        expect(rightAction?.action?.description).to(equal("createPerson"))
    }

    func test_rightActionPresentsCreatePersonViewController() {
        let rightAction = viewController.navigationItem.rightBarButtonItem?.action
        viewController.perform(rightAction)
        expect(self.fakeRouter.showCreatePersonModal_wasCalled).to(beTrue())
    }
}
