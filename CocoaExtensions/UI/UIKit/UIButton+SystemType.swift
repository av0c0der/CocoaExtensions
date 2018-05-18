//
//  UIButton+SystemType.swift
//  CocoaExtensions-iOS
//
//  Created by Abdurahim Jauzee on 19/05/2018.
//

#if os(iOS)

import UIKit
import RxSwift

extension UIButton {
  
  private func setAlpha(_ alpha: CGFloat) {
    UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
      self.alpha = alpha
    }, completion: nil)
  }
  
  /**
   Will make the button behaves like a button of System Type.
   */
  func makeSystemButtonType(minAlpha: CGFloat = 0.5) {
    rx.methodInvoked(#selector(UIView.touchesBegan(_:with:)))
      .subscribe(onNext: { [weak self] _ in
        self?.setAlpha(minAlpha)
      })
      .disposed(by: bag)
    
    let cancelObservables = [#selector(UIView.touchesEnded(_:with:)), #selector(UIView.touchesCancelled(_:with:))].map { rx.methodInvoked($0) }
    Observable.merge(cancelObservables)
      .subscribe(onNext: { [weak self] _ in
        self?.setAlpha(1)
      })
      .disposed(by: bag)
  }
  
}

#endif
