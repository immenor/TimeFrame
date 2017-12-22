import Foundation
@testable import TimeFrame

class FakeAppearanceManager: AppearanceManager {
    var setupAppearanceWasCalled = false
    func setupAppearance() {
        setupAppearanceWasCalled = true
    }
}
