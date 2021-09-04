//
//  ViewController.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 01/09/21.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: Properties
    lazy var requestView: RequestView = {
        let requestView = RequestView()
        requestView.requestButton.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
        requestView.translatesAutoresizingMaskIntoConstraints = false
        return requestView
    }()
    let requestViewModel = RequestViewModel(requestRepo: TenthCharRequestRepository(), everyTenthCharRepo: EveryTenthRepository(), wordCountRepo: WordCountRepositor())
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    
    //MARK: UISETUP
    func setupUI() {
        view.backgroundColor = UIColor.black
        view.addSubview(requestView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            requestView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            requestView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            requestView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            requestView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    //MARK: ViewModel Setup
    func setupViewModel() {
        requestViewModel.tenthCharacter.bind { [weak self] (character) in
            DispatchQueue.main.async {
                self?.requestView.requestTextView.text = "\(self?.requestView.requestTextView.text ?? "")\n\n\(character)"
            }
        }
        requestViewModel.everyTenthCharacter.bind { [weak self] (result) in
            DispatchQueue.main.async {
                self?.requestView.requestTextView.text = "\(self?.requestView.requestTextView.text ?? "")\n\n\(result)"
            }
        }
        requestViewModel.wordCount.bind { [weak self] (wordcount) in
            DispatchQueue.main.async {
                self?.requestView.requestTextView.text = "\(self?.requestView.requestTextView.text ?? "")\n\n\(wordcount)"
            }
        }
    }
    
    //MARK: Fetch Requests
    func fetchTenthCharacter() {
        requestViewModel.fetchTenthCharacter()
        requestViewModel.fetchEveryTenthCharacter()
        requestViewModel.fetchWordCount()
    }
    //MARK: Actions
    @objc func requestButtonTapped() {
        fetchTenthCharacter()
    }
}


