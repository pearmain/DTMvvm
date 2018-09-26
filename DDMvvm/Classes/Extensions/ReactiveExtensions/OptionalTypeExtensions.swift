//
//  OptionalType.swift
//  DDMvvm
//
//  Created by Dao Duy Duong on 12/4/17.
//  Copyright © 2017 Halliburton. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol OptionalType {
    
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    
    public var value: Wrapped? {
        return self
    }
}

extension ObservableType where E: OptionalType {
    
    public func filterNil() -> Observable<E.Wrapped> {
        return self.flatMap { element -> Observable<E.Wrapped> in
            return Observable.from(optional: element.value)
        }
    }
    
}