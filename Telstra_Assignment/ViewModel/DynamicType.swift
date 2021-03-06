//
//  DynamicType.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/22/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation

public struct DynamicType<T> {
    typealias ModelEventListener = (T) -> Void
    typealias Listeners = [ModelEventListener]
    
    private var listeners: Listeners = []
    var value: T? {
        didSet {
            for observer in listeners {
                if let value = value {
                    observer(value)
                }
            }
            
        }
    }
    
    mutating func bind(_ listener:@escaping ModelEventListener) {
        listeners.append(listener)
        if let value = value {
            listener(value)
        }
    }
    
}
