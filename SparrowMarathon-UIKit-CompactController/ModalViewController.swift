//
//  ModalViewController.swift
//  SparrowMarathon-UIKit-CompactController
//
//  Created by Sergey Leontiev on 13.11.24..
//

import UIKit

final class ModalViewController: UIViewController {
    private lazy var sizeSegmentedControl: UISegmentedControl = {
        let actions = [280, 150].map { size in
            return UIAction(title: "\(size)pt") { [weak self] _ in
                self?.preferredContentSize = CGSize(width: 300, height: size)
            }
        }
        let control = UISegmentedControl(frame: .zero, actions: actions)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    private lazy var dismissButon: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(dismissButonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(sizeSegmentedControl)
        view.addSubview(dismissButon)
        
        NSLayoutConstraint.activate([
            sizeSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            sizeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButon.centerYAnchor.constraint(equalTo: sizeSegmentedControl.centerYAnchor),
            dismissButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func dismissButonTapped() {
        dismiss(animated: true)
    }
}
