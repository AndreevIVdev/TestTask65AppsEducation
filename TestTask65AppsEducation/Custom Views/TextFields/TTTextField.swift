//
//  TTTextField.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 28.10.2021.
//

import UIKit

final class TTTextField: UITextField {

    var secondaryFont: UIFont?

    private let bottomBorder: UIView = .init()
    private let placeholderLabel: UILabel = .init()

    private let padding: CGFloat = 9
    private let interval: TimeInterval = 0.3

    private var fontSize: CGFloat {
        font?.pointSize ?? 24
    }

    private var secondaryFontSize: CGFloat {
        secondaryFont?.pointSize ?? 12
    }

    private var fontLineHeight: CGFloat {
        font?.lineHeight ?? 28
    }

    private var secondaryFontLineHeight: CGFloat {
        secondaryFont?.lineHeight ?? 16
    }

    private var scale: CGFloat {
        secondaryFontSize / fontSize
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
        configureBottomBorder()
        configurePlaceholderLabel()
        font = UIFont(name: "SFProDisplay-Light", size: 24)!
        secondaryFont = UIFont(name: "SFProDisplay-Light", size: 14)!
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var font: UIFont? {
        didSet {
            placeholderLabel.font = font
        }
    }

    override var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        .zero
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(
            top: padding + ceil(font!.lineHeight),
            left: 0,
            bottom: padding,
            right: 0
        ))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(
            top: padding + ceil(font!.lineHeight),
            left: 0,
            bottom: padding,
            right: 0
        ))
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard !isFirstResponder else {
            return
        }

        placeholderLabel.transform = .identity
        placeholderLabel.frame = bounds.inset(
            by: UIEdgeInsets(
                top: padding + ceil(fontLineHeight),
                left: 0,
                bottom: padding,
                right: 0
            )
        )
    }

    private func configureTextField() {
        borderStyle = .none
        textColor = .white
        autocorrectionType = .no
        addSubViews(bottomBorder, placeholderLabel)
        addTarget(self, action: #selector(handleEditing), for: .allEditingEvents)
        addDoneButtonOnKeyboard()
    }

    private func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(
            frame: CGRect.init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 50
            )
        )
        doneToolbar.barStyle = .default

        let flexSpace: UIBarButtonItem = .init(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let image: UIImage = Images.forward.withTintColor(
            .ttCyan,
            renderingMode: .alwaysOriginal
        )
        let done: UIBarButtonItem = .init(
            image: image,
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped)
        )
        doneToolbar.items = [flexSpace, done]
        inputAccessoryView = doneToolbar
    }

    @objc private func doneButtonTapped() {
        _ = delegate?.textFieldShouldReturn?(self)
    }

    @objc private func handleEditing() {
        updateBottomBorder()
        updatePlaceholderLabel()
    }

    private func configureBottomBorder() {
        bottomBorder.backgroundColor = .ttCyan
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 1),
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        bottomBorder.isUserInteractionEnabled = false
    }

    private func configurePlaceholderLabel() {
        placeholderLabel.textColor = .ttCyan
        placeholderLabel.isUserInteractionEnabled = false
    }

    private func updateBottomBorder() {
        UIView.animate(withDuration: interval) {
            self.bottomBorder.backgroundColor =
            self.isActive ? .white : .ttCyan
        }
    }

    private func updatePlaceholderLabel() {
        let offsetX = -placeholderLabel.bounds.width * (1 - scale) / 2
        let offsetY = -placeholderLabel.bounds.height * (1 - scale) / 2

        let transform = CGAffineTransform(
            translationX: offsetX,
            y: offsetY - ceil(fontLineHeight)
        ).scaledBy(x: scale, y: scale)
        UIView.animate(withDuration: interval) {
            self.placeholderLabel.transform = self.isActive ? transform : .identity
            self.placeholderLabel.textColor = self.isActive ? .white : .ttCyan
        }
    }
}

extension TTTextField {

    func addPasswordSecureButton() {
        let button: UIButton = .init()
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(
            self,
            action: #selector(passwordHideButtonTapped),
            for: .touchUpInside
        )
        button.tintColor = .white
        rightView = button
        setImageForPasswordSecureButton()
        rightViewMode = .whileEditing
    }

    @objc private func passwordHideButtonTapped() {
        isSecureTextEntry.toggle()
        setImageForPasswordSecureButton()
    }

    private func setImageForPasswordSecureButton() {
        (rightView as? UIButton)?.setImage(
            isSecureTextEntry ? Images.showPassword : Images.dontShowPassword,
            for: .normal
        )
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        CGRect(x: bounds.width - 5 - 28, y: bounds.height - 5 - 28, width: 28, height: 28)
    }
}
