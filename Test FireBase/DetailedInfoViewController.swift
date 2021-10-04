import UIKit
import Firebase
//import SnapKit

class DetailedInfoViewController: UIViewController {
    
    @IBOutlet weak var uIdLabel: UILabel!
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get uID
        let uId = Auth.auth().currentUser?.uid
        print("User token")
        print("----------")
        print(uId!)
        uIdLabel.text = uId

        // get token
        let token = Auth.auth().currentUser?.refreshToken
        print("User token")
        print("----------")
        print(token!)
        tokenLabel.text = token
        
        // get email
        let email = Auth.auth().currentUser?.email
        print("Email")
        print("----------")
        print(email ?? "No email")
        emailLabel.text = "\(email ?? "no email")"
        
        // get phone number
        let phone = Auth.auth().currentUser?.phoneNumber
        print("Phone")
        print("----------")
        print(phone ?? "No number")
        phoneLabel.text = "\(phone ?? "no phone")"
        
    }
    
    
}




//    var didSetupConstraints = false
//    let scrollView  = UIScrollView()
//    let contentView = UIView()
//
//    let label1: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.text = "User ID"
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        contentView.addSubview(label1)
//        view.setNeedsUpdateConstraints()
//    }
//
//    override func updateViewConstraints() {
//        if (!didSetupConstraints) {
//
//            scrollView.snp.makeConstraints {
//                $0.edges.equalTo(view).inset(UIEdgeInsets.zero)
//            }
//
//            contentView.snp.makeConstraints {
//                $0.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
//                $0.width.equalTo(scrollView)
//            }
//
//            label1.snp.makeConstraints {
//                $0.top.equalTo(contentView).inset(200)
//                $0.centerX.equalTo(contentView)
//            }
//
//            didSetupConstraints = true
//
//        }
//        super.updateViewConstraints()
//    }
