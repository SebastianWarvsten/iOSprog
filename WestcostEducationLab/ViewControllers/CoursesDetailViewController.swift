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
    
    var item: UserCourseModel!
    var itemIndex: Int!
    
    var courses: [UserCourseModel] = [UserCourseModel]()
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabelCourseDetail.text = "\(item.title)"
        textViewDetail.text = "\(item.subtitle)"
        
    }
    @IBAction func addToWishlistButton(_ sender: UIButton) {
        let course = UserCourseModel(title: self.titleLabelCourseDetail.text!, label: self.textViewDetail.text!)
        
        save(newCourse: course)
    }
    
    func save(newCourse: UserCourseModel) {
        let course = UserCourses(context: context)
        
        course.title = newCourse.title
        course.subtitle = newCourse.subtitle
        
        do{
            try context.save()
            print("Saveing to CoreData was successful")
        }catch {
            print("Det gick inget bra!")
        }
    }
}
