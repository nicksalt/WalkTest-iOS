//
//  UserInfo.swift
//  WalkTest
//
//  Created by Salt, Nicholas (Nokia - CA/Ottawa) on 2018-01-21.
//  Copyright © 2018 OHRI. All rights reserved.
//

import Foundation

public class UserInfo {
    
    private init(){} //Unable to initialize pubicly
    
    static let mData =  UserInfo();
    
    private var name: String?;
    private var age: Int?;
    private var gender: String?;
    private var height: Float?;
    private var heightUnits: String?;
    private var weight: Float?;
    private var weightUnits: String?;
    private var complete: Bool?;

    static func getInstance() -> UserInfo {
        return mData;
    }
    
    
    func setName(username: String) {
        name = username;
    }
    func getName() -> String? {
        return name;
    }
    
    func setAge(number: Int) {
        age = number;
    }
    func getAge() -> Int? {
        return age;
    }
    
    func setGender(sex: String) {
        gender = sex;
    }
    func getGender() -> String? {
        return gender;
    }
    
    func setHeight(number: Float) {
        height = number;
    }
    func getHeight() -> Float? {
        return height;
    }
    
    func setHeightUnits(unit: String) {
        heightUnits = unit;
    }
    func getHeightUnits() -> String? {
        return heightUnits;
    }
    func getStandardHeight() -> Float? {
        if (getHeightUnits() == "in"){
            height = height!*2.54;
        }
        return height
    }
    
    func setWeight(number: Float) {
        weight = number;
    }
    func getWeight() -> Float? {
        return weight;
    }
    
    func setWeightUnits(unit: String) {
        weightUnits = unit;
    }
    func getWeightUnits() -> String? {
        return weightUnits;
    }
    func getStandardWeight() -> Float? {
        if (getWeightUnits() == "in"){
            weight = weight!*2.54;
        }
        return weight
    }
    
    func setComplete(done: Bool) {
        complete = done;
    }
    func getComplete() -> Bool? {
        return complete;
    }
    
}

}
