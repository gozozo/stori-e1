//
//  RateView.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

@IBDesignable
class VotesDateView: UIView {

    // MARK: - IBOutlet
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.lightText
        }
    }
    @IBOutlet private weak var votesLabel: UILabel!  {
        didSet {
            votesLabel.font = UIFont.lightText
        }
    }

    // MARK: - IBInspectable
    @IBInspectable var textColor: UIColor {
        get { dateLabel.textColor }
        set {
            dateLabel.textColor = newValue
            votesLabel.textColor = newValue
        }
    }
    
    @IBInspectable var date: String {
        get { dateLabel.text ?? "" }
        set { dateLabel.text = newValue }

    }
    @IBInspectable var votes: String {
        get { votesLabel.text ?? "" }
        set { votesLabel.text = newValue }

    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        UINib(nibName: "VotesDateView", bundle: Bundle(for: VotesDateView.self)).instantiate(withOwner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
