//
//  RoundedBorderButton.swift
//  recordingApp
//
//  Created by 조예진 on 06/05/2019.
//  Copyright © 2019 조예진. All rights reserved.
//
import UIKit

@IBDesignable
class RoundedBorderButton: UIButton {
  
  var isSelectableToggleValue: Bool = false
  
  
  @IBInspectable dynamic var cornerRadius: CGFloat = 20.0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = true
    }
  }
  
  @IBInspectable dynamic var borderWidth: CGFloat = 1.0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable dynamic var verticalInset: CGFloat = 5.0 {
    didSet {
      contentEdgeInsets.top = verticalInset
      contentEdgeInsets.bottom = verticalInset
    }
  }
  
  @IBInspectable dynamic var horizontalInset: CGFloat = 10.0 {
    didSet {
      contentEdgeInsets.left = horizontalInset
      contentEdgeInsets.right = horizontalInset
    }
  }
  
  @IBInspectable dynamic var isSelectable: Bool = false {
    didSet {
      if isSelectable{
        // 토글시 색상반전
        if isSelectableToggleValue{
          self.backgroundColor = .black
          self.titleLabel!.textColor = .white
        } else {
          self.backgroundColor = .white
          self.titleLabel!.textColor = .black
        }
      }
      else{
        // 일반 버튼
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    _init()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    _init()
  }
  
  func _init() {
    self.addTarget(self, action: #selector(buttonPress(button:)), for: .touchUpInside)
    self.titleLabel?.textColor = .black
    
    clipsToBounds = true
    layer.borderColor = titleColor(for: .normal)?.cgColor
    //    setTitleColor(titleColor(for: .normal)?.withAlphaComponent(highlightedAlpha), for: .highlighted)
    
    // repeat all didSets so that defaults are applied
    layer.cornerRadius = cornerRadius
    layer.borderWidth = borderWidth
    contentEdgeInsets.top = verticalInset
    contentEdgeInsets.bottom = verticalInset
    contentEdgeInsets.left = horizontalInset
    contentEdgeInsets.right = horizontalInset
  }
  
  private var normalAlpha: CGFloat = 1
  private var highlightedAlpha: CGFloat = 0.2
  private var borderColorAlpha: CGFloat? {
    get {
      return layer.borderColor?.alpha
    }
    set {
      if let borderColor = layer.borderColor,
        let newAlpha = newValue {
        layer.borderColor = UIColor(cgColor: borderColor).withAlphaComponent(CGFloat(newAlpha)).cgColor
      }
    }
  }
  
  @objc func buttonPress(button: RoundedBorderButton) {
    self.isSelectable = !self.isSelectable
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if borderWidth > 0 {
      if state == .highlighted && borderColorAlpha != highlightedAlpha {
        borderColorAlpha = highlightedAlpha
        layoutIfNeeded()
      } else if state == .normal && borderColorAlpha != normalAlpha {
        borderColorAlpha = normalAlpha
        layoutIfNeeded()
      }
    }
  }
}
