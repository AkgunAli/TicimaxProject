//
//  ApplicationDetailPageVC.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 15.02.2022.
//

import UIKit
import Kingfisher

class ApplicationDetailPageVC: UIViewController {
    let viewModel = ApplicationDetailPageVM()
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        InıtUI()
    }
    
    func InıtUI(){
        if let imageUrl = URL(string: viewModel.imageUrl) {
            imageView.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "empty"))
        }
        imageView.frame = self.view.frame
        view.addSubview(imageView)
    }

}
