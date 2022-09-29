//
//  QuotesViewController.swift
//  AppPensamentos
//
//  Created by Gabriel Carvalho on 26/09/22.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var imageViewPhotoBackground: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var constrainTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        
    }
    
    func formatView() {
        
        view.backgroundColor = config.colorScheme == 0 ? .white : .black
        labelQuote.textColor = config.colorScheme == 0 ? .black : .white
        labelAuthor.textColor = config.colorScheme == 0 ? .black : .white
        
        prepareQuote()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote() {
        
        if config.autoRefresh {
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: config.timeRefresh, repeats: true) { (timer) in
                    self.showRandomQuote()
            }
        }
        
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        labelQuote.text = quote.quoteFormatted
        labelAuthor.text = quote.authorFormatted
        imageViewPhoto.image = UIImage(named: quote.image)
        imageViewPhotoBackground.image = imageViewPhoto.image
        
        labelQuote.alpha = 0.0
        labelAuthor.alpha = 0.0
        imageViewPhoto.alpha = 0.0
        imageViewPhotoBackground.alpha = 0.0
        constrainTop.constant = 60
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1.0
            self.labelAuthor.alpha = 1.0
            self.imageViewPhoto.alpha = 1.0
            self.imageViewPhotoBackground.alpha = 0.25
            self.constrainTop.constant = 10
            self.view.layoutIfNeeded()

        }
        
    }
    
}
