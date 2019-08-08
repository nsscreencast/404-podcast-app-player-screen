//
//  PlayerViewController.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 8/8/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerViewController : UIViewController {

    static var shared: PlayerViewController = {
        let storyboard = UIStoryboard(name: "Player", bundle: nil)
        let playerVC = storyboard.instantiateInitialViewController() as! PlayerViewController
        _ = playerVC.view
        return playerVC
    }()

    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var artworkShadowWrapper: UIView!
    @IBOutlet weak var transportSlider: UISlider!
    @IBOutlet weak var timeProgressedLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    // View Lifecycle

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Theme.Colors.gray4

        titleLabel.textColor = Theme.Colors.gray1
        timeRemainingLabel.textColor = Theme.Colors.gray2
        timeProgressedLabel.textColor = Theme.Colors.gray2

        timeRemainingLabel.text = nil
        timeProgressedLabel.text = nil

        artworkImageView.layer.masksToBounds = true
        artworkImageView.layer.cornerRadius = 12
        artworkImageView.backgroundColor = Theme.Colors.gray4

        artworkShadowWrapper.backgroundColor = .clear
        artworkShadowWrapper.layer.shadowColor = UIColor.black.cgColor
        artworkShadowWrapper.layer.shadowOpacity = 0.9
        artworkShadowWrapper.layer.shadowOffset = CGSize(width: 0, height: 1)
        artworkShadowWrapper.layer.shadowRadius = 20

        transportSlider.setThumbImage(UIImage(named: "Knob"), for: .normal)
        transportSlider.setThumbImage(UIImage(named: "Knob-Tracking"), for: .highlighted)

        let pauseImage = playPauseButton.image(for: .selected)
        let tintedImage = pauseImage?.tint(color: Theme.Colors.purpleDimmed)
        playPauseButton.setImage(tintedImage, for: [.selected, .highlighted])
    }

    func setEpisode(_ episode: Episode, podcast: Podcast) {
        titleLabel.text = episode.title

        artworkImageView.kf.setImage(with: podcast.artworkURL, options: [.transition(.fade(0.3))])
    }

    // MARK: - Actions

    @IBAction func dismissTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func transportSliderChanged(_ sender: Any) {
    }

    @IBAction func skipBack(_ sender: Any) {
    }

    @IBAction func skipForward(_ sender: Any) {
    }

    @IBAction func playPause(_ sender: Any) {
        playPauseButton.isSelected.toggle()
    }
}
