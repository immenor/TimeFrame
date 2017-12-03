import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router?

    convenience override init() {
        let navController = UINavigationController()
        let router: NavigationRouter = NavigationRouter(navigationController: navController, animated: true)
        self.init(router: router)
    }

    init(router: Router) {
        self.router = router
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = router?.rootNavigationController
        window?.backgroundColor = UIColor.white
        router?.setupRootViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
