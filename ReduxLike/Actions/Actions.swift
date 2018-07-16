//
//  Actions.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/16/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import Foundation

struct IncrementCounter: Action {
	let increaseBy: Int
}

struct DecrementCounter: Action {
	let decreaseBy: Int
}
