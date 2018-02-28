//
//  ForismaticAPI.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import Foundation

class ForismaticAPI
{
  // Generates a tuple containing a quote and source using the Forismatic API:
  func getRandomQuote(completionHandler: @escaping ((String, String)?) -> Void)
  {
    let url = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
    
    request(to: url) { (data, error) in
      
      if error == nil
      {
        completionHandler(self.string(fromJSON: data))
      }
      else
      {
        completionHandler(nil)
      }
    }
  }
  
  // Converts JSON data into a tuple of two strings:
  func string(fromJSON json: Data?) -> (String, String)?
  {
    guard let json = json else
    {
      return nil
    }
    
    let jsonObject: Any
    
    do
    {
      jsonObject = try JSONSerialization.jsonObject(with: json, options: [])
    }
    catch
    {
      return nil
    }
    
    guard let quoteObject = jsonObject as? [String: String], let quote = quoteObject["quoteText"], let source = quoteObject["quoteAuthor"] else
    {
      return nil
    }
    
    return (quote, source)
  }
  
  // Returns data returned from request using given URL:
  func request(to url: String, completionHandler: @escaping (Data?, Error?) -> Void)
  {
    guard let url = URL(string: url) else
    {
      completionHandler(nil, nil)
      return
    }
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
      
      completionHandler(data, error)
    }
    
    dataTask.resume()
  }
}
