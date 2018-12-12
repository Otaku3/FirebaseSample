//
//  ViewController.swift
//  FirebaseSample
//
//  Created by 大林拓実 on 2018/12/12.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    //入力フィールド
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var displayData: UILabel!
    
    //インスタンス変数
    var DBRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //インスタンスを作成
        DBRef = Database.database().reference()
    }
    
    @IBAction func add(_ sender: AnyObject){
        let data = ["name": TextField.text!]
        DBRef.child("user/01").setValue(data)
        
        let defaultPlace = DBRef.child("user/01/name")
        defaultPlace.observe(.value){ (snap: DataSnapshot) in self.displayData.text = (snap.value! as AnyObject).description}
    }
    
    


}

