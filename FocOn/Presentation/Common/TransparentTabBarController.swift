//
//  TransparentTabBarController.swift
//  FocOn
//
//  Created by Artem Gorshkov on 17.09.21.
//

import UIKit

class TransparentTabBarController: UIViewController {
    // MARK: - Properties
    private let tabBarView = UIView()
    private let buttonStackView = UIStackView()

    private var viewControllers: [UIViewController] = []
    private var selectedIndex = 0

    // MARK: - Life cucle methods
    override func loadView() {
        view = UIView()

        view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }

        tabBarView.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(10)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Internal methods
    func setViewControllers(_ controllers: [UIViewController]) {
        for index in 0..<controllers.count {
            let tabBarItem = controllers[index].tabBarItem

            let button = UIButton()
            button.snp.makeConstraints { $0.size.equalTo(40) }
            button.setImage(tabBarItem?.image, for: .normal)
            button.setTitle(tabBarItem?.title, for: .normal)
            button.layer.cornerRadius = 20
            button.tintColor = .lightGray
            button.backgroundColor = .black.withAlphaComponent(0.1)
            button.tag = index
            button.addTarget(self, action: #selector(tabBatItemAction), for: .touchUpInside)
            
            buttonStackView.addArrangedSubview(button)
        }

        viewControllers = controllers
        add(viewControllers[selectedIndex])
    }

    func setSelected(index: Int) {
        selectedIndex = index
        updateCurrentController(for: index)
    }

    // MARK: - Private methods
    @objc private func tabBatItemAction(_ sender: UIButton) {
        let newIndex = sender.tag
        guard newIndex != selectedIndex else { return }
        updateCurrentController(for: newIndex)
    }

    private func updateCurrentController(for index: Int) {
        remove(viewControllers[selectedIndex])
        add(viewControllers[index])
        selectedIndex = index
    }

    private func setupUI() {
        tabBarView.backgroundColor = .clear

        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 8
    }
}

// MARK: - View Containment API
extension TransparentTabBarController {
    private func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)

        child.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        view.sendSubviewToBack(child.view)
        child.didMove(toParent: self)
    }

    /// Remove a vc previously added from the children
    private func remove(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.view.snp.removeConstraints()
        child.removeFromParent()
    }
}
