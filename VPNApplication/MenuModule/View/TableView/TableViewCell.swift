//
//  TableViewCell.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


class TableViewCell:UITableViewCell {
    
    let cornerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.06274509804, blue: 1, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(cornerView)
        NSLayoutConstraint.activate([
            cornerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cornerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cornerView.heightAnchor.constraint(equalToConstant: self.frame.height ),
           
        ])
        textLabel?.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
