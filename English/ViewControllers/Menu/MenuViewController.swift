//
//  MenuViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

protocol MenuViewControllerProtocol: AnyObject {
    func showErrorNewList()
    func reloadData()
}

class MenuViewController: BaseViewController {
    
    private var tableView: MenuTableView!
    
    var presenter: MenuPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var titleText: String?{
        return MenuEndpointsEnum.ViewText.title.rawValue
    }
    
    override var rightTextBBItem: String?{
        return MenuEndpointsEnum.ViewText.rightBB.rawValue
    }
    
    @objc override func rightBBItem(){
        showAlertTextField(title: MenuEndpointsEnum.AlertTF.title.rawValue,
                           message: nil,
                           actionTitle: MenuEndpointsEnum.AlertTF.actionTitle.rawValue,
                           cancelTitle: MenuEndpointsEnum.AlertTF.cancelTitle.rawValue,
                           inputPlaceholder: MenuEndpointsEnum.AlertTF.theme.rawValue) {[weak self] str in
            guard let self = self, let str = str else {
                return
            }

            self.presenter?.createList(name: str)
        }
    }
    
    override func desingUI() {
        tableView = MenuTableView(presenter: presenter)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }

        tableView.tapedCell = {[weak self] list, name in

			self?.showAlertThreeButton(title: MenuEndpointsEnum.ActionButtonsAlert.title.rawValue,
                                      message: nil,
                                      buttonText1: MenuEndpointsEnum.ActionButtonsAlert.rusEngl.rawValue,
                                      action1: { _ in
										self?.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.rusEngl, list: list)
                                      },
                                      buttonText2: MenuEndpointsEnum.ActionButtonsAlert.englRus.rawValue,
                                      action2: { _ in
										self?.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.englRus, list: list)
                                      },
                                      buttonText3: MenuEndpointsEnum.ActionButtonsAlert.cramming.rawValue) { _ in
										self?.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.cramming, list: list)
            }
        }

        tableView.tapedRename = {[weak self] theme in
            guard let self = self else {
                return
            }

            self.showAlertTextField(title: MenuEndpointsEnum.AlertTF.title.rawValue,
                                    message: nil,
                                    actionTitle: MenuEndpointsEnum.AlertTF.actionTitle.rawValue,
                                    cancelTitle: MenuEndpointsEnum.AlertTF.cancelTitle.rawValue,
                                    inputStartText: theme) {[weak self] str in
                guard let self = self, let str = str else {
                    return
                }

                self.presenter?.renameList(oldName: theme, newName: str)
            }
        }
    }

}


extension MenuViewController: MenuViewControllerProtocol {

    func showErrorNewList() {
        showAlert(title: MenuEndpointsEnum.AlertError.title.rawValue,
                  message: MenuEndpointsEnum.AlertError.description.rawValue)
    }

    func reloadData(){
        self.tableView.reloadData()
    }

}
