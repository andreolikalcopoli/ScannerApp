//
//  ViewController.swift
//  ScannerApp
//
//  Created by Andrija Randjelovic on 1.2.22..
//

import UIKit
import VisionKit

class ScannerViewControler: UIViewController, VNDocumentCameraViewControllerDelegate{
    
    @IBOutlet weak var img: UIImageView!
    
    let scannerViewController = VNDocumentCameraViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannerViewController.delegate = self
    }

    @IBAction func scanClicked(_ sender: Any) {
        
        present(scannerViewController, animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        // Process the scanned pages
        for pageNumber in 0..<scan.pageCount {
            let image = scan.imageOfPage(at: pageNumber)
            img.image = image
        }

        // You are responsible for dismissing the controller.
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        // You are responsible for dismissing the controller.
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        // You should handle errors appropriately in your app.
        print(error)

        // You are responsible for dismissing the controller.
        controller.dismiss(animated: true)
    }
    
}

