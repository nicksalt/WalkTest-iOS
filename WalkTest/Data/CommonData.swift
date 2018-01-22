//
//  CommonData.swift
//  WalkTest
//
//  Created by Salt, Nicholas (Nokia - CA/Ottawa) on 2018-01-21.
//  Copyright © 2018 OHRI. All rights reserved.
//

import Foundation

public class CommonData {
    
    private init(){} //Unable to initialize pubicly
    
    static let mData =  CommonData();
    
    private var walkTime: Int64?;
    private var walkLength: Float?;
    private var userName: String?;
    private var logRawData: Bool?;
    private var rawDataFileName: String?;

    static func getInstance() -> CommonData {
        return mData;
    }
    
    
    func setWalkTime(time: Int64) {
        walkTime = time;
    }
    func getWalkTime() -> Int64? {
        return walkTime;
    }
    
    func setWalkLength(length: Float) {
        walkLength = length;
    }
    func getWalkLength() -> Float? {
        return walkLength;
    }
    
    func setUserName(name: String) {
        userName = name;
    }
    func getUserName() -> String? {
        return userName;
    }
    
    func setLogRawData(log: Bool) {
        logRawData = log;
    }
    func getLogRawData() -> Bool? {
        return logRawData;
    }
    
    func setRawDataFileNameWalkTime(fileName: String) {
        rawDataFileName = fileName;
    }
    func getRawDataFileNameWalkTime() -> String? {
        return rawDataFileName;
    }
    
}
