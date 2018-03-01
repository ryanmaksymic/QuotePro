//
//  LorempixelAPI.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

class LorempixelAPI
{
  // Generates a random image using the Lorempixel API:
  func getRandomImage(completionHandler: @escaping (UIImage?) -> Void)
  {
    let url = "http://lorempixel.com/375/375/"
    
    request(to: url) { (data, error) in
      
      if let data = data, let image = UIImage(data: data), error == nil
      {
        completionHandler(image)
      }
      else
      {
        completionHandler(nil)
      }
    }
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
