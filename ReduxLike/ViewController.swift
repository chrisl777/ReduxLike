//
//  ViewController.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/12/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var label: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		store.subscribe(self)
		
		self.newState(state: store.state!)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
		store.unsubscribe(self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func buttonIncrementTapped() {
		store.dispatch(action: IncrementCounter(increaseBy: 1))
	}
	
	@IBAction func buttonDecrementTapped() {
		store.dispatch(action: DecrementCounter(decreaseBy: 1))
	}
}

extension ViewController: StoreSubscriber {
	
	func newState(state: State) {
		guard let newState = state as? AppState else {
			return
		}
		label.text = "\(newState.counter)"
	}
	
}
