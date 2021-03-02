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
        for c in webCourses {
            let item = CoursesModel(title: categories[0], label: c)
            tempItem.append(item)
        }
        for c in progCourses {
            let item = CoursesModel(title: categories[1], label: c)
            tempItem.append(item)
        }
        for c in backCourses {
            let item = CoursesModel(title: categories[2], label: c)
            tempItem.append(item)
        }
        for c in dataCourses {
            let item = CoursesModel(title: categories[3], label: c)
            tempItem.append(item)
        }
        
        return tempItem
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
