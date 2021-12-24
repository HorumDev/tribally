import Flutter
import UIKit
import Tribally

public class SwiftTriballyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "tribally", binaryMessenger: registrar.messenger())
    let instance = SwiftTriballyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }



  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //result("iOS " + UIDevice.current.systemVersion)

      switch (call.method){
    case "login":
let params = call.arguments as! [String: Any]

            UserService.login(externalId: params["uid"] as! String, displayName: params["displayName"] as! String, avatar: params["avatar"] as! String, callback: { memberId, externalMemberId in
             //print("Login successful: " + memberId + " " + externalMemberId)
result(memberId)


           })
    default:
                print("default")
  }
      
}
}
