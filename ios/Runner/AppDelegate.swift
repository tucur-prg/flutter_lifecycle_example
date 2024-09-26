import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    NSLog("LOGGING: NSLog: application(:didFinishLaunchingWithOptions)")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ application: UIApplication,
    continue continueUserActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
  ) -> Bool {
    NSLog("LOGGING: NSLog: application(:continue, :restorationHandler)")
    if continueUserActivity.activityType == NSUserActivityTypeBrowsingWeb {
      if let url = continueUserActivity.webpageURL {
        NSLog("LOGGING: %@", url.absoluteString)
      } else {
        NSLog("LOGGING: url = null")
      }
    }

    Thread.sleep(forTimeInterval: 3.0)
    NSLog("LOGGING: thead.sleep")

    return super.application(application, continue: continueUserActivity, restorationHandler: restorationHandler)
  }
}
