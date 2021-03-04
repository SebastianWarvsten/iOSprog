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
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
