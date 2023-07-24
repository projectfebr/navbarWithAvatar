//
//  ViewController.swift
//  navbarWithAvatar
//
//  Created by Aleksandr Bolotov on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar"
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        view.addSubview(scrollView)
    }
}

public class NavigationBar: UINavigationBar {
    
    private lazy var someImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupAttributesForLargeTitle()
    }
    
    private func setupAttributesForLargeTitle() {
        if let largeTitle = subviews.filter({ NSStringFromClass(type(of: $0)).contains("LargeTitleView") }).first {
            for subview in largeTitle.subviews {
                largeTitle.addSubview(someImageView)
                NSLayoutConstraint.activate([
                    someImageView.rightAnchor.constraint(equalTo: largeTitle.rightAnchor,
                                                     constant: -16),
                    someImageView.centerYAnchor.constraint(equalTo: subview.centerYAnchor),
                    someImageView.heightAnchor.constraint(equalToConstant: 36),
                    someImageView.widthAnchor.constraint(equalToConstant: 36)
                ])

            }
        }
    }
}
