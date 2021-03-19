//
//  MyCoursesViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-05.
//

import UIKit
import CoreData

class WishlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var courses: [UserCourseModel] = [UserCourseModel]()
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark: Autorefresh
    override func viewDidAppear(_ animated: Bool) {
        setupCoursesList()
    }
    
    //MARK: Setup list of courses from CoreData
    func setupCoursesList(){

        courses.removeAll()
        for kurser in LoginViewController.currentUser.courses ?? []{
            let currentUserCourses = UserCourseModel(title: (kurser as AnyObject).title ?? "",
                                                     label: (kurser as AnyObject).subtitle ?? "")
            
            courses.append(currentUserCourses)
            print("Course added to MyCourses")
            tableView.reloadData()
        }
    }
    
    //MARK: Setup table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = courses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistTableViewCell") as! CoursesTableViewCell
        cell.setItem(item: course)
        
        return cell
    }
    
    //MARK: Move to next page with information
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = courses[indexPath.row]
        let itemTuple = (indexPath.row, item)
        
        performSegue(withIdentifier: "showWishlistDetails", sender: itemTuple)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showWishlistDetails" {

            guard let vc = segue.destination as? CoursesDetailViewController else { return }
            guard let item = sender as? (Int, UserCourseModel) else { return }

            vc.item = item.1
            vc.itemIndex = item.0
        }
    }
    
    //MARK: Delete rows
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [deleteCourseAction(forRowAt: indexPath)])
    }

    func deleteCourseAction(forRowAt indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (UIContextualAction, swipeButton, completionHandler: (Bool)-> Void) in
            let coursesFromCoreData = try? self.context.fetch(UserCourses.fetchRequest()) as? [UserCourses]
            
            self.context.delete(coursesFromCoreData![indexPath.row])

            do{
                try self.context.save()
                print("Course was successfully deleted from Wishlist")
            } catch {
                print("Unable to delete course from Wishlist")
            }
            self.courses.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        return action
    }
}
