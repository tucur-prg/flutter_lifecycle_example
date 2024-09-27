import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    NSLog("MyLog: native: application(:didFinishLaunchingWithOptions)")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  override func application(
    _ application: UIApplication,
    willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
  ) -> Bool {
      NSLog("MyLog: native: application(:willFinishLaunchingWithOptions)")
      return super.application(application, willFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ application: UIApplication,
    continue continueUserActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
  ) -> Bool {
    NSLog("MyLog: native: application(:continue, :restorationHandler)")
    if continueUserActivity.activityType == NSUserActivityTypeBrowsingWeb {
      if let url = continueUserActivity.webpageURL {
        NSLog("MyLog: native: %@", url.absoluteString)
      } else {
        NSLog("MyLog: native: url = null")
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
      NSLog("MyLog: native: asyncAfter(5.0)")
      super.application(application, continue: continueUserActivity, restorationHandler: restorationHandler)
    }

    return true
  }
}
