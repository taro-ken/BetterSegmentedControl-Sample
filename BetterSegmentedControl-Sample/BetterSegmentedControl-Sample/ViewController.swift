//
//  ViewController.swift
//  BetterSegmentedControl-Sample
//
//  Created by 木元健太郎 on 2022/06/11.
//

import UIKit
import BetterSegmentedControl

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSegmentedControlSetUp()
        iconsSegmentedControlSetUp()
        appleStyledControlSetUp()
        noSelectedSegmentControlSetUp()
    }
    
    @objc private func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            view.backgroundColor = .systemGray5
        } else {
            view.backgroundColor = .darkGray
        }
    }
    
    @objc private func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        print("\(sender.index)")
    }
}

extension ViewController {
    //NavigationBarに配置
    private func navigationSegmentedControlSetUp() {
        let navigationSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: 200.0, height: 30.0),
            segments: LabelSegment.segments(withTitles: ["Lights On", "Lights Off"],
                                            normalTextColor: .lightGray,
                                            selectedTextColor: .white),
            options:[.backgroundColor(.darkGray),
                     .indicatorViewBackgroundColor(UIColor(red: 0.36, green: 0.38, blue: 0.87, alpha: 1.00)),
                     .cornerRadius(3.0),
                     .animationSpringDamping(1.0)])
        navigationSegmentedControl.addTarget(self,
                                             action: #selector(navigationSegmentedControlValueChanged(_:)),
                                             for: .valueChanged)
        navigationItem.titleView = navigationSegmentedControl
    }
    //アイコンを配置
    private func iconsSegmentedControlSetUp() {
        let iconsSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 0.0, y: 380.0, width: 160, height: 30.0),
            segments: IconSegment.segments(withIcons: [UIImage(named: "insta")!, UIImage(named: "twitter")!],
                                           iconSize: CGSize(width: 20.0, height: 20.0),
                                           normalIconTintColor: .white,
                                           selectedIconTintColor: UIColor(red: 0.16, green: 0.64, blue: 0.94, alpha: 1.00)),
            options: [.cornerRadius(15.0),
                      .backgroundColor(UIColor(red: 0.16, green: 0.64, blue: 0.94, alpha: 1.00)),
                      .indicatorViewBackgroundColor(.white)])
        iconsSegmentedControl.center.x = view.center.x
        view.addSubview(iconsSegmentedControl)
    }
    //デフォルトのSegmentControlのような見た目
    private func appleStyledControlSetUp() {
        let appleStyledControl: BetterSegmentedControl = .appleStyled(
            frame: CGRect(x: 16.0,
                          y: 435,
                          width: view.bounds.width - 32.0,
                          height: 32.0),
            titles: ["First", "Second", "Third"])
        view.addSubview(appleStyledControl)
    }
    //4つの選択肢がある
    private func noSelectedSegmentControlSetUp() {
        let noSelectedSegmentControl = BetterSegmentedControl(
            frame: CGRect(x: 16.0, y: 490, width: view.bounds.width - 32.0, height: 44.0),
            segments: LabelSegment.segments(withTitles: ["One", "Two", "Three", "Four"]),
            index: -1)
        noSelectedSegmentControl.addTarget(self, action: #selector(segmentedControl1ValueChanged(_:)), for: .valueChanged)
        view.addSubview(noSelectedSegmentControl)
    }
}
