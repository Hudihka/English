//
//  SearchViewController.swift
//  English
//
//  Created by Константин Ирошников on 11.08.2021.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    func showWords(words: [Word], text: String?)
}

class SearchViewController: BaseViewController {

    var presenter: SearchPresenterProtocol?

    private var table: SearchTableView!
    fileprivate let seartchView = UISearchBar()
    fileprivate let labelClear = UILabel()
    fileprivate let segentTranslate = UISegmentedControl()

    fileprivate var timer: Timer?

    private var gester: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func desingUI() {

        segentTranslate.backgroundColor = .white
        segentTranslate.tintColor = UIColor.yellow
        segentTranslate.selectedSegmentTintColor = UIColor.black

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segentTranslate.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segentTranslate.setTitleTextAttributes(titleTextAttributes1, for:.selected)

        segentTranslate.insertSegment(withTitle: SearchEndpoints.Text.rus.rawValue, at: 0, animated: true)
        segentTranslate.insertSegment(withTitle: SearchEndpoints.Text.engl.rawValue, at: 1, animated: true)
        segentTranslate.addTarget(self, action: #selector(actionSegment(_ :)), for: .valueChanged)

        self.view.addSubview(segentTranslate)

        segentTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(40)
        }

        labelClear.textColor = UIColor.black
        labelClear.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        labelClear.textAlignment = .center
        labelClear.text = SearchEndpoints.Text.emptyWords.rawValue
        labelClear.isHidden = true
        self.view.addSubview(labelClear)

        labelClear.snp.makeConstraints({ (make) in
            make.height.equalTo(44)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(273)
        })

        table = SearchTableView(presenter: presenter)
        self.view.addSubview(table)

        table.snp.makeConstraints({ (make) in
            make.top.equalTo(segentTranslate.snp.bottom).offset(11)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })

        gester = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.view.addGestureRecognizer(gester!)
        gester?.isEnabled = false

        navigationItem.titleView = seartchView
        seartchView.delegate = self

        for view : UIView in seartchView.subviews {
            if let textField = view as? UITextField {
                textField.placeholder = SearchEndpoints.Text.search.rawValue
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = .search
                textField.autocapitalizationType = .none
            }
        }


    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
        seartchView.resignFirstResponder()
        seartchView.text = nil

        labelClear.isHidden = true

        presenter?.saveWay(index: sender.selectedSegmentIndex)
        table.wordsTable(wordsArray: nil, duration: 0.25, scroll: true)
    }

    @objc override func adjustForKeydoard(notification: Notification) {
        if notification.name == UIApplication.keyboardWillShowNotification {
            gester?.isEnabled = true
        } else if notification.name == UIApplication.keyboardWillHideNotification {
            gester?.isEnabled = false
        }
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {[weak self] (_) in
            guard let self = self else { return }
            self.presenter?.seartchWords(text: self.seartchView.text)
        })
    }


    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        seartchView.resignFirstResponder()
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    func showWords(words: [Word], text: String?) {
        if text == seartchView.text {
            table.words = words

            if words.isEmpty, text != nil {
                labelClear.isHidden = false
            } else {
                labelClear.isHidden = true
            }

        }
    }
}
