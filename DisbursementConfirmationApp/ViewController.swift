//
//  ViewController.swift
//  DisbursementConfirmationApp
//
//  Created by mizoz on 2021/11/14.
//

import UIKit
import BubbleTransition

class ViewController: UIViewController {
    let transition = BubbleTransition()
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // addButton
        addButton.layer.cornerRadius = 60 / 2
        addButton.backgroundColor = .systemPink
        // NavigationBar
        navigationItem.title = "Disbursement Confirmation App"
        navigationController!.navigationBar.barTintColor = .systemPink
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
    }

}

// addButton animation
extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = addButton.center
        transition.bubbleColor = UIColor.systemPink
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = addButton.center
        return transition
    }
}
