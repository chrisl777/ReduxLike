//
//  Store.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/12/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import Foundation

protocol Action { }

protocol State { }

typealias Reducer = (_ action: Action, _ state: State?) -> State

protocol StoreSubscriber: NSObjectProtocol {
	func newState(state: State)
}

struct Store {
	
//	static let shared: Store = Store(state: AppState())
	
	let reducer: Reducer
	
	// The app state, i.e. all the variables we want to track.
	var state: State?
	
	// The objects that are listening to state changes.
	var subscribers: [StoreSubscriber] = []
	
	init(reducer: @escaping Reducer, state: State?) {
		self.reducer = reducer
		self.state = state
	}
	
	mutating func subscribe(_ subscriber: StoreSubscriber) {
		subscribers.append(subscriber)
	}
	
	mutating func unsubscribe(_ subscriber: StoreSubscriber) {
		var removeIndex: Int?
		for (index, subscriber) in subscribers.enumerated() {
			if subscriber === subscriber {
				removeIndex = index
			}
		}
		if let removeIndex = removeIndex {
			subscribers.remove(at: removeIndex)
		}
	}
	
	mutating func dispatch(action: Action) {
//		action.runAction(state: self.state, payload: payload)
		state = reducer(action, state)
		
		subscribers.forEach { $0.newState(state: state!) }
	}
}
