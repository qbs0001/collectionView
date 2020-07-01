//
//  InputViewController.swift
//  collectionView
//
//  Created by 0001 QBS on 2020/06/26.
//  Copyright © 2020 qbs0001. All rights reserved.
//

import UIKit

class InputViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let dataList = ["赤","緑","青"]
    //var initColor :Int!
    var selectColor :Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //self.pickerView.selectRow(initColor, inComponent: 0, animated: true)

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dataList[row])
        
                let mainVC = self.presentingViewController as! ViewController
        
                //mainVC.segueCell?.backgroundColor = .black
       
        switch dataList[row] {
        case "赤":
            //inputViewController.initColor = 0
            mainVC.segueCell?.backgroundColor = .red
            self.view.backgroundColor = .red
            
        case "緑":
            mainVC.segueCell?.backgroundColor = .green
            self.view.backgroundColor = .green
            
        case "青":
            mainVC.segueCell?.backgroundColor = .blue
            self.view.backgroundColor = .blue
            
        default: break
        }
        
    }
    
    
    
    @IBAction func okBack(_ sender: Any) {
        
        print("OKボタンが押されました")
        

        
        

        
        
    }
    
    
    
//    @IBAction func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
//        let mainVC = self.presentingViewController as! ViewController
//
//        mainVC.segueCell?.backgroundColor = .black
//    }
    
//    @IBAction func okBack(_ sender: Any) {
//
//        let mainVC = self.presentingViewController as! ViewController
//
//        mainVC.segueCell?.backgroundColor = .black
//
//        self.dismiss(animated: true, completion: .none)
//
//
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
