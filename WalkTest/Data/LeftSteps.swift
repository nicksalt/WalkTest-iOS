//
//  LeftSteps.swift
//  WalkTest
//
//  Created by Salt, Nicholas (Nokia - CA/Ottawa) on 2018-01-21.
//  Copyright © 2018 OHRI. All rights reserved.
//

import Foundation

public struct LeftSteps {
    
    // Structure for walk test function
    
    static let MAXSTEPS = 5;//StepsWalkFunction.MAXSTEPS;
    
    public var index = [Float](repeating: 0, count: MAXSTEPS);
    public var lCount:Int;
    public var MLacc = [Float](repeating: 0, count: MAXSTEPS);
    public var time = [Float](repeating: 0, count: MAXSTEPS);

}
