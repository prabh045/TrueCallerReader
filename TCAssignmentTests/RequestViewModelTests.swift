//
//  TCAssignmentTests.swift
//  TCAssignmentTests
//
//  Created by Prabhdeep Singh on 01/09/21.
//

import XCTest
@testable import TCAssignment

class RequestViewModelTests: XCTestCase {
    var sut: RequestViewModel!
    var mockTenthRepo = TenthCharRepoMock()
    var mockEveryTenth = EveryTenthCharRepoMock()
    var wordCountMock = WordCountRepoMock()

    override func setUpWithError() throws {
        sut = RequestViewModel(requestRepo: mockTenthRepo, everyTenthCharRepo: mockEveryTenth, wordCountRepo: wordCountMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchRequestCalled() throws {
        //When
        sut.fetchTenthCharacter()
        //Then
        XCTAssertTrue(mockTenthRepo.didCallRequest, "Request to fetch 10th character must be called")
        //When
        sut.fetchEveryTenthCharacter()
        //Then
        XCTAssertTrue(mockEveryTenth.didCallRequest, "Request to fetch every 10th character must be called")
        //When
        sut.fetchWordCount()
        //Then
        XCTAssertTrue(wordCountMock.didCallRequest, "Request to fetch word count must be called")
    }
    
    func testTenthCharSuccess() {
        //Given
        sut.fetchTenthCharacter()
        //When
        mockTenthRepo.mockSuccessResponse()
        //Then
        XCTAssertTrue(sut.tenthCharacter.value == "T", "Tenth Character value must be set after success response")
    }
    
    func testFailureResponse() {
        //Given
        let initalValue = sut.tenthCharacter.value
        sut.fetchTenthCharacter()
        //When
        mockTenthRepo.mockFailureResponse()
        let finalValue = sut.tenthCharacter.value
        //Then
        XCTAssertTrue(initalValue == finalValue, "Tenth Character Value must not change on failed reuqest")
    }

}
