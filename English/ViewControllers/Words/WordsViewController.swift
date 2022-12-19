//
//  WordsViewController.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import UIKit

class WordsViewController: BaseViewController {
    private var arrayLists: [List] = []
    
    var VM: (WordsProtocolIn & WordsProtocolOut)?

	private var table: WordsTableView!
    
    private let hideTranslateLabel: UILabel = {
        let hideTranslate = UILabel()
        hideTranslate.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        hideTranslate.textColor = UIColor.black
        hideTranslate.text = WordsEndpoint.hideTranslate.hide.rawValue
        
        return hideTranslate
    }()
    
    private lazy var segentTranslate: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.backgroundColor = .white
        segment.tintColor = UIColor.yellow
        segment.selectedSegmentTintColor = UIColor.black

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segment.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1, for:.selected)

        segment.insertSegment(withTitle: WordsEndpoint.Segment.all.rawValue, at: 0, animated: true)
        segment.insertSegment(withTitle: WordsEndpoint.Segment.onlyFavorit.rawValue, at: 1, animated: true)
        segment.addTarget(self, action: #selector(actionSegment(_ :)), for: .valueChanged)
        
        return segment
    }()
    
    private lazy var switchTranslate: UISwitch = {
        let swit = UISwitch()
        swit.onTintColor = UIColor.black
        swit.tintColor = grayColor
        swit.addTarget(self, action: #selector(switchAction(_ :)), for: .touchUpInside)
        
        return swit
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.fetchData()
    }
    

    override func desingUI() {
        
        self.title = WordsEndpoint.ViewText.title.rawValue

        self.view.addSubview(segentTranslate)

        segentTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(40)
        }

        view.addSubview(switchTranslate)
        switchTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(segentTranslate.snp.bottom).offset(16)
            make.left.equalTo(segentTranslate.snp.left)
        }

        self.view.addSubview(hideTranslateLabel)
        hideTranslateLabel.snp.makeConstraints({ (make) in
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
            make.top.equalTo(switchTranslate.snp.bottom).offset(11)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })
        
    }
    
    override func lissenVM() {
        guard var VM = VM else {
            return
        }
        
        VM.arrayAllLists = { [weak self] arrayLists in
            self?.arrayLists = arrayLists
        }
        
        VM.arrayFavoritLists = { [weak self] arrayLists in
            self?.arrayLists = arrayLists
        }
        
        VM.segmentIndex = { [weak self] index in
            self?.segentTranslate.selectedSegmentIndex = index
        }
        
        VM.switchValue = { [weak self] value in
            self?.switchTranslate.isOn = value
        }
    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
        let segment = 
        VM?.tapedSegment(segment: sender.selectedSegmentIndex)
//        table.wordsTable(wordsArray: nil, duration: 0.25, scroll: true)
    }

    @objc private func switchAction(_ sender: UISwitch) {
        VM?.tapedSwitch(value: sender.isOn)
//        table.wordsTable(wordsArray: nil, duration: 0.25)
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
