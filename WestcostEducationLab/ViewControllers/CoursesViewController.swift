//
//  CourseViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-01.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [CoursesModel] = []
    let categories = ["Webbutveckling", "Programmeringförmobilaenheter", "Backendprogrammering", "Databaser"]
    let webCourses = ["HTML och CSS", "Avancerad CSS", "JavaScript för nybörjare", "Avancerad JavaScript och serverprogrammering", "JavaScript för webben", "ASP.NET Core MVC"]
    let progCourses = ["Introduktion till Android programmering", "Avancerad Android programmering", "iOS utveckling med Objective-C", "iOS utveckling med Swift", "Design och layout för mobila enheter"]
    let backCourses = ["REST Api med node.js", "Web Api med .NET Core"]
    let dataCourses = ["Administrera MS SQL Server", "Databas design"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [CoursesModel] {
        var tempItem: [CoursesModel] = []
        tempItem.append(contentsOf: insertAllArrayInfo(course: webCourses, categoryNumber: 0 ))
        tempItem.append(contentsOf: insertAllArrayInfo(course: progCourses, categoryNumber: 1))
        tempItem.append(contentsOf: insertAllArrayInfo(course: backCourses, categoryNumber: 2))
        tempItem.append(contentsOf: insertAllArrayInfo(course: dataCourses, categoryNumber: 3))
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

extension CoursesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursesTableViewCell") as! CoursesTableViewCell
        
        cell.setItem(item: course)
        
        return cell
    }
}
