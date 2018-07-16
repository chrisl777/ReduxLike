//
//  MainView.swift
//  ReduxLike
//
//  Created by Chris Livdahl on 7/12/18.
//  Copyright © 2018 Chris Livdahl. All rights reserved.
//

import UIKit

class MainView: UIView {

	var label: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		store.subscribe(self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	deinit {
		store.unsubscribe(self)
	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	
}

extension MainView: StoreSubscriber {
	
	func newState(state: State) {
		guard let newState = state as? AppState else {
			return
		}
		label.text = "\(newState.counter)"
	}
	
}
