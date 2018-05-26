import Foundation
import YogaKit
import UILayoutSpec

class TestCell: UITableViewCell {
    
    struct Const {
        static let spacing: CGFloat = 15.0
        static let insets: UIEdgeInsets = .init(top: 15.0,
                                                left: 15.0,
                                                bottom: 15.0,
                                                right: 15.0)
    }
    
    lazy var profileView: UIImageView = {
        let view = UIImageView(frame: .zero)
        TestCell.downloadImage(view)
        view.clipsToBounds = true
        view.style.preferredSize = .init(width: 50.0,
                                         height: 50.0)
        view.layer.cornerRadius = 25.0
        
        view.style.flexGrow = 0.0
        view.style.flexShrink = 0.0
        return view
    }()
    
    lazy var titleView: UILabel = {
        let view = UILabel(frame: .zero)
        view.attributedText = TestCell.desc
        view.numberOfLines = 5
        
        view.style.flexGrow = 0.0
        view.style.flexShrink = 1.0
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.updateLayoutSpec()
        super.layoutSubviews()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        self.updateLayoutSpec()
        return contentView.sizeThatFits(size)
    }
}

extension TestCell: UILayoutSpecDelegate {
    func layoutSpec() -> UILayoutSpec {
        let elements = [profileView, titleView].map { UILayoutElement($0) }
        let stackLayout = UIStackLayoutSpec(containerView: self.contentView,
                                            childs: elements,
                                            direction: .row,
                                            spacing: Const.spacing,
                                            alignContent: .spaceBetween,
                                            alignItems: .center)
        
        let insetLayout = UIInsetLayoutSpec(insets: Const.insets,
                                            child: stackLayout)

        return insetLayout
    }
}

extension TestCell {
    static var imageURL: URL? {
        return URL(string: "https://pbs.twimg.com/profile_images/884627694507278336/6H_U_aEA_400x400.jpg")
    }
    
    static var desc: NSAttributedString {
        return NSAttributedString(string: "가수의 꿈을 이루기 위해 초등학교 6학년이었던 2009년 말부터 EXILE의 댄스 아카데미 EXPG 오사카 지점에서 3년 정도 춤을 배우고 있었는데, 중학교 3학년 때인 2012년 친구와 쇼핑을 하던 중 JYP 관계자에게 캐스팅되었다.[19] 당시 사나는 대한민국 드라마 드림 하이를 열심히 보고 있었는데, JYP 관계자가 보여 준 소속 가수 사진이 모두 드림 하이 속 등장인물이라 다음 날 예정되어 있던 JYP 글로벌 오디션에 바로 응시했다.[20] 오디션에 최종 합격했지만 중3이라는 어린 나이에 학업을 포기하고 다른 나라로 건너가는 것은 여러 모로 부담이 컸는데, 사나의 어머니가 2PM 콘서트에 사나를 데려가서 콘서트를 보면서 무엇을 느꼈냐고 물어봤고, 사나는 자신도 이 무대에 서고 싶다고 대답했다. 사나의 대답을 들은 사나의 부모는 연습생 입사를 허락했고, 사나는 같은 해 4월 대한민국으로 건너왔다.")
    }
    
    static func downloadImage(_ view: UIImageView) {
        DispatchQueue.global(qos: .background).async {
            let data = try? NSData(contentsOf: TestCell.imageURL!,
                                   options: .alwaysMapped)
            if let `data` = data {
                DispatchQueue.main.async {
                    view.image = UIImage(data: data as Data)
                }
            }
        }
    }
}
