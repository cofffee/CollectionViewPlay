//
//  ViewController.swift
//  MessagePlay
//
//  Created by Kevin Remigio on 9/22/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView! = nil
    
    var tText:UITextField! = nil
    var lText:UITextField! = nil
    var bText:UITextField! = nil
    var rText:UITextField! = nil
    
    var widthText:UITextField! = nil
    var heightText:UITextField! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(colorLiteralRed: cF(x: 221.0), green: cF(x: 69.0), blue: cF(x: 51.0), alpha: 1.0)
    
        let frame = view.frame
        tableView = UITableView(frame: CGRect(x: 0, y: 200, width: frame.size.width, height: frame.size.height - 200))
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        tableView.tableFooterView = UIView()
        
        setTextView()
    }
    
    func setTextView() {
        
        let leftOffset:CGFloat = 8
        let rightOffset:CGFloat = 8
        let midSpace:CGFloat = 8
        
        let height:CGFloat = 20
        let width:CGFloat = ( view.frame.width - (leftOffset + rightOffset + (midSpace * 3) ) ) / 4
        let y:CGFloat = 84
        
        let x1:CGFloat = leftOffset
        let x2:CGFloat = x1 + width + midSpace
        let x3:CGFloat = x2 + width + midSpace
        let x4:CGFloat = x3 + width + midSpace
        
        let tFrame: CGRect = CGRect(x: x1, y: y, width: width, height: height)
        let lFrame: CGRect = CGRect(x: x2, y: y, width: width, height: height)
        let bFrame: CGRect = CGRect(x: x3, y: y, width: width, height: height)
        let rFrame: CGRect = CGRect(x: x4, y: y, width: width, height: height)
        
        let widthFrame:CGRect = CGRect(x: x1, y: y + 40, width: width, height: height)
        let heightFrame: CGRect = CGRect(x: x2, y: y + 40, width: width, height: height)
        
        tText = UITextField(frame: tFrame)
        lText = UITextField(frame: lFrame)
        bText = UITextField(frame: bFrame)
        rText = UITextField(frame: rFrame)
        
        widthText = UITextField(frame: widthFrame)
        heightText = UITextField(frame: heightFrame)
        
        tText.borderStyle = .roundedRect
        lText.borderStyle = .roundedRect
        bText.borderStyle = .roundedRect
        rText.borderStyle = .roundedRect
        
        widthText.borderStyle = .roundedRect
        heightText.borderStyle = .roundedRect
        
        tText.layer.borderColor = UIColor.black.cgColor
        lText.layer.borderColor = UIColor.black.cgColor
        bText.layer.borderColor = UIColor.black.cgColor
        rText.layer.borderColor = UIColor.black.cgColor
        
        widthText.layer.borderColor = UIColor.black.cgColor
        heightText.layer.borderColor = UIColor.black.cgColor
        
        tText.placeholder = "Top"
        lText.placeholder = "Left"
        bText.placeholder = "Bottom"
        rText.placeholder = "Right"
        
        widthText.placeholder = "width"
        heightText.placeholder = "height"
        
        view.addSubview(tText)
        view.addSubview(lText)
        view.addSubview(bText)
        view.addSubview(rText)
        
        view.addSubview(widthText)
        view.addSubview(heightText)
    }
    func cF(x: Float) -> Float {
        return Float(x/255)
    }

}
extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 30
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(NSDate())"
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 16)
        cell.backgroundColor = UIColor.init(colorLiteralRed: 37/255, green: 57/255, blue: 107/255, alpha: 1.0)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let t:CGFloat = stringToFloat(str: tText!.text!)
        let l:CGFloat = stringToFloat(str: lText!.text!)
        let b:CGFloat = stringToFloat(str: bText!.text!)
        let r:CGFloat = stringToFloat(str: rText!.text!)
        
        let width = stringToFloat(str: widthText!.text!)
        let height = stringToFloat(str: heightText!.text!)
        
        let chatView = ChatViewController()
        chatView.varLayout = UIEdgeInsets(top: t, left: l, bottom: b, right: r)
        chatView.varItemSize = CGSize(width: width, height: height)
        
        self.navigationController?.pushViewController(chatView, animated: true)

    }
    func stringToFloat(str: String) -> CGFloat {
        var t: CGFloat = 0.0
        if let n = NumberFormatter().number(from: str) {
            t = CGFloat(n)
        }
        return t
    }
}


