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
  func initTerra(_ devID: String, apiKey: String, autoFetch: Bool){
    do{
      terraClient = try TerraSwift.Terra(dev_id: devID, xAPIKey: apiKey, auto: autoFetch)
    } catch {
      print(error)
    }
  }
  
  // deauth
  @objc
  func deauth(){
    terraClient = nil
  }
  
  // data functions
  @objc
  func getBody(_ startDate: Date, endDate: Date){
    terraClient?.getBody(startDate: startDate, endDate: endDate)
  }
  @objc
  func getDaily(_ startDate: Date, endDate: Date){
    terraClient?.getDaily(startDate: startDate, endDate: endDate)
  }
  @objc
  func getSleep(_ startDate: Date, endDate: Date){
    terraClient?.getSleep(startDate: startDate, endDate: endDate)
  }
  @objc
  func getActivity(_ startDate: Date, endDate: Date){
    terraClient?.getWorkout(startDate: startDate, endDate: endDate)
  }
  @objc
  func getAthlete(){
    terraClient?.getAthlete()
  }
  
}

