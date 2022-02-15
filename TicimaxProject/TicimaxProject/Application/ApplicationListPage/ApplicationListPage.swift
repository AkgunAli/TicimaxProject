//
//  ApplicationListPage.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import UIKit
import Kingfisher

class ApplicationListPage: UIViewController {
    let viewModel = ApplicationListPageVM()
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMemes { 
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        title = viewModel.title
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(UINib(nibName: ApplicationItemCell().nibName, bundle: nil), forCellReuseIdentifier: ApplicationItemCell().nibName)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.rowHeight = 400        
    }
}

// MARK:  UITableViewDelegate,UITableViewDataSource

extension ApplicationListPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.memesResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationItemCell", for: indexPath) as! ApplicationItemCell
        let items = viewModel.memesResponse[indexPath.row]
        cell.configure(for: items)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(viewModel.memesResponse[indexPath.row].name)")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ApplicationDetailPageVC") as! ApplicationDetailPageVC
        vc.viewModel.imageUrl = viewModel.memesResponse[indexPath.row].url ??  ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
