//
//  ViewController.swift
//  ZLTableViewTest
//
//  Created by Lee on 1/14/15.
//  Copyright (c) 2015 My Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataArray: NSMutableArray = NSMutableArray()
    var testTableView: UITableView? //Optional type，这个testTableView是none或者是UITableView

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataArray.addObject("data1")
        dataArray.addObject("data2")
        dataArray.addObject("data3")
        dataArray.addObject("data4")
        dataArray.addObject("data5")
        dataArray.addObject("data6")
        
        self.testTableView = UITableView(frame: self.view.bounds)//MD够简洁~
        /*调用方法、属性、下标索引等前面需要加上一个?，如果是nil值，也就是Optional.None，会跳过后面的操作不执行，如果有值，就是Optional.Some，可能就会拆包(unwrap)，然后对拆包后的值执行后面的操作，来保证执行这个操作的安全性*/
        self.testTableView?.delegate = self
        self.testTableView?.dataSource = self
        self.testTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.testTableView!) // !用作unwrap拆包操作
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*想用pragma mark发现木有 -> Just talked to an Engineer here at WWDC, and the current beta of Xcode doesn't implement the // MARK: style yet, but I'm told future versions will.*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count //这里可用self.语法get到初始化的dataArray数组
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell //as是类型转换，可理解为把什么当成什么的意思，这里Swift的用法和OC中的UICollectionView相似，初始化时调用registerClass
        cell.textLabel?.text = String(format: "%d", indexPath.row)
        cell.contentView.backgroundColor = UIColor.blueColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("fuck the table view index row: \(indexPath.row+1)")
        var alertView: UIAlertView
        alertView = UIAlertView(title: "Got index", message: String(format: "Row: %d", indexPath.row+1), delegate: nil, cancelButtonTitle: "Back")
        alertView.show()
    }
}

