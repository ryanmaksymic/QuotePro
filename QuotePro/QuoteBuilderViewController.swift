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
    
    quoteView.quoteLabel.text = "Sup dude!"
    quoteView.sourceLabel.text = "- Ryan M."
    quoteView.quoteImageView.image = UIImage(named: "defaultPhoto")!
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
    //let quote = Quote(quote: quoteLabel.text!, source: sourceLabel.text!)
    
    // TODO: Save photo
    
    //delegate?.quoteBuilder(quoteBuilder: self, didCreateQuote: quote)
    
    self.navigationController?.popViewController(animated: true)
  }
}
