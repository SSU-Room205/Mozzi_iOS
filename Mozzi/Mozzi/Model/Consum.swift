//
//  Mozzi.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/26.
//

import Foundation

struct Consum {
    let image: UIImage
    let itemName: String
    let address: String
    let price: String
    let date: String
    let category : String
    let point : Int
    let note : String
}

extension Consum {
    static func dummy() -> [Consum]{
        return [Consum(image: dummyDataImage.dummyDataImage1,
                    itemName: "크라이치즈버거",
                    address: "서울시 동작구 상도로 61길 25 1층",
                    price: "8,900",
                    date: "2023-04-15",
                    category: "식사",
                    point: 4,
                    note: "역시 학교 근처에서는 크라이치즈 버거가 최고의 햄버거집인거 같다. 근본의 치즈 버거는 배신하지 않는다. 가격이 비싼건 조금 아쉽긴 하지만.. 그래도 또 올 것 같다"),
                Consum(image: dummyDataImage.dummyDataImage2,
                itemName: "아메리카노",
                address: "",
                price: "3,500",
                date: "2023-04-10",
                category: "카페",
                point: 5,
                note: "오랜만에 아메리카노랑 쿠키를 먹으면서 여유를 즐겼다. 작은 동네카페에서 소소하게 행복을 느낄 수 있는 곳~!"),
                Consum(image: dummyDataImage.dummyDataImage3,
                itemName: "바닐라빈 가나슈 마들렌",
                address: "서울특별시 동작구 상도로 20-392",
                price: "3,500",
                date: "2023-04-26",
                category: "카페",
                point: 5,
                note: "언덕 위의 작은 과자점 달쿠마! 오랜만에 1번 출구 갈 일 있어서 방문했는데 너무너무 맛있었다~! 가나슈는 다크 초콜릿을 생각했는데 화이트 초콜릿이었다. 바닐라 향이 참 좋았던 마들렌."),
        ]
    }
}

