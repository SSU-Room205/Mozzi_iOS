//
//  Mozzi.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/26.
//

import Foundation

struct Consum: Codable {
    let image: String
    let name: String
    let itemName: String
    let address: String
    let price: String
    let date: String
    let category : String
    let point : Int
    let note : String
}


struct Consum1{
    let image: UIImage
    let name: String
    let itemName: String
    let address: String
    let price: String
    let date: String
    let category : String
    let point : Int
    let note : String
    
}


//MARK: dummyData 셍성

extension Consum1 {
    static func dummy() -> [Consum1]{
        return [Consum1(image: dummyDataImage.dummyDataImage1,
                        name: "크라이치즈버거",
                        itemName: "더블치즈버거",
                        address: "서울시 동작구 상도로 61길 25 1층",
                        price: "8,900",
                        date: "2023-04-15",
                        category: "식사",
                        point: 4,
                        note: "역시 학교 근처에서는 크라이치즈 버거가 최고의 햄버거집인거 같다. 근본의 치즈 버거는 배신하지 않는다. 가격이 비싼건 조금 아쉽긴 하지만.. 그래도 또 올 것 같다"),
                Consum1(image: dummyDataImage.dummyDataImage2, name: "eeaCoffee",
                        itemName: "아메리카노",
                        address: "",
                        price: "3,500",
                        date: "2023-04-15",
                        category: "카페",
                        point: 5,
                        note: "오랜만에 아메리카노랑 쿠키를 먹으면서 여유를 즐겼다. 작은 동네카페에서 소소하게 행복을 느낄 수 있는 곳~!"),
                Consum1(image: dummyDataImage.dummyDataImage3,
                        name: "달쿠마",
                        itemName: "바닐라빈 가나슈 마들렌",
                        address: "서울특별시 동작구 상도로 20-392",
                        price: "3,500",
                        date: "2023-04-26",
                        category: "카페",
                        point: 5,
                        note: "언덕 위의 작은 과자점 달쿠마! 오랜만에 1번 출구 갈 일 있어서 방문했는데 너무너무 맛있었다~! 가나슈는 다크 초콜릿을 생각했는데 화이트 초콜릿이었다. 바닐라 향이 참 좋았던 마들렌."),
                Consum1(image: dummyDataImage.dummyDataImage10,
                        name: "백종원 시장 떡볶이",
                        itemName: "시장 떡볶이",
                        address: "서울특별시 관악구 서림길 99-15",
                        price: "6000",
                        date: "2023-04-17",
                        category: "식사",
                        point: 4,
                        note: "오랜만에 먹은 시장 떡볶이와 순대, 피카츄 돈까스!! 8살때가 떠오르는 시간이었다. 어릴적 추억을 맛보고 싶다면 이곳으로"),
                
                Consum1(image: dummyDataImage.dummyDataImage9,
                        name: "청년족발",
                        itemName: "반반 족발 소",
                        address: " 서울특별시 관악구 장군봉1길 56",
                        price: "32000",
                        date: "2023-04-20",
                        category: "식사",
                        point: 5,
                            note: "학교에서 밤새서 시험공부하는 날에 배달로 시켜먹음. 불족이 미쳐버렸다. 너무 맛있게 매운맛이었어요."),
                
                Consum1(image: dummyDataImage.dummyDataImage8,
                        name: "퍼민",
                        itemName: "분보후에",
                        address: "서울특별시 동작구 사당로 36",
                        price: "8500",
                        date: "2023-04-15",
                        category: "식사",
                        point: 4,
                            note: "생전 처음보는 음식 분보후에. 면은 쌀국수보단 우동면 같고 처음보는 고기와 완자들이 생각보다 너무 맛있었다. 숭실대 쌀국수 맛집! "),
                Consum1(image: dummyDataImage.dummyDataImage7,
                        name: "숭실 고맨네",
                               itemName: "고맨 삼겹",
                               address: "서울특별시 동작구 상도로 45길",
                               price: "25000",
                               date: "2023-04-30",
                               category: "식사",
                               point: 1,
                               note: "기쁜 마음에 찾아간 프리미엄 삼겹살집. 근데 삼겹살 1인분 25000원은 너무비싸요 사장님…"),

                Consum1(image: dummyDataImage.dummyDataImage6,
                       name: "긴자료코 숭실대점",
                               itemName: "데미그라스 돈가스",
                               address: "서울 동작구 사당로 12 서정힐탑 1층",
                               price: "10000",
                               date: "2023-04-11",
                               category: "식사",
                               point: 4,
                               note: "데미그라스 소스에 절여진 돈가스! 무료 사이즈 업에 양이 너무 많아요. 근데 조금 느끼해서 아쉬웠어요")
                        ]
    }
}

