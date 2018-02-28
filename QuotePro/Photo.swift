//
//  Photo.swift
//  QuotePro
//
//  Created by Ryan Maksymic on 2018-02-28.
//  Copyright © 2018 Ryan Maksymic. All rights reserved.
//

import UIKit

class Photo
{
  var image: UIImage
  
  init(image: UIImage)
  {
    self.image = image
  }
  
  // TODO: Remove this temporary method
  init()
  {
    self.image = UIImage(named: "defaultPhoto")!
  }
}
