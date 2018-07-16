//
//  Reducers.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/16/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import Foundation

func counterReducer(_ action: Action, _ state: State?) -> State {
	var newState = state as? AppState ?? AppState()
	
	switch action {
	case let action as IncrementCounter:
		newState.counter += action.increaseBy
	case let action as DecrementCounter:
		newState.counter -= action.decreaseBy
	default:
		break
	}
	return newState
}
