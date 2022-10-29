//
//  CellOfFirstScrn.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 27.10.22.
//

import UIKit

class CellOfFirstScrn: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var genderStatusSpecies: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var originCharacter: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!{
        didSet{
            avatarImage.layer.cornerRadius = 20
        }
    }
}
