//
//  UIViewController+.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import Foundation

#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {

    }
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview로 보려고 하는 VC를 넣어주세요! 만약 LoginViewController를 보고 싶다면 아래처럼!
        return WritingPageViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        ViewControllerRepresentable()

// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 14 Pro")
    }
}
#endif
