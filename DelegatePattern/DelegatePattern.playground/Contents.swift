import UIKit

protocol TextFieldDelegate {
    func textFieldDidBeginEdigint()
    func textFieldShouldReturn(textField: String) -> Bool
}

class TextField {
    var delegate: TextFieldDelegate?
    
    func type() {
        delegate?.textFieldDidBeginEdigint()
    }
    
    func enter(contents: String) {
        delegate?.textFieldShouldReturn(textField: contents)
    }
}

class ViewController: TextFieldDelegate {
    init(textField: TextField) {
        textField.delegate = self
    }
    
    func textFieldDidBeginEdigint() {
        print("유저가 텍스트필드에 입력을 시작했다")
    }
    
    func textFieldShouldReturn(textField: String) -> Bool {
        if textField == "" {
            print("엔터키 사용 불가")
            return false
        } else {
            print("엔터키 사용 가능")
            return true
        }
    }
}

class Website: TextFieldDelegate {
    func textFieldDidBeginEdigint() {
        print("유저가 검색창에 입력을 시작했다")
    }
    
    func textFieldShouldReturn(textField: String) -> Bool {
        if textField == "" {
            print("검색어를 입력하세요")
            return false
        } else {
            print("검색 결과")
            return true
        }
    }
}

let textField = TextField()
let myViewController = ViewController(textField: textField)

let searchBar = TextField()
let website = Website()
searchBar.delegate = website
//textField.delegate = website

textField.type()
textField.enter(contents: "")
// 유저가 텍스트필드에 입력을 시작했다
// 엔터키 사용 불가

// textField의 delegate를 website로 변경하면
// 유저가 검색창에 입력을 시작했다
// 검색어를 입력하세요

searchBar.type()
searchBar.enter(contents: "검색어")
// 유저가 검색창에 입력을 시작했다
// 검색 결과
