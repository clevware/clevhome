//
//  IndexTableViewCell.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!

    @IBOutlet weak var state: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(data:Device){
        img.image = R.image.light_bright()
        title.text = data.type.rawValue
        desc.text = data.desc
        state.text = data.state.rawValue
        
        switch data.state {
        case .on:
            state.backgroundColor  = UIColor.green
        default:
            state.backgroundColor  = UIColor.lightGray
        }
    }
    
}
