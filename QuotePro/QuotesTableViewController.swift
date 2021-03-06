//
//  QuotesTableViewController.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController, QuoteBuilderDelegate
{
  // MARK: - Properties
  
  var quotes = [Quote]()
  
  
  // MARK: -
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem
  }
  
  
  // MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return quotes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as? QuotesTableViewCell else
    {
      fatalError("The dequeued cell is not an instance of MealTableViewCell.")
    }
    
    let quote = quotes[indexPath.row]
    
    cell.quoteLabel.text = quote.quote
    cell.sourceLabel.text = quote.source
    cell.quoteImageView.image = quote.photo.image
    
    return cell
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  
  // MARK: - UITableViewDelegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  {
    let quote = quotes[indexPath.row]
    
    let exportView = QuoteView()
    exportView.frame.size = CGSize(width: 375, height: 375)
    exportView.quoteLabel.text = quote.quote
    exportView.sourceLabel.text = quote.source
    exportView.quoteImageView.image = quote.photo.image
    
    UIGraphicsBeginImageContextWithOptions(exportView.bounds.size, true, 0)
    exportView.drawHierarchy(in: exportView.bounds, afterScreenUpdates: true)
    let quoteImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    let share = UIActivityViewController(activityItems: [quoteImage], applicationActivities:nil)
    
    self.present(share, animated: true, completion: nil)
  }
  
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let destinationVC = segue.destination as? QuoteBuilderViewController
    {
      destinationVC.delegate = self
    }
  }
  
  
  // MARK: - QuoteBuilderDelegate
  
  func quoteBuilder(quoteBuilder: QuoteBuilderViewController, didCreateQuote quote: Quote)
  {
    quotes.append(quote)
    
    self.tableView.reloadData()
  }
}
