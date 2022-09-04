//
//  Header.swift
//  StaticTableView-With-CollectionView
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation
import UIKit

class Header: UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let identifier = "header"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: 0,
                                  y: contentView.frame.size.height-10-titleLabel.frame.size.height,
                                  width: contentView.frame.size.width,
                                  height: titleLabel.frame.size.height)
        
        subtitleLabel.sizeToFit()
        subtitleLabel.frame = CGRect(x: 0,
                                     y: contentView.frame.size.height-35-subtitleLabel.frame.size.height,
                                     width: contentView.frame.size.width,
                                     height: subtitleLabel.frame.size.height)
    }
    
    func style() {
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitleLabel.textColor = UIColor(named: "amazonColor")
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.tintColor = .white
    }
    
    func layout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
//        NSLayoutConstraint.activate([
//            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
//            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//
//            titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
//        ])
    }
}
