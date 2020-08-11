//
//  ScrollViewWithTrampoline.swift
//  NZTrampoline_Example
//
//  Created by Hamidreza Vakilian on 8/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import NZTrampoline

class myDelegate: NZTrampoline<UIScrollViewDelegate>, UIScrollViewDelegate {
    
    var didScrollCallback: ((_ scrollView: UIScrollView)->())?
    var willBeginDraggingCallback: ((_ scrollView: UIScrollView)->())?

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScrollCallback?(scrollView)
        delegate?.scrollViewDidScroll?(scrollView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        willBeginDraggingCallback?(scrollView)
        delegate?.scrollViewWillBeginDragging?(scrollView)
    }
}

class mySrollView: UIScrollView {
    let trampoline = myDelegate()
    init() {
        super.init(frame: .zero)
        super.delegate = trampoline
        trampoline.didScrollCallback = { (scrollView) in
            print("myScrollView: didScrollCallback \(scrollView.contentOffset)")
        }
        trampoline.willBeginDraggingCallback = { (scrollView) in
            print("myScrollView: willBeginDraggingCallback")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var delegate: UIScrollViewDelegate? {
        get {
            trampoline.delegate
        }
        set {
            trampoline.delegate = newValue
        }
    }
}
