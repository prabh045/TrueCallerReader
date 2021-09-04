//
//  RequestView.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 01/09/21.
//

import UIKit

class RequestView: UIView, UITextViewDelegate {
    
    lazy var requestTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        textView.backgroundColor = UIColor.black
        textView.textColor = UIColor.white
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        addSubview(requestTextView)
        addSubview(requestButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            requestTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            requestTextView.topAnchor.constraint(equalTo: self.topAnchor),
            requestTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            requestButton.leadingAnchor.constraint(equalTo: requestTextView.leadingAnchor),
            requestButton.topAnchor.constraint(equalTo: requestTextView.bottomAnchor),
            requestButton.trailingAnchor.constraint(equalTo: requestTextView.trailingAnchor),
            requestButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            let isOversize = requestTextView.contentSize.height >= self.frame.size.height * 0.80
            UIView.animate(withDuration: 0.4) {
                self.requestTextView.heightAnchor.constraint(equalToConstant: self.frame.size.height * 0.80).isActive = isOversize
                self.requestTextView.isScrollEnabled = isOversize
            }
        }
    }


}
