//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol QuoteBuilderDelegate
{
  func quoteBuilder(quoteBuilder: QuoteBuilderViewController, didCreateQuote quote: Quote)
}


// MARK: - Class

class QuoteBuilderViewController: UIViewController
{
  // MARK: - Properties
  
  @IBOutlet weak var quoteView: QuoteView!
  
  var delegate: QuoteBuilderDelegate?
  
  
  // MARK: -
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  
  // MARK: - Actions
  
  @IBAction func randomQuote(_ sender: UIButton)
  {
    // TODO: API call
  }
  
  @IBAction func randomPhoto(_ sender: UIButton)
  {
    // TODO: API call
  }
  
  @IBAction func save(_ sender: UIBarButtonItem)
  {
    let quote = Quote(quote: quoteView.quoteLabel.text!, source: quoteView.sourceLabel.text!)
    // TODO: Add photo to Quote object; reformat initializer?
    
    delegate?.quoteBuilder(quoteBuilder: self, didCreateQuote: quote)
    
    self.navigationController?.popViewController(animated: true)
  }
}
