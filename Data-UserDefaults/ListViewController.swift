//
//  ListViewController.swift
//  Data-UserDefaults
//
//  Created by 윤성호 on 17/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    @IBOutlet var name: UILabel!                // 이름
    @IBOutlet var gender: UISegmentedControl!   // 성별
    @IBOutlet var married: UISwitch!            // 결혼여부
    
    // 제스처를 이용한 액션 메소드
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        alert.addTextField {
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default){ (_) in
            
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.set(value, forKey: "name")
            plist.synchronize()
            
            self.name.text = value
            
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alert, animated: false)
    }
    
    // 성별이 변경되면 그 값을 UserDefault 객체에 저장
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        
        let value = sender.selectedSegmentIndex     // 선택된 인덱스 값
        
        // 데이터를 저장
        let plist = UserDefaults.standard
        plist.set(value, forKey: "gender")
        plist.synchronize()
        
    }
    
    // 결혼여부가 변경되면 그 값을 UserDefault 객체에 저장
    @IBAction func changeMarried(_ sender: UISwitch) {
        
        let value = sender.isOn
        
        // 데이터를 저장
        let plist = UserDefaults.standard
        plist.set(value, forKey: "married")
        plist.synchronize()
    }
    
    // 테이블 셀을 클릭했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.row == 0 {     // 이름 셀을 클릭했을 때
//
//            let alert = UIAlertController(title: nil, message: "이름을 입력해주세요", preferredStyle: .alert)
//
//            // 텍스트 필드 추가
//            alert.addTextField {
//                $0.text = self.name.text    // 해당 텍스트 필드에 이름을 표시
//            }
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
//
//                let value = alert.textFields?[0].text
//
//                // 데이터를 저장
//                let plist = UserDefaults.standard
//                plist.set(value, forKey: "name")
//                plist.synchronize()
//
//                // 화면에 표시
//                self.name.text = value
//            })
//
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//            self.present(alert, animated: false)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")
        
    }
    

}
