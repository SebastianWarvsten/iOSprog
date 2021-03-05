//
//  CoursesDetailViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-04.
//

import UIKit

class CoursesDetailViewController: UIViewController {

    @IBOutlet weak var titleLabelCourseDetail: UILabel!
    @IBOutlet weak var textViewDetail: UITextView!
    
    var item: CoursesModel!
    var itemIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabelCourseDetail.text = "\(item.title)"
        self.textViewDetail.text = "\(item.label)"
        
    }

}
