//
//  Quote.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import Foundation

class Quote
{
  var quote: String
  var source: String
  var photo: Photo?
  
  init(quote: String, source: String)
  {
    self.quote = quote
    self.source = source
    
    // TODO: Remove this temporary method call
    self.photo = Photo()
  }
}
