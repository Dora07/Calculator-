
import UIKit

class ViewController: UIViewController {
   
    var numberOnScreen:Double = 0; //確定數字
    var preiousNumber:Double = 0 ;
    var performingMath = false
    var operation = 0 ;
    
    @IBOutlet weak var Label: UILabel!  //螢幕數字
    
    @IBAction func Numbers(_ sender: UIButton) //將數字0~9為一個組
    {
    if performingMath == true
    {
        Label.text = String(sender.tag-1);
        numberOnScreen = Double(Label.text!)!
        performingMath = false //重複打的數字也會出現在螢幕上
    }
    else
    {
        Label.text = Label.text! + String(sender.tag-1) //打出數字為標記-1
        numberOnScreen = Double(Label.text!)! //確定數字會出現螢幕
    }
    }
    @IBAction func buttons(_ sender: UIButton)//將清除加減乘除為一組
    {
        
        if Label.text != "" && sender.tag != 11 && sender.tag != 16 //如果螢幕出現數字且是12~15
        {
            preiousNumber = Double(Label.text!)!
            if sender.tag == 12 //除
            {
                Label.text = "/";
            }
            else if sender.tag == 13 //乘
            {
                Label.text = "x";
            }
            else if sender.tag == 14 //減
            {
                Label.text = "-";
            }
            else if sender.tag == 15 //加
            {
                Label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
            
        }
       else if sender.tag == 16
        {
            if operation == 12
            {
                Label.text = String( preiousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                Label.text = String( preiousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                Label.text = String( preiousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                Label.text = String( preiousNumber + numberOnScreen)
            }
        }
       else if  sender.tag == 11
       {
        Label.text = "";
        preiousNumber = 0 ;
        numberOnScreen = 0 ;
        operation = 0 ;
       }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

    

