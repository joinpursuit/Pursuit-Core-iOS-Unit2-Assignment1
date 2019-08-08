
import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    //User input one
    @IBOutlet var userInput1: UITextField!
   //User input two
    @IBOutlet var userInput2: UITextField!

    @IBOutlet weak var backGroundImage:UIImageView!
    var image = UIImage(named: "Wet Desert")
    override func viewDidLoad() {
        super .viewDidLoad()
        backGroundImage.image = image
      
    }
    
    @IBAction func insertPlayerNames(_ sender: UIButton) {
      // uses the identfied segue to pass information from from view controller to the next
           performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    // function that prepares information inputted into the texted field before the segue is tiggered.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewControllerArrayNames = segue.destination as! ViewController
        viewControllerArrayNames.playerArray[0] = userInput1.text?.uppercased() ?? "Player One"
        viewControllerArrayNames.playerArray[1] = userInput2.text?.uppercased() ?? "Player Two"
       
    }
}
    
 


