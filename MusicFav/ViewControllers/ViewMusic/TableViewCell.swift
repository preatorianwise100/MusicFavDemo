//
//  TableViewCell.swift
//  MusicFav
//
//  Created by Jose David Bustos H on 11/8/19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var LabelArtistName: UILabel!
    @IBOutlet weak var LabelCollectionName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
