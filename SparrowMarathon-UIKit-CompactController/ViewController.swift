//
//  ViewController.swift
//  SparrowMarathon-UIKit-CompactController
//
//  Created by Sergey Leontiev on 13.11.24..
//

import UIKit

class ViewController: UIViewController {
    private lazy var presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(presentButton)
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func presentButtonTapped() {
        let viewController = ModalViewController()
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = CGSize(width: 300, height: 280)
        viewController.popoverPresentationController?.sourceView = presentButton
        viewController.popoverPresentationController?.delegate = self
        present(viewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
