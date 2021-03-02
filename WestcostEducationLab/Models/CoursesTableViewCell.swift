//
//  coursesTableViewCell.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-01.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseTableLabel: UILabel!
    @IBOutlet weak var courseSubLabel: UILabel!
    
    func setItem(item: CoursesModel){
        courseTableLabel.text = item.title
        courseSubLabel.text = item.label
    }
}
