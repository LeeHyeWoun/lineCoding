//
//  ViewController.swift
//  project_1
//
//  Created by SWUCOMPUTER on 08/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var view_content: UIView!
    @IBOutlet var label_name: UILabel!
    @IBOutlet var label_context: UILabel!
    @IBOutlet var picker_linCoding: UIPickerView!
    @IBOutlet var button_ok: UIButton!
    
    let lineCodingArray:Array<String> = ["*","Polar-NRZ-L","Polar-NRZ-I","Polar-RZ","Manchester","Differenctial Manchester"]
    let lineCoddingContextArray:Array<String> = ["일련의 이진 데이터를 디지털 신호로 바꾸는 작업을 말합니다. 실제 신호의 송수신을 담당하는 물리층에서 비트로 표현된 정보를 그대로 전송 할 수 없기 때문에 물리층에서도 이해 할 수 있는 형태(디지털 신호)로 한번 더 변환해야 합니다.","전압 준위가 비트의 값을 결정\n\n0 : 양 전압, 1 : 음 전압","전압의 변화로 비트 값 결정\n\n0 : 전압의 변화 없음 1 : 전압의 변화 있음\n\n비트 1을 만날 때 마다 신호가 변하기 때문에 동기화 제공","동기화 보장을 위해 각 신호마다 동기화 정보를 포함\n\n양, 음, 영 전압을 사용\n\n0 : 음 전압, 1 : 양 전압\n\n한 비트를 부호화하기 위해 두 번의 신호 변화가 이루어짐","동기화를 달성하는 동시에 해당 비트를 표현하기 위해 각 비트 간격 중간에서 신호를 반전\n\n두 가지 전이를 통해 \'RZ\'와 같은 수준의 동기화 달성","비트 간격 중간에서의 반전은 동기화를 위해 사용\n\n비트 간격 시작점에서의 전이 여부로 비트를 식별\n\n0 : 비트의 전이, 1 : 무변화"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label_name.text = "회선 코딩이란?"
        label_context.text = lineCoddingContextArray[0]

        self.view_content.isHidden = true
    }

    @IBAction func button_ok_click(_ sender: Any) {
        let row : Int = self.picker_linCoding.selectedRow(inComponent: 0)
        let name: String = lineCodingArray[row]
        let context: String = lineCoddingContextArray[row]
        
        label_name.text = name
        label_context.text = context
        
        if(row>0){
            self.view_content.isHidden = false
        }
        else{
            label_name.text = "회선 코딩이란?"
            self.view_content.isHidden = true
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lineCodingArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lineCodingArray[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.title = self.label_name.text
        
        if segue.identifier == "gotoLineCoding" {
            let destVC = segue.destination as! LineCodingViewController
            let row: Int! = self.picker_linCoding.selectedRow(inComponent: 0)
            
            destVC.info = row
        }

    }


}

