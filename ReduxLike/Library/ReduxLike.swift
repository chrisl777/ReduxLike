//
//  Store.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/12/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import Foundation

/*
	Based on this article:
		https://medium.com/newindustrialist/redux-in-swift-pt-1-what-why-and-how-b52e6fd29440
	Great code samples from the article:
		https://gist.github.com/alexobenauer/fcc8387cb505d90901279eda482914ed#file-simpleredux-swift
		https://gist.github.com/alexobenauer/8990d11ef23fe3c78ebd5fca88fbe954#file-simplereduxexample-swift
		https://gist.github.com/alexobenauer/987950387e58486ce08646d4730dde39#file-simplereduxexampleviewcontroller-swift
*/

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
