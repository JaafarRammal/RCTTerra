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
  func initApple(_ devID: String, apiKey: String, callback: RCTResponseSenderBlock) {
    let userID = TerraSwift.connectTerra(dev_id: devID, xAPIKey: apiKey)
    terraClient = TerraSwift.Terra(user_id: userID, dev_id: devID, xAPIKey: apiKey)
    callback([userID])
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

