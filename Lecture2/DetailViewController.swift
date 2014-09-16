//
//  DetailVC.swift
//  Lecture2
//
//  Created by Кирилл on 09.09.14.
//  Copyright (c) 2014 kirillsidorov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lectureNameLabel: UILabel!
    @IBOutlet weak var lectureDescriptionLabel: UILabel!
    
    var detailInfo: Lecture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lectureDescriptionLabel.numberOfLines = 2
        
        if var _info:Lecture = detailInfo {
            lectureNameLabel.text = _info.name
            lectureDescriptionLabel.text = _info.descr
        }
    }

}
