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
  
  var forismaticAPI = ForismaticAPI()
  var lorempixelAPI = LorempixelAPI()
  
  
  // MARK: -
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    setRandomQuote()
    setRandomImage()
  }
  
  
  // MARK: - Private methods
  
  func setRandomQuote()
  {
    forismaticAPI.getRandomQuote { (quote) in
      
      OperationQueue.main.addOperation {
        
        if quote != nil
        {
          let quoteText = quote!.0.trimmingCharacters(in: .whitespacesAndNewlines)
          var source = quote!.1.trimmingCharacters(in: .whitespacesAndNewlines)
          
          if source == "" { source = "Anonymous" }
          
          self.quoteView.quoteLabel.text = "\"\(quoteText)\""
          self.quoteView.sourceLabel.text = "– \(source)"
        }
      }
    }
  }
  
  func setRandomImage()
  {
    lorempixelAPI.getRandomImage { (image) in
      
      OperationQueue.main.addOperation {
        
        if image != nil
        {
          self.quoteView.quoteImageView.image = image
        }
        
      }
      
    }
  }
  
  
  // MARK: - Actions
  
  @IBAction func randomQuote(_ sender: UIButton)
  {
    setRandomQuote()
  }
  
  @IBAction func randomPhoto(_ sender: UIButton)
  {
    setRandomImage()
  }
  
  @IBAction func save(_ sender: UIBarButtonItem)
  {
    let quote = Quote(quote: quoteView.quoteLabel.text!, source: quoteView.sourceLabel.text!, photo: Photo(image: quoteView.quoteImageView.image!))
    
    delegate?.quoteBuilder(quoteBuilder: self, didCreateQuote: quote)
    
    self.navigationController?.popViewController(animated: true)
  }
}
