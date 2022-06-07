//
//  LocationTableViewCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/06/02.
//

import UIKit
import SnapKit

final class LocationTableViewCell: UITableViewCell {
    
    static let identifier = "LocationTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func layout() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(12)
            $0.leading.equalTo(contentView).offset(20)
            $0.trailing.equalTo(contentView).offset(-20)
        }
    }
}

// MARK: - functions

extension LocationTableViewCell {
    func setData(title: String) {
        titleLabel.text = title
    }
}
