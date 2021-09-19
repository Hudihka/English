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
    private let labelClear = UILabel.label(text: WordsEndpoint.Text.emptyWords.rawValue,
                                           font: EnumFont.bold(25),
                                           aligment: .center)
    private let segentTranslate = UISegmentedControl()
    private let switchTranslate = UISwitch()
    private let switchOnlyFavorit = UISwitch()

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

        switchTranslate.setingsSwitch(self, action: #selector(switchAction(_ :)))
        self.view.addSubview(switchTranslate)

        switchTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(segentTranslate.snp.bottom).offset(16)
            make.left.equalTo(segentTranslate.snp.left)
        }

        let hideTranslate = UILabel.label(text: WordsEndpoint.Text.hide.rawValue,
                                          font: EnumFont.semibold(20))
        self.view.addSubview(hideTranslate)
        hideTranslate.snp.makeConstraints({ (make) in
            make.height.equalTo(31)
            make.left.equalTo(switchTranslate.snp.right).offset(15)
            make.right.equalTo(-15)
            make.top.equalTo(segentTranslate.snp.bottom).offset(16)
        })



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
            make.top.equalTo(switchTranslate.snp.bottom).offset(11)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })

        table.deleteWord = {[weak self] word in
            guard let self = self else {return}

            self.showAlert(title: "Уверен", message: "Действительно хочешь далить?", style: .cancel, buttonText: "ДА") { _ in
                self.presenter?.delete(word: word)
            }
        }

    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
        presenter?.saveWay(index: sender.selectedSegmentIndex)
        table.wordsTable(wordsArray: nil, duration: 0.25, scroll: true)
    }

    @objc private func switchAction(_ sender: UISwitch) {
        presenter?.saveSwitch(isOn: sender.isOn)
        table.wordsTable(wordsArray: nil, duration: 0.25)
    }

    @objc override func rightBBItem(){
        self.presenter?.changeWord(word: nil)
    }

}


extension WordsViewController: WordViewControllerProtocol {
    func fetchTitle(text: String){
        self.title = text
        if text == FAVORIT_NAME {
            table.isFavoritList = true
            navigationItem.rightBarButtonItem = nil
        }
    }

    func fetchSegmentControll(index: Int){
        segentTranslate.selectedSegmentIndex = index
    }

    func fetchSwitch(isOn: Bool){
        switchTranslate.isOn = isOn
    }


    func words(words: [Word]) {
        labelClear.isHidden = !words.isEmpty
        table.wordsTable(wordsArray: words, duration: 0, scroll: false)
    }
}
