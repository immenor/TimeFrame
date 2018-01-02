import XCTest
import Nimble

@testable import TimeFrame
class AddAvailabilityViewControllerTests: XCTestCase {
    var addAvailViewCtrl : AddAvailabilityViewController!
    var fakeNavRouter: FakeNavigationRouter!
    override func setUp() {
        super.setUp()

        fakeNavRouter = FakeNavigationRouter()
        addAvailViewCtrl = AddAvailabilityViewController(router: fakeNavRouter)
        _ = UINavigationController(rootViewController: addAvailViewCtrl)
        addAvailViewCtrl.view.setNeedsLayout()
    }
    
    func test_navBarHasCancelAction() {
        let leftAction = addAvailViewCtrl.navigationItem.leftBarButtonItem
        expect(leftAction?.action?.description).to(equal("cancel"))
    }

    func test_leftActionDismissesModal() {
        let leftAction = addAvailViewCtrl.navigationItem.leftBarButtonItem?.action
        addAvailViewCtrl.perform(leftAction)
        expect(self.fakeNavRouter.dismissModal_arg).to(be(addAvailViewCtrl.navigationController))
    }
    
    func test_navBarHasAddAction() {
        let rightAction = addAvailViewCtrl.navigationItem.rightBarButtonItem
        expect(rightAction?.action?.description).to(equal("add"))
    }
}
