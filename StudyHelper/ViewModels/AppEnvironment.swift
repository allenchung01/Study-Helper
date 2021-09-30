//
//  AppEnvironment.swift
//  StudyHelper
//
//  Created by Allen Chung on 9/20/21.
//

import Foundation

class AppEnvironment: ObservableObject {
    
    @Published var isDisplayingBanner = false
    
    @Published var isDisplayingAddCourseSuccessBanner = false
    @Published var isDisplayingAddCourseErrorBanner = false
    
    @Published var isDisplayingAddAssignmentSuccessBanner = false
    @Published var isDisplayingAddAssignmentErrorBanner = false
    
    @Published var isDisplayingAddExamSuccessBanner = false
    @Published var isDisplayingAddExamErrorBanner = false
    
    var subText: String = ""
    
    enum BannerType {
        case addCourseSuccess
        case addCourseError
        case addAssignmentSuccess
        case addAssignmentError
        case addExamSuccess
        case addExamError
    }
    
    func displayBanner(bannerType: BannerType, subText: String) {
        self.subText = subText
        switch bannerType {
        case .addCourseSuccess:
            isDisplayingAddCourseSuccessBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddCourseSuccessBanner = false
            }
        case .addCourseError:
            isDisplayingAddCourseErrorBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddCourseErrorBanner = false
            }
        case .addAssignmentSuccess:
            isDisplayingAddAssignmentSuccessBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddAssignmentSuccessBanner = false
            }
        case .addAssignmentError:
            isDisplayingAddAssignmentErrorBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddAssignmentErrorBanner = false
            }
        case .addExamSuccess:
            isDisplayingAddExamSuccessBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddExamSuccessBanner = false
            }
        case .addExamError:
            isDisplayingAddExamErrorBanner = true
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.isDisplayingAddExamErrorBanner = false
            }
        }
    }
    
}
