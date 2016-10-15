//
//  FirstViewController.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit
import MJRefresh
import PKHUD
class IndexViewController: UIViewController {
    
    var dataArray = [Device]()
    var page = 1
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //设置刷新
        let header = MJRefreshNormalHeader(refreshingBlock: {
            self.tableView.mj_header.beginRefreshing()
            self.loadList(loadMore: false)
            self.tableView.mj_header.endRefreshing()
        })
        header?.stateLabel.text = "刷新设备状态"
        header?.stateLabel.textColor = UIColor.darkGray
        //header?.lastUpdatedTimeLabel.textColor = UIColor.darkGray
        //TODO: 箭头颜色
        self.tableView.mj_header = header
        
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.tableView.mj_footer.beginRefreshing()
            self.loadList(loadMore: true)
            self.tableView.mj_footer.endRefreshing()
        })
        footer?.stateLabel.text = "加载更多设备"
        footer?.stateLabel.textColor = UIColor.darkGray
        tableView.mj_footer = footer
        tableView.mj_footer.isHidden = dataArray.count == 0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loadList(loadMore: false)
    }
    /**
     获取数据方法
     
     - parameter name:     菜名
     - parameter loadMore: 是否加载更多
     */
    func loadList(loadMore:Bool = true){
        //TODO -:一次获取详细数据
        
        //如果是刷新
        if !loadMore {
            page = 1
            self.dataArray.removeAll()
            tableView.reloadData()
        }
        ServiceProxy.loadObjectList(token: "", page: page) { (result,error) in
            
            guard error == nil else{
                self.page = 1
                HUD.flash(.labeledError(title: "连接出错", subtitle: nil),delay: 1)
                self.dataArray.removeAll()
                return
            }
            if result.count == 0{
                HUD.flash(.labeledError(title: "没有更多信息", subtitle: nil),delay: 1)
            }else{
                self.page += 1
                HUD.flash(.success,delay: 0.3)
            }
            self.dataArray.append(contentsOf: result)
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! ObjectDetailViewController).lightOn = (dataArray[(tableView.indexPathForSelectedRow?.row)!].state == .on)
    }

}

