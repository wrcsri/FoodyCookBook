//
//  TableViewCell.swift
//  FoodyCookBook
//
//  Created by Arun Darla on 15/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellBackView: UIView!
    @IBOutlet weak var imgDish: ImageCacheView!
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var lblLocName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellBackView.layer.cornerRadius = 10
        cellBackView.clipsToBounds = true
        imgDish.layer.cornerRadius = imgDish.layer.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
