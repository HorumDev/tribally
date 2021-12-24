import Flutter
import UIKit
import Tribally

public class TriballyFactory: NSObject, FlutterPlatformViewFactory {
  private let pluginRegistrar: FlutterPluginRegistrar!

  public init(registrar: FlutterPluginRegistrar) {
    self.pluginRegistrar = registrar
    super.init()
  }

  public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }

  public func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
  let params = args as! [String: Any]

          //var fullscreen = .fullsceen
//      if(!params["fullscreen"]){
//
//      }

    return TriballyUI(
    //  modalPresentationStyle: fullscreen
    ) as! FlutterPlatformView
  }
}
