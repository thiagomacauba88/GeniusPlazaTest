//
//  HomeTableViewCell.swift
//  GeniusPlazaTest
//
//  Created by Thiago on 07/03/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var itunesImageView: UIImageView! {
        didSet {
            self.itunesImageView.layer.masksToBounds = true
            self.itunesImageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            self.titleLabel.text = ""
        }
    }
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            self.subtitleLabel.text = ""
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super .prepareForReuse()
        self.titleLabel.text = ""
        self.subtitleLabel.text = ""
        self.itunesImageView.image = nil
    }
    
    func setup(resultResponse: ResultsResponse) {
        self.titleLabel.text = resultResponse.name ?? ""
        self.subtitleLabel.text = resultResponse.artistName ?? ""
        if let avatar = resultResponse.artworkUrl100 {
            if let url = URL(string: avatar) {
                let resources = ImageResource(downloadURL: url, cacheKey: nil)
                self.itunesImageView.kf.setImage(with: resources)
            }
        }
    }
}
