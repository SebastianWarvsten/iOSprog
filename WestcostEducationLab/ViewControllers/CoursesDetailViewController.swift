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
    let currentUser = LoginViewController.currentUser
    
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
        currentUser.addToCourses(course)
        
        course.title = newCourse.title
        course.subtitle = newCourse.subtitle
        
        do{
            try context.save()
            print("Saveing course to currentUsers CoreData was successful")
        }catch {
            print("Unable to save course to currentUsers CoreData")
        }
    }
}
