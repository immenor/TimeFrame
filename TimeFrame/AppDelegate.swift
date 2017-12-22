import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router?
    var appearenceManager: AppearanceManager?

    convenience override init() {
        let navController = UINavigationController()
        let router: NavigationRouter = NavigationRouter(navigationController: navController, animated: true)
        let appearenceManager = MainAppearanceManager()
        self.init(router: router, appearenceManager: appearenceManager)
    }

    init(router: Router, appearenceManager: AppearanceManager) {
        self.router = router
        self.appearenceManager = appearenceManager
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = router?.rootNavigationController
        window?.backgroundColor = UIColor.white
        router?.setupRootViewController()
        window?.makeKeyAndVisible()
        appearenceManager?.setupAppearance()
        return true
    }
}
