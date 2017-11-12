//
//  Rx.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 12/11/2017.
//

import Foundation
import RxSwift
import RxCocoa

precedencegroup Binding {
  associativity: none
  higherThan: Additive
}

precedencegroup Additive {
  associativity: left
  higherThan: MultiplicationPrecedence
}

infix operator >>> : Additive

func >>> (lhs: Disposable, rhs: DisposeBag) {
  rhs.insert(lhs)
}

infix operator <-> : Binding

func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
  let bindToUIDisposable = variable.asObservable()
    .bind(to: property)
  let bindToVariable = property
    .subscribe(onNext: { n in
      variable.value = n
    }, onCompleted:  {
      bindToUIDisposable.dispose()
    })
  
  return Disposables.create(bindToUIDisposable, bindToVariable)
}

