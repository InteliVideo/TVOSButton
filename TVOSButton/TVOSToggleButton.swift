//
//  TVOSToggleButton.swift
//  TVOSButton
//
//  Created by Cem Olcay on 15/02/16.
//  Copyright © 2016 MovieLaLa. All rights reserved.
//

import UIKit

public typealias TVOSToggleButtonDidToggledAction = (_ currentState: TVOSToggleButtonState, _ newState: (_ newState: TVOSToggleButtonState) -> Void) -> Void

public enum TVOSToggleButtonState {
  case waiting
  case on
  case off
}

open class TVOSToggleButton: TVOSButton {

  // MARK; Properties

  open var toggleState: TVOSToggleButtonState = .waiting
  open var didToggledAction: TVOSToggleButtonDidToggledAction? {
    didSet {
      didToggled(self)
    }
  }

  // MARK: Init

  public init(initialState: TVOSToggleButtonState, didToggledAction: TVOSToggleButtonDidToggledAction?) {
    super.init(frame: CGRect.zero)
    self.toggleState = initialState
    self.didToggledAction = didToggledAction
    commonInit()
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  open func commonInit() {
    addTarget(self, action: #selector(TVOSToggleButton.didToggled(_:)), for: .primaryActionTriggered)
  }

  // MARK: Toggle

  @objc open func didToggled(_ sender: TVOSToggleButton) {
    didToggledAction?(
      toggleState,
      { state in
        self.toggleState = state
      })
  }
}
