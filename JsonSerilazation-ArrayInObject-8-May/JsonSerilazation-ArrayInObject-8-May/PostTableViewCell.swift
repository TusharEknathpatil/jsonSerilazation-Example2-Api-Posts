//
//  PostTableViewCell.swift
//  JsonSerilazation-ArrayInObject-8-May
//
//  Created by Mac on 08/05/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLbl: UILabel!
    
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var bodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
