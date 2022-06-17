//
//  AddReviewViewController.swift
//  Adidas
//
//  Created Vladislav Dudin on 17.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = AddReviewModule
private typealias View = Module.ViewController

extension Module {
    final class ViewController: BaseViewController {
        // MARK: - Dependencies

        var output: ViewOutput!

        // MARK: - Variables

        private lazy var containerStack: UIStackView = build {
            $0 <~ Style.Stack.defaultVerticalStack8
        }

        private lazy var productImageView: UIImageView = build {
            $0.contentMode = .scaleAspectFill
            $0.cornerRadius(10)
            $0.kf.setImage(with: URL(string: product?.imgUrl ?? ""))
        }

        private lazy var inputTextField: UITextField = build {
            $0.borderStyle = .roundedRect
            $0.delegate = self
            $0.placeholder = Localize.addReviewTextFieldPlaceholder.localized
        }

        private lazy var ratingTextField: UITextField = build {
            $0.inputView = pickerView
            $0.borderStyle = .roundedRect
            $0.tintColor = .clear
            $0.delegate = self
            $0.placeholder = Localize.addReviewPlaceholder.localized
        }

        private lazy var pickerView: UIPickerView = build {
            $0.dataSource = self
            $0.delegate = self
        }

        private lazy var sendReviewButton: UIButton = build {
            $0.setTitle(Localize.addReviewSendButtonTitle.localized, for: .normal)
            $0.configuration = .borderedTinted()
            $0.addAction(sendReviewAction, for: .touchUpInside)
        }

        private lazy var sendReviewAction: UIAction = .init { _ in
            self.output.sendReview(with: self.inputTextField.text, rating: self.ratingTextField.text)
        }

        private let ratingDataSource = ["1", "2", "3", "4", "5"]
        private var product: ProductModel?

        // MARK: - Lifecycle

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        init(item: ProductModel?) {
            self.product = item
            super.init(nibName: nil, bundle: nil)

        }

        override func viewDidLoad() {
            super.viewDidLoad()

            output?.didLoad()
            initialSetup()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            output?.didAppear()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension View {
    private func initialSetup() {
        view.addSubview(containerStack)
        containerStack.addArrangedSubview(productImageView)
        containerStack.addArrangedSubview(inputTextField)
        containerStack.setCustomSpacing(20, after: inputTextField)
        containerStack.addArrangedSubview(ratingTextField)
        containerStack.addArrangedSubview(sendReviewButton)
        containerStack.addArrangedSubview(UIView())

        makeConstraints()
        title = AddReviewModule.Localize.addReviewNavigationTitle.localized
    }

    private func makeConstraints() {
        containerStack.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.topMargin.equalToSuperview()
        }
        productImageView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        sendReviewButton.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
}

extension View: Module.ViewInput { }

// MARK: - UIPickerViewDataSource -
extension View: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ratingDataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ratingTextField.text = ratingDataSource[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        ratingDataSource[row]
    }
}

// MARK: - UITextFieldDelegate

extension View: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard ratingTextField === textField else { return }

        textField.text = ratingDataSource[pickerView.selectedRow(inComponent: .zero)]
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
