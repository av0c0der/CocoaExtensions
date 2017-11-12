//
//  Rx.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - Precedence Groups
precedencegroup Binding {
  associativity: none
  higherThan: Additive
}

precedencegroup Additive {
  associativity: left
  higherThan: MultiplicationPrecedence
}

precedencegroup Right {
  associativity: right
  higherThan: Additive
}

// MARK: - Dispose bag
infix operator >>> : Additive

public func >>> (lhs: Disposable?, rhs: DisposeBag) {
  if let disposable = lhs {
    rhs.insert(disposable)
  }
}

// MARK: - Two-way binding
infix operator <-> : Binding

public func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
  let uiDisposable = variable.asObservable().bind(to: property)
  let bindToVariable = property
    .subscribe(onNext: { n in
      variable.value = n
    }, onCompleted:  {
      uiDisposable.dispose()
    })
  
  return Disposables.create(uiDisposable, bindToVariable)
}

// MARK: - One-way binding
infix operator <-- : Right

public func <-- <T>(binder: Binder<T>, observable: Observable<T>) -> Disposable {
  let disposable = observable.bind(to: binder)
  return disposable
}

public func <-- <T>(binder: Binder<T>, variable: Variable<T>) -> Disposable {
  let disposable = variable.asObservable().bind(to: binder)
  return disposable
}

// MARK: - Convert to Optional
prefix operator ?=

public prefix func ?= <T>(variable: Variable<T>) -> Observable<T?> {
  let optional = variable.asObservable()
    .map { value -> T? in
      return value
    }
  return optional
}

public prefix func ?= <T>(observable: Observable<T>) -> Observable<T?> {
  let optional = observable
    .map { value -> T? in
      return value
    }
  return optional
}
