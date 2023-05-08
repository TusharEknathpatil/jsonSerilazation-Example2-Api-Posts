//
//  ViewController.swift
//  JsonSerilazation-ArrayInObject-8-May
//
//  Created by Mac on 08/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    var posts:[Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        connectXib()
        FetchApiByJsoSerilazation()
       
    }

    func connectXib() {
        let uiNibName = UINib(nibName: "PostTableViewCell", bundle: nil)
        postTableView.register(uiNibName, forCellReuseIdentifier: "PostTableViewCell")
    }

    
    func FetchApiByJsoSerilazation() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = urlSession.dataTask(with: request) {
            Data,response,error in
            
            print(Data)
            print(response)
            print(error)
            let jsonObjectOfArray = try! JSONSerialization.jsonObject(with: Data!) as! [[String:Any]]
            for jsonArrayBind in  jsonObjectOfArray {
                let eachOject = jsonArrayBind as! [String:Any]
                let userIdOf = eachOject["userId"] as! Int
                let idOf = eachOject["id"] as! Int
                let titleOf = eachOject["title"] as! String
                let bodyOf = eachOject["body"] as! String
                
                let addNew = Post(userId: userIdOf, id: idOf, title: titleOf, body: bodyOf)
                self.posts.append(addNew)
            }
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        dataTask.resume()
        
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.userIdLbl.text = posts[indexPath.row].userId.description
        cell.userIdLbl.text = posts[indexPath.row].id.description
        cell.titleLbl.text = posts[indexPath.row].title
        cell.bodyLbl.text = posts[indexPath.row].body
        cell.backgroundColor = .blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.0
    }
}
