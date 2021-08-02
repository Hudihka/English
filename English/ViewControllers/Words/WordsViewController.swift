//
//  WordsViewController.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import UIKit

protocol WordViewControllerProtocol: AnyObject {
    func fetchTitle(text: String)
    func fetchSegmentControll(index: Int)
    func fetchSwitch(isOn: Bool)

    func words(words: [Word])
}

class WordsViewController: BaseViewController {
    var presenter: WordsPresenterProtocol?

	private var table: WordsTableView!
    fileprivate let labelClear = UILabel()
    fileprivate let segentTranslate = UISegmentedControl()
    fileprivate let switchTranslate = UISwitch()

    override var rightTextBBItem: String?{
        return WordsEndpoint.ViewText.rightBB.rawValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.fetchData()
    }
    

    override func desingUI() {

        segentTranslate.backgroundColor = .white
        segentTranslate.tintColor = UIColor.yellow
        segentTranslate.selectedSegmentTintColor = UIColor.black

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segentTranslate.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segentTranslate.setTitleTextAttributes(titleTextAttributes1, for:.selected)

        segentTranslate.insertSegment(withTitle: WordsEndpoint.Text.rus.rawValue, at: 0, animated: true)
        segentTranslate.insertSegment(withTitle: WordsEndpoint.Text.engl.rawValue, at: 1, animated: true)
        segentTranslate.addTarget(self, action: #selector(actionSegment(_ :)), for: .valueChanged)

        self.view.addSubview(segentTranslate)


        segentTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(40)
        }

        switchTranslate.onTintColor = UIColor.black
        switchTranslate.tintColor = grayColor
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

        labelClear.textColor = UIColor.black
        labelClear.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        labelClear.textAlignment = .center
        labelClear.text = WordsEndpoint.Text.emptyWords.rawValue
        self.view.addSubview(labelClear)

        labelClear.snp.makeConstraints({ (make) in
            make.height.equalTo(44)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(273)
        })

		table = WordsTableView(presenter: presenter)
        self.view.addSubview(table)

        table.snp.makeConstraints({ (make) in
            make.top.equalTo(switchTranslate.snp.bottom).offset(16)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })

    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
        presenter?.saveWay(index: sender.selectedSegmentIndex)
        table.wordsTable(wordsArray: nil, duration: 0.25, scroll: true)
    }

    @objc private func switchAction(_ sender: UISwitch) {
        presenter?.saveSwitch(isOn: sender.isOn)
        table.wordsTable(wordsArray: nil, duration: 0.25)
    }

}


extension WordsViewController: WordViewControllerProtocol {
    func fetchTitle(text: String){
        self.title = text
    }

    func fetchSegmentControll(index: Int){
        segentTranslate.selectedSegmentIndex = index
    }

    func fetchSwitch(isOn: Bool){
        switchTranslate.isOn = isOn
    }


    func words(words: [Word]) {
        table.wordsTable(wordsArray: words, duration: 0, scroll: false)
    }
}
