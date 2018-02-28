//
//  QuoteView.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

class QuoteView: UIView
{
  @IBOutlet var contentView: UIView!
  
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var sourceLabel: UILabel!
  @IBOutlet weak var quoteImageView: UIImageView!
  
  override init(frame: CGRect)
  {
    super.init(frame: frame)
    
    myInit()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    
    myInit()
  }
  
  private func myInit()
  {
    Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  func updateView(withQuote quote: String, source: String, image: UIImage)
  {
//    quoteLabel.text = quote
//    sourceLabel.text = source
//    quoteImageView.image = image
  }
}
