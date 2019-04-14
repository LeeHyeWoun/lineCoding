//
//  LineCodingViewController.swift
//  project_1
//
//  Created by SWUCOMPUTER on 14/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
class LineCodingViewController:  UIViewController,UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        return true }

    @IBOutlet var button_delete: UIButton!
    @IBOutlet var button_ok: UIButton!
    @IBOutlet var button_0: UIButton!
    @IBOutlet var button_1: UIButton!
    @IBOutlet var textfiel: UITextField!
    
    @IBOutlet var imgBase: UIImageView!
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var img4: UIImageView!
    @IBOutlet var img5: UIImageView!
    @IBOutlet var img6: UIImageView!
    @IBOutlet var img7: UIImageView!
    @IBOutlet var img8: UIImageView!
    @IBOutlet var img9: UIImageView!
    @IBOutlet var img10: UIImageView!
    
    var info: Int!

    let img_empty = UIImage(named: "empty.png")!
    let img_downUp = UIImage(named: "down_up.png")!
    let img_upDown = UIImage(named: "up_down.png")!
    let img_up = UIImage(named: "up.png")!
    let img_down = UIImage(named: "down.png")!
    let img_rz0 = UIImage(named: "rz0.png")!
    let img_rz1 = UIImage(named: "rz1.png")!
    let img_rzNext0 = UIImage(named: "rz_next0.png")!
    let img_rzNext1 = UIImage(named: "rz_next1.png")!
    
    var input : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgBase.image = UIImage(named: "base1.png")
    }
    
    @IBAction func button_click(_ sender: UIButton) {
        if(input.count<5){
            switch sender {
                
            case button_0:
                input += "0"
                
            default:
                input += "1"
            }
        }

        textfiel.text = input
        
    }
    
    @IBAction func deletButton_click(_ sender: UIButton) {
        input = ""
        textfiel.text = input
    }
    
    @IBAction func okButton_click(_ sender: UIButton) {
        //모든 이미지는 초기화
        var imgArray : Array<UIImage> = [img_empty,img_empty,img_empty,img_empty,img_empty,img_empty,img_empty,img_empty,img_empty]

        //키보드 입력시를 위한 재설정
        input = textfiel.text!
        
        //계산
        if input != ""{
            
            var index = input.index(input.startIndex, offsetBy: 0)

            switch info {
            case 1:
                
                //첫번째 문자의 입력 결과
                //첫번째 이미지
                if input[index] == "0"{
                    imgArray[0] = img_up
                }
                else if input[index] == "1"{
                    imgArray[0] = img_down
                }
                
                for i in 1...input.count*2-2{
                    index = input.index(input.startIndex, offsetBy: i/2)
                    
                    if i % 2 == 0{
                        if input[index] == "0"{
                            imgArray[i] = img_up
                        }
                        else{
                            imgArray[i] = img_down
                        }
                    }
                    else{
                        let nextIndex = input.index(input.startIndex, offsetBy: i/2+1)
                        
                        if input[index] == input[nextIndex]{
                            imgArray[i] = imgArray[i-1]
                        }
                        else if input[index] == "0"{
                            imgArray[i] = img_upDown
                        }
                        else{
                            imgArray[i] = img_downUp
                        }
                    }
                }
                
            case 2:
                imgArray[0] = img_up
                
                for i in 1...input.count-1{
                    index = input.index(input.startIndex, offsetBy: i)
                    let beforIndex = input.index(input.startIndex, offsetBy: i-1)

                    if input[index] == input[beforIndex]{
                        imgArray[i*2-1] = imgArray[i*2-2]
                        imgArray[i*2] = imgArray[i*2-1]
                    }
                    else if input[beforIndex] == "0"{
                        imgArray[i*2-1] = img_upDown
                        imgArray[i*2] = img_down
                    }
                    else{
                        imgArray[i*2-1] = img_downUp
                        imgArray[i*2] = img_up
                    }
                }

                
            case 3:
                //첫번째 이미지
                if input[index] == "0"{
                    imgArray[0] = img_rz0
                }
                else if input[index] == "1"{
                    imgArray[0] = img_rz1
                }

                //나머지 이미지
                for i in 1...input.count-1{
                    index = input.index(input.startIndex, offsetBy: i)
                    
                    if input[index] == "0"{
                        imgArray[i*2-1] = img_rzNext0
                        imgArray[i*2] = img_rz0
                    }
                    else{
                        imgArray[i*2-1] = img_rzNext1
                        imgArray[i*2] = img_rz1
                    }
                }

                
            case 4:
                //첫번째 이미지
                if input[index] == "0"{
                    imgArray[0] = img_upDown
                }
                else if input[index] == "1"{
                    imgArray[0] = img_downUp
                }
                
                //나머지 이미지
                for i in 0...input.count*2-2{
                    
                    if i%2 == 0 {
                        index = input.index(input.startIndex, offsetBy: i/2)
                        if input[index] == "0"{
                            imgArray[i] = img_upDown
                        }
                        else{
                            imgArray[i] = img_downUp
                        }
                    }
                    else{
                        index = input.index(input.startIndex, offsetBy: i/2+1)
                        let beforIndex = input.index(input.startIndex, offsetBy: i/2)
                        
                        if input[index] != input[beforIndex]{
                            if input[index] == "0"{
                                imgArray[i] = img_up
                            }
                            else {
                                imgArray[i] = img_down
                            }
                        }
                        else{
                            if input[index] == "0"{
                                imgArray[i] = img_downUp
                            }
                            else {
                                imgArray[i] = img_upDown
                            }

                        }
                    }
                }

                
            default:
                //시간 상의 문제로 못했습니다.
                imgArray[0] = img_up
            }

        }
        
        //이미지 설정
        img1.image = imgArray[0]
        img2.image = imgArray[1]
        img3.image = imgArray[2]
        img4.image = imgArray[3]
        img5.image = imgArray[4]
        img6.image = imgArray[5]
        img7.image = imgArray[6]
        img8.image = imgArray[7]
        img9.image = imgArray[8]

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
