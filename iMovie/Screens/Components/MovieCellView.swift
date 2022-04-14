//
//  MovieCellView.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import UIKit

struct MovieCellViewConfiguration {
    let name: String
    let year: String
    let star: String
    let icon: String
}

final class MovieCellView: UITableViewCell {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Configurations.contentStackViewSpacing
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(yearLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var starLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var iconStarView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "estrela")
        return image
    }()
    
    func updateView(with configuration: MovieCellViewConfiguration){
        nameLabel.text = configuration.name
        yearLabel.text = configuration.year.returnYear()
        starLabel.text = configuration.star
        
        let path = URL(string: "https://image.tmdb.org/t/p/w220_and_h330_face\(configuration.icon)")
        getImage(url: path!)
    }
    
    private func getImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.iconImageView.image = image
                    }
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupImageConstraints()
        setupStackViewConstraints()
        setupStarsConstraints()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubViews() {
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(yearLabel)
        addSubview(starLabel)
        addSubview(iconStarView)
    }
}

extension MovieCellView {
    
    private struct Configurations {
        static let iconImageSize: CGSize = .init(width: 70, height: 100)
        static let starImageSize: CGSize = .init(width: 15, height: 15)
        static let contentStackViewSpacing: CGFloat = 5
    }
    
    private func setupImageConstraints() {
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            iconImageView.heightAnchor.constraint(equalToConstant: Configurations.iconImageSize.height),
            iconImageView.widthAnchor.constraint(equalToConstant: Configurations.iconImageSize.width),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10)
        ])
    }
    
    private func setupStackViewConstraints() {
        
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            contentStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            contentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupStarsConstraints() {
        
        contentView.addSubview(iconStarView)
        contentView.addSubview(starLabel)
        
        NSLayoutConstraint.activate([
            iconStarView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            iconStarView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 10),
            iconStarView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            iconStarView.heightAnchor.constraint(equalToConstant: Configurations.starImageSize.height),
            iconStarView.widthAnchor.constraint(equalToConstant: Configurations.starImageSize.width),
            iconStarView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            starLabel.leadingAnchor.constraint(equalTo: iconStarView.trailingAnchor, constant: 5),
            starLabel.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 10),
            starLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func setStyle() {
        backgroundColor = .black
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MovieCellViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let configuration = MovieCellViewConfiguration(name: "Spider-Man: No Way Home", year: "2022", star: "8.7", icon: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
            let restaurantCellView = MovieCellView()
            restaurantCellView.updateView(with: configuration)
            return restaurantCellView
        }
    }
}
#endif
