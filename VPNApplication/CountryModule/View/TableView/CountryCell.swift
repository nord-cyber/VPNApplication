//
//  CountryCell.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


class CountryCell:UITableViewCell {
    
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
