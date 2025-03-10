//
//  RootView.swift
//  LineBreakMode
//
//  Created by hoonkichae on 3/10/25.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import FlexLayout

final class RootView: UIView {
    
    // MARK: - Properties
    private let container: UIView = UIView()
    private let label1: UILabel = UILabel()
    private let label2: UILabel = UILabel()
    private let label3: UILabel = UILabel()
    private let label4: UILabel = UILabel()
    private let label5: UILabel = UILabel()
    private let label6: UILabel = UILabel()

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.defineLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        self.container.frame = self.bounds
        self.container.flex.layout()
    }
    
    private func setupViews() {
        self.addSubview(self.container)
        let eText = "lorem ipsum dolor sit amet, consectur adipiscingelit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        let kText = "가나다라 한글 테스트 입니다. 가나다라한글테스트입니다동해물과. 가나다라 한글 테스트가나 [독점] 가나다라 한글 테스트 입니다"
        [self.label1, self.label2, self.label3, self.label4, self.label5, self.label6].forEach { label in
            self.setupLabel(label, text: kText)
        }
        self.label1.lineBreakMode = .byWordWrapping
        self.label2.lineBreakMode = .byCharWrapping
        self.label3.lineBreakMode = .byTruncatingTail
        self.label3.lineBreakStrategy = .standard

        self.label4.lineBreakMode = .byTruncatingTail
        self.label4.lineBreakStrategy = .pushOut
        
        // 한글에서 lineBreakStrategy 값이 pushOut일때 charWrapping 된것처럼 동작함.
        // 다만 [독점] 글씨와 같이 charwrap은 그냥 끊어버리지만 pushOut은 단어를 유지하려함
        // standard 일땐 wordWrapping 과 동일한 결과를 보임.
        // 영문에선 차이가 없음. wordWrapping과 동일한 결과를 보임.
        
    }
    
    private func setupLabel(_ label: UILabel, text: String) {
        label.text = text
        label.numberOfLines = 3
    }
    
    private func defineLayout() {
        // 아이폰15 사이즈에서 예시를 잘 비교해서 볼 수 있음 다음엔 width를 지정하는게 나을듯.
        self.container.flex.paddingTop(60).paddingHorizontal(36).gap(10).define { flex in
            // TODO: define your layout
            flex.addItem(self.label1)
            flex.addItem(self.label2)
            flex.addItem(self.label3)
            flex.addItem(self.label4)
//            flex.addItem(self.label5)
//            flex.addItem(self.label6)

        }
    }
    
}
