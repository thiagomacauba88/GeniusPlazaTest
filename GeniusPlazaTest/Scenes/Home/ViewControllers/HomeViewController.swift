//
//  ViewController.swift
//  GeniusPlazaTest
//
//  Created by Thiago on 07/03/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    // MARK: - Properties
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    var count = 10
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
            self.tableView.isHidden = true
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicList(count: self.count.description)
        self.setNavigationTitle(text: "List")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - IBActions
    @IBAction func filterButtonTapped(_ sender: Any) {
        self.showActionSheet()
    }
    
    // MARK: - MISC
    func showActionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.view.tintColor = UIColor.black
        let list = ["Show 10", "Show 25", "Show 50", "Show 100"]
        for item in list {
            alert.addAction(UIAlertAction(title: item, style: .default , handler:{ (UIAlertAction) in
                switch item {
                case "Show 10":
                    self.count = 10
                case "Show 25":
                    self.count = 25
                case "Show 50":
                    self.count = 50
                case "Show 100":
                    self.count = 100
                default:
                    return
                }
                self.musicList(count: self.count.description)
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel , handler:{ (UIAlertAction)in
            
        }))
        self.showRange(alert: alert)
    }
    
    func showRange(alert: UIAlertController?) {
        if let alertRes = alert {
            self.present(alertRes, animated: true, completion: nil)
        }
    }
}

// MARK:- TableView Delegates, DataSource
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.homeResponse?.feed?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? HomeTableViewCell {
            if let result = self.viewModel.homeResponse?.feed?.results {
                cell.setup(resultResponse: result[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
    }
}


// MARK: - Service
extension HomeViewController {
    func musicList(count: String) {
        self.view.startLoading()
        self.viewModel.musicList(count: count)
            .observeOn(MainScheduler.instance).subscribe(onNext: { (musicList) in
                if let _ = musicList {
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    self.titleLabel.text = "List - "+self.count.description
                }
            }, onError: { (error) in
            }, onCompleted: {
            }, onDisposed: {
                self.view.stopLoading()
            }).disposed(by: disposeBag)
    }
}

// MARK: - Instantiation
extension HomeViewController {
    static func instantiate(fromStoryboard storyboard: UIStoryboard) -> HomeViewController {
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }
}
