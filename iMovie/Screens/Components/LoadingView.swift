//
//  LoadingView.swift
//  iMovie
//
//  Created by pedro tres on 14/04/22.
//

import UIKit

final class LoadingView: UIView {
    
    private let shouldAnimate: Bool
    
    private lazy var loadingContainer: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.isOpaque = true
        container.isHidden = false
        container.backgroundColor = .black
        return container
    }()
    
    private lazy var loadingSpinner: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.isHidden = false
        indicator.color = .white
        return indicator
    }()
    
    private lazy var loadingMessage: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    init(shouldAnimate: Bool = true) {
        self.shouldAnimate = shouldAnimate
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLoadingMessage(_ message: String?) {
        loadingMessage.text = message ?? "Loading..."
    }
    
    func updateLoading(_ isLoading: Bool) {
        isHidden = !isLoading
        
        guard shouldAnimate else { return }
        
        if isLoading {
            loadingSpinner.startAnimating()
        } else {
            loadingSpinner.stopAnimating()
        }
    }
}

private extension LoadingView {
    
    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(loadingContainer)
        loadingContainer.addSubview(loadingMessage)
        loadingContainer.addSubview(loadingSpinner)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.loadingContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.loadingContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.loadingContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.loadingContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor ),
            self.loadingMessage.centerYAnchor.constraint(equalTo: loadingContainer.centerYAnchor, constant: -50),
            self.loadingMessage.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor),
            self.loadingSpinner.topAnchor.constraint(equalTo: loadingMessage.bottomAnchor, constant: 10),
            self.loadingSpinner.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor),
        ])
    }
}
