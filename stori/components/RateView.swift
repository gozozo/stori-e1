//
//  RateView.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

@IBDesignable
class RateView: UIView {

    // MARK: - IBOutlet
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var progressRate: UIProgressView!
    @IBOutlet private weak var rateLabel: UILabel! {
        didSet {
            rateLabel.font = UIFont.lightText
        }
    }

    // MARK: - IBInspectable
    @IBInspectable var progress: Float {
        get { progressRate.progress }
        set {
            progressRate.progress = newValue
            rateLabel.text = newValue == 0 ? "--" : "\(String(format: "%.1f", newValue * 10))"
        }
    }
    @IBInspectable var textColor: UIColor {
        get { rateLabel.textColor }
        set {
            rateLabel.textColor = newValue
        }
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
        UINib(nibName: "RateView", bundle: Bundle(for: RateView.self)).instantiate(withOwner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
