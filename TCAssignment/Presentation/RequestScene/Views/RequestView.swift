//
//  RequestView.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 01/09/21.
//

import UIKit

class RequestView: UIView, UITextViewDelegate {
    //MARK: Properties
    lazy var requestTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Please Press Request Button......"
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.darkGray
        textView.textColor = UIColor.white
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var requestButton: UIButton = {
        let requestButton = UIButton()
        requestButton.setTitle("Request", for: .normal)
        requestButton.backgroundColor = UIColor.gray
        requestButton.setTitleColor(UIColor.white, for: .normal)
        requestButton.layer.cornerRadius = 10
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        return requestButton
    }()
    
    //MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    //MARK: SetUp
    func setupViews() {
        addSubview(requestTextView)
        addSubview(requestButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            requestTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            requestTextView.topAnchor.constraint(equalTo: self.topAnchor),
            requestTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            requestButton.leadingAnchor.constraint(equalTo: requestTextView.leadingAnchor),
            requestButton.topAnchor.constraint(equalTo: requestTextView.bottomAnchor, constant: 15),
            requestButton.trailingAnchor.constraint(equalTo: requestTextView.trailingAnchor),
            requestButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    //MARK: Observers
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            let isOversize = Int(requestTextView.contentSize.height) >= Int(self.frame.size.height * 0.80)
            UIView.animate(withDuration: 0.4) {
                self.requestTextView.heightAnchor.constraint(equalToConstant: self.frame.size.height * 0.80).isActive = isOversize
                self.requestTextView.isScrollEnabled = isOversize
                self.layoutIfNeeded()
            }
        }
    }


}
