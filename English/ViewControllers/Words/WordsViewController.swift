//
//  WordsViewController.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import UIKit

class WordsViewController: BaseViewController {
    var VM: (WordsProtocolIn & WordsProtocolOut)?

	private var table = WordsTableView()
    
    private let hideTranslateLabel: UILabel = {
        let hideTranslate = UILabel()
        hideTranslate.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        hideTranslate.textColor = UIColor.black
        hideTranslate.text = WordsEndpoint.ViewText.hideTranslate.rawValue
        
        return hideTranslate
    }()
    
    private let labelEmpty: UILabel = {
        let labelClear = UILabel()
        labelClear.textColor = UIColor.black
        labelClear.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        labelClear.textAlignment = .center
        labelClear.text = WordsEndpoint.ViewText.empty.rawValue
        
        return labelClear
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

        VM?.giveMeData()
    }
    

    override func desingUI() {
        
        self.title = WordsEndpoint.ViewText.title.rawValue

        view.addSubview(segentTranslate)
        segentTranslate.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(Offsets.value16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Offsets.value16)
            make.height.equalTo(40)
        }

        view.addSubview(switchTranslate)
        switchTranslate.snp.makeConstraints { (make) in
            make.top.equalTo(segentTranslate.snp.bottom).offset(Offsets.value16)
            make.left.equalTo(segentTranslate.snp.left)
        }

        view.addSubview(hideTranslateLabel)
        hideTranslateLabel.snp.makeConstraints({ (make) in
            make.height.equalTo(31)
            make.left.equalTo(switchTranslate.snp.right).offset(Offsets.value16)
            make.right.equalTo(-Offsets.value16)
            make.top.equalTo(segentTranslate.snp.bottom).offset(Offsets.value16)
        })

        view.addSubview(labelEmpty)
        labelEmpty.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
        })

        
        view.addSubview(table)
        table.snp.makeConstraints({ (make) in
            make.top.equalTo(switchTranslate.snp.bottom).offset(Offsets.value16)
            make.left.right.bottom.equalToSuperview()
        })
    }
    
    override func lissenVM() {
        guard var VM = VM else {
            return
        }
        
        VM.arrayLists = { [weak self] arrayLists in
            guard let self = self else {
                return
            }
            self.labelEmpty.isHidden = !arrayLists.isEmpty
            self.table.wordsTable(listArray: arrayLists, duration: 0.25)
        }
        
        VM.segmentIndex = { [weak self] index in
            self?.segentTranslate.selectedSegmentIndex = index
        }
        
        VM.switchValue = { [weak self] value in
            self?.switchTranslate.isOn = value
        }
        
        table.tapWord = { [weak self] value in
            guard let VM = self?.VM else {
                return
            }
            VM.tapedFavorit(word: value)
        }
    }

    @objc private func actionSegment(_ sender: UISegmentedControl) {
        let segment = sender.selectedSegmentIndex
        VM?.tapedSegment(segment: WordsEndpoint.Segment(index: segment))
    }

    @objc private func switchAction(_ sender: UISwitch) {
        VM?.tapedSwitch(value: sender.isOn)
    }
}
