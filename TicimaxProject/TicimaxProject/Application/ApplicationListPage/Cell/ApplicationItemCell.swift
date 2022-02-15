//
//  ApplicationItemCell.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import UIKit

class ApplicationItemCell: UITableViewCell {
    let nibName = "ApplicationItemCell"
    let imageMeme = UIImageView()
    let nameMeme = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(imageMeme)
        contentView.addSubview(nameMeme)
        initConstraint()
    }
    
    func initConstraint(){
        imageMeme.translatesAutoresizingMaskIntoConstraints = false
        nameMeme.translatesAutoresizingMaskIntoConstraints = false
        let margins = contentView.layoutMarginsGuide
        imageMeme.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        imageMeme.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        imageMeme.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        imageMeme.bottomAnchor.constraint(equalTo: nameMeme.topAnchor, constant: 0).isActive = true
        imageMeme.heightAnchor.constraint(equalToConstant: 350).isActive = true

        nameMeme.topAnchor.constraint(equalTo: imageMeme.bottomAnchor, constant: 0).isActive = true
        nameMeme.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        nameMeme.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        nameMeme.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        nameMeme.textAlignment = .center
    }
    
    func configure(for content: Memes){
        if let imageUrl = URL(string: content.url ?? "") {
            imageMeme.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "empty"))
        }
        nameMeme.text = content.name
    }
    
}
