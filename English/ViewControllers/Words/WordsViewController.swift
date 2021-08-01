//
//  WordsViewController.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import UIKit

protocol WordViewControllerProtocol: AnyObject {

}

class WordsViewController: BaseViewController {
    var presenter: WordsPresenterProtocol?

    private var labelClear: UILabel!
    private var seartchView: UISearchBar!
    private var switchTranslate: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func desingUI() {

        let segentTranslate = UISegmentedControl()
        segentTranslate.selectedSegmentTintColor = UIColor.white
        segentTranslate.insertSegment(withTitle: WordsEndpoint.Text.rus.rawValue, at: 0, animated: true)
        segentTranslate.insertSegment(withTitle: WordsEndpoint.Text.engl.rawValue, at: 1, animated: true)
//        segentTranslate.selectedSegmentIndex = presenter.rusTranslate
        segentTranslate.addTarget(self, action: #selector(actionSegment(_ :)), for: .valueChanged)

        self.view.addSubview(segentTranslate)

        segentTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(40)
        }

        switchTranslate = UISwitch()
        switchTranslate.onTintColor = UIColor.black
//        switchTranslate.isOn = presenter.hideTranslate
        switchTranslate.addTarget(self, action: #selector(switchAction(_ :)), for: .touchUpInside)
        self.view.addSubview(switchTranslate)

        switchTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(segentTranslate.snp.bottom).offset(16)
            make.left.equalTo(segentTranslate.snp.left)
        }

        let hideTranslate = UILabel()
        hideTranslate.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        hideTranslate.textColor = UIColor.black
        hideTranslate.text = WordsEndpoint.Text.hide.rawValue
        self.view.addSubview(hideTranslate)
        hideTranslate.snp.makeConstraints({ (make) in
            make.height.equalTo(31)
            make.left.equalTo(switchTranslate.snp.right).offset(15)
            make.right.equalTo(-15)
            make.top.equalTo(segentTranslate.snp.bottom).offset(16)
        })

        labelClear = UILabel()
        labelClear.textColor = UIColor.black
        labelClear.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        labelClear.textAlignment = .center
        labelClear.text = WordsEndpoint.Text.emptyWords.rawValue
        labelClear.isHidden = true
        self.view.addSubview(labelClear)

        labelClear.snp.makeConstraints({ (make) in
            make.height.equalTo(44)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(273)
        })

//        table = UITableView()
//        self.view.addSubview(table)

//        table.snp.makeConstraints({ (make) in
//            make.top.equalTo(switchTranslate.snp.bottom).offset(16)
//            make.left.equalTo(0)
//            make.right.equalTo(0)
//            make.bottom.equalTo(0)
//        })

    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
//        presenter.selectedRussia(rusValue: sender.selectedSegmentIndex)
    }

    @objc private func switchAction(_ sender: UISwitch) {
//        presenter.hideSwitch(hide: sender.isOn)
//        animateReloadData(duration: 0.25)
    }

}


extension WordsViewController: WordViewControllerProtocol {

}
