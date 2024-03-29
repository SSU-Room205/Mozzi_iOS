//
//  File.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import Foundation
//
//  MonthView.swift
//  ComeIt
//
//  Created by Jaeyong Lee on 2022/11/05.
//  Copyright © 2022 Try-ing. All rights reserved.
//

import UIKit
import SnapKit

protocol MonthViewDelegate: AnyObject {
    func switchCalendarButtonDidTapped(shape calendarShape: MonthView.CalendarShape)
}

final class MonthView: UIView {

    lazy var monthLabel = UILabel()
    lazy var changeButton = UIButton(type: .system)

    weak var delegate: MonthViewDelegate?

    var calendarShape: CalendarShape = .month

    enum CalendarShape {
        case week
        case month

        var buttonImage: UIImage? {
            switch self {
            case .week:
                return .init(.btn_month_calendar)
            case .month:
                return .init(.btn_week_calendar)
            }
        }
    }

    convenience init(calendarShape: CalendarShape) {
        self.init(frame: .zero)
        self.calendarShape = calendarShape
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupMonthLabel()
        setupChangeButton()
    }

    func updateYearAndMonth(to date: Date) {
        updateMonthLabelText(to: date)
    }

    @objc
    func switchCalendarButtonDidTapped() {
        calendarShape = calendarShape == .month ? .week : .month
        delegate?.switchCalendarButtonDidTapped(shape: calendarShape)
        changeButton.setImage(calendarShape.buttonImage, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("DO Not Use on Storyboard")
    }

    private func setupChangeButton() {
        changeButton.setImage(.init(.btn_week_calendar), for: .normal)
        changeButton.addTarget(self, action: #selector(switchCalendarButtonDidTapped), for: .touchUpInside)

        addSubview(changeButton)
        changeButton.snp.makeConstraints { make in
            make.centerY.equalTo(monthLabel)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(32)
            make.height.equalTo(17)
        }
    }

    private func setupMonthLabel() {
        updateMonthLabelText(to: .init())

        addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func updateMonthLabelText(to date: Date) {
        monthLabel.attributedText = NSMutableAttributedString()
            .gmarketSansLight(string: "\(date.year)  ", fontSize: ._15)
            .gmarketSansBold(string: "\(date.month)월", fontSize: ._15)
    }
}
