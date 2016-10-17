//
//  ViewController.swift
//  S10_10.veDenLed
//
//  Created by admin on 10/10/16.
//  Copyright © 2016 tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var thanhvien = ["ong", "ba", "bo", "me", "anh"]
    
    var lastOnLed = -1
    /* biến được truy vấn ở các hàm. muốn tắt bật đèn cần index của nó
    */
    
    var n = 5;
    
    var _margin:CGFloat = 40 // khoảng cách
    
    var chayLed:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRowOfBall()
        
        /* NSTimer: đối tượng này được gọi đi gọi lại, liên tục với 1 khoảng thời gian cố định
        
         let timer = NSTimer.scheduledTimerWithTimeInterval(<#T##ti: NSTimeInterval##NSTimeInterval#>, target: <#T##AnyObject#>, selector: <#T##Selector#>, userInfo: <#T##AnyObject?#>, repeats: <#T##Bool#>)
         */
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        
    }
    
    func runningLed() {
        
        if (chayLed == false) { // Chạy tiến
        
            if (lastOnLed != -1) {
            
                turnOffLed()
            }
            if (lastOnLed != n - 1) {
            
            lastOnLed = lastOnLed + 1
            
            } else {
            
                chayLed = true
            }
            
            turnOnLed()
        }
        
        if (chayLed == true) { // Chạy lùi
            
            if (lastOnLed == n - 1) {
                
                turnOffLed()
            }
            if (lastOnLed != n - 1) {
                
                turnOffLed()
            }
            if (lastOnLed != -1) {
                
                lastOnLed = lastOnLed - 1
                
            } else {
                
                chayLed = false
                
            }
            
            turnOnLed()
        }
    
    }
    
    func turnOnLed() {
        
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            
            as? UIImageView {
            
            ball.image = UIImage(named: "green")
        }
        
    }
    func turnOffLed() {
        
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            
            as? UIImageView { // xác định chắc chắn có phải là kiểu UiImageview không?
            
            ball.image = UIImage(named: "grey")
        }
    
    }
    
    func drawRowOfBall() {
        
        for indexHang in 0..<n {
            
            for indexCot in 0..<n {
                
                print(index)
                
                let image = UIImage(named: "green") // Khởi tạo 1 cái ảnh
                
                let ball = UIImageView(image: image) // có ảnh truyển vào UIImageview
                
                // xét tọa độ để hiện thị X,Y hiện thỉ quả bóng
                ball.center = CGPointMake(_margin + CGFloat(indexHang)*spaceBetweenBall(),CGFloat(indexCot) * 50 + _margin)
                
                // Đặt tag cho Ball
                
                ball.tag = indexHang + 100
                
                // Add vào view
                self.view.addSubview(ball)
            }
        }
    
    }
    func spaceBetweenBall() -> CGFloat {
        
        let space = ((self.view.bounds.size.width) - 2*_margin) / CGFloat(n-1) // 
        
        return space
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

