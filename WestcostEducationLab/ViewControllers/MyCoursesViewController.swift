//
//  MyCoursesViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-05.
//

import UIKit

class MyCoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var courses: [CoursesModel] = [CoursesModel]()
    
    let categories = ["Webbutveckling", "Programmeringförmobilaenheter", "Backendprogrammering", "Databaser"]
    let webCourses = ["HTML och CSS", "Avancerad CSS", "JavaScript för nybörjare", "Avancerad JavaScript och serverprogrammering", "JavaScript för webben", "ASP.NET Core MVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courses = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    //MARK: Create Arraylist of my courses
    func createArray() -> [CoursesModel] {
        var tempItem: [CoursesModel] = []
        tempItem.append(contentsOf: insertAllArrayInfo(course: webCourses, categoryNumber: 0 ))
//        tempItem.append(contentsOf: insertAllArrayInfo(course: progCourses, categoryNumber: 1))
//        tempItem.append(contentsOf: insertAllArrayInfo(course: backCourses, categoryNumber: 2))
//        tempItem.append(contentsOf: insertAllArrayInfo(course: dataCourses, categoryNumber: 3))
        return tempItem
    }

    func insertAllArrayInfo(course: [String], categoryNumber: Int) -> [CoursesModel]{
        var tempCourseItem: [CoursesModel] = []
            for c in course {
                let courseItem = CoursesModel(title: categories[categoryNumber], label: c)
                tempCourseItem.append(courseItem)
            }
        return tempCourseItem
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension MyCoursesViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: Setup table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = courses[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCoursesTableViewCell") as! CoursesTableViewCell
        
        cell.setItem(item: course)
        
        return cell
    }
    //MARK: Move to next page with information
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = courses[indexPath.row]
        let itemTuple = (indexPath.row, item)
        
        performSegue(withIdentifier: "showMyCourseDetails", sender: itemTuple)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showMyCourseDetails" {

            guard let vc = segue.destination as? CoursesDetailViewController else { return }
            guard let item = sender as? (Int, CoursesModel) else { return }

            vc.item = item.1
            vc.itemIndex = item.0
        }
    }
}
