//
//  PeopleWidgetViewController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit
import SnapKit

protocol PeopleWidgetDisplayLogic: AnyObject {
    func displayPeople(param: String)
}

final class PeopleWidgetViewController: UIViewController {
    let interactor: PeopleWidgetBusinessLogic
    let box = UIView()
    
    init(
        interactor: PeopleWidgetBusinessLogic
    ) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(box)
        
        box.backgroundColor = .blue
        
        box.snp.makeConstraints { (make) -> Void in
            make.height.width.equalTo(50)
            make.top.centerX.equalToSuperview().offset(50)
        }
        interactor.fechPeople()
    }
}

extension PeopleWidgetViewController: PeopleWidgetDisplayLogic {
    func displayPeople(param: String) {
        print("OK: \(param)")
    }
}
