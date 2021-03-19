//
//  CourseViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-01.
//

import UIKit

class CoursesViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController()
    var items = [UserCourseModel]()
    var filteredCategories = [UserCourseModel]()
    
    let categories = ["Webbutveckling", "Programmeringförmobilaenheter", "Backendprogrammering", "Databaser"]
    let webCourses = ["HTML och CSS", "Avancerad CSS", "JavaScript för nybörjare", "Avancerad JavaScript och serverprogrammering", "JavaScript för webben", "ASP.NET Core MVC"]
    let progCourses = ["Introduktion till Android programmering", "Avancerad Android programmering", "iOS utveckling med Objective-C", "iOS utveckling med Swift", "Design och layout för mobila enheter"]
    let backCourses = ["REST Api med node.js", "Web Api med .NET Core"]
    let dataCourses = ["Administrera MS SQL Server", "Databas design", "Bygga system med MongoDB", "Vad är ORM? Hur använder man ett sådant verktyg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = createArray()
        
        filteredCategories = items
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func createArray() -> [UserCourseModel] {
        var tempItem: [UserCourseModel] = []
        tempItem.append(contentsOf: insertAllArrayInfo(course: webCourses, categoryNumber: 0 ))
        tempItem.append(contentsOf: insertAllArrayInfo(course: progCourses, categoryNumber: 1))
        tempItem.append(contentsOf: insertAllArrayInfo(course: backCourses, categoryNumber: 2))
        tempItem.append(contentsOf: insertAllArrayInfo(course: dataCourses, categoryNumber: 3))
        return tempItem
    }
    
    func insertAllArrayInfo(course: [String], categoryNumber: Int) -> [UserCourseModel]{
        var tempCourseItem: [UserCourseModel] = []
            for c in course {
                let courseItem = UserCourseModel(title: categories[categoryNumber], label: c)
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
        return filteredCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let course = filteredCategories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursesTableViewCell") as! CoursesTableViewCell
        cell.setItem(item: course)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item: UserCourseModel!
        
        item = filteredCategories[indexPath.row]
        let itemTuple = (indexPath.row, item)
        
        performSegue(withIdentifier: "showCourseDetails", sender: itemTuple)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showCourseDetails" {

            guard let vc = segue.destination as? CoursesDetailViewController else { return }
            guard let item = sender as? (Int, UserCourseModel) else { return }

            vc.item = item.1
            vc.itemIndex = item.0
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredCategories = []
        if(searchText == ""){
            filteredCategories = items
        }else{
            for category in items{
                if(category.title.lowercased().contains(searchText.lowercased())){
                    filteredCategories.append(category)
                }
            }
        }
        self.tableView.reloadData()
    }
}
