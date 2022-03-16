//
//  RCTTerra.swift
//  RCTTerra
//
//  Created by Jaafar Rammal on 03/01/2022.
//

import Foundation
import TerraSwift

@objc(TerraSwiftBridge)
class TerraSwiftBridge: NSObject {
  
  // some states
  private var count = 0
  private var terraClient: TerraSwift.Terra?
  
  //  require init on main
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // init client
  @objc
  func auth(_ devID: String, apiKey: String, referenceID: String, resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
    guard let terraAuthResponse = TerraSwift.connectTerra(dev_id: devID, xAPIKey: apiKey, referenceId: referenceID) else {
      reject("AUTH", "Auth failed, further debug messages avaialble in Xcode", nil)
      return
    }
    print(terraAuthResponse)
    resolve(["userID": terraAuthResponse.user_id, "referenceID": terraAuthResponse.reference_id, "status": terraAuthResponse.status])
  }
    
  @objc
  func initTerra(_ devID: String, apiKey: String, autoFetch: Bool, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    do {
      terraClient = try TerraSwift.Terra(dev_id: devID, xAPIKey: apiKey, auto: autoFetch){(success: Bool) in resolve(["success": success])}
    } catch {
      reject("Init", "Init failed, further debug messages avaialble in Xcode", nil)
    }
  }
  
  // deauth
  @objc
  func deauth(){
    terraClient = nil
  }
  
  // data functions
  @objc
  func getBody(_ startDate: Date, endDate: Date, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    terraClient?.getBody(startDate: startDate, endDate: endDate){(success: Bool) in resolve(["success": success])}
  }
  @objc
  func getDaily(_ startDate: Date, endDate: Date, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    terraClient?.getDaily(startDate: startDate, endDate: endDate){(success: Bool) in resolve(["success": success])}
  }
  @objc
  func getSleep(_ startDate: Date, endDate: Date, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    terraClient?.getSleep(startDate: startDate, endDate: endDate){(success: Bool) in resolve(["success": success])}
  }
  @objc
  func getActivity(_ startDate: Date, endDate: Date, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    terraClient?.getWorkout(startDate: startDate, endDate: endDate){(success: Bool) in resolve(["success": success])}
  }
  @objc
  func getAthlete(resolve: @escaping RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock){
    terraClient?.getAthlete(){(success: Bool) in resolve(["success": success])}
  }
  
}

