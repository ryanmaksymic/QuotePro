//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController
{
  // MARK: - Properties
  
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var sourceLabel: UILabel!
  @IBOutlet weak var quoteImageView: UIImageView!
  
  
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
    // TODO: Create Quote object
  }
  
}

