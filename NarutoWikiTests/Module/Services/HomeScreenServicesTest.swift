//
//  HomeScreenServices.swift
//  NarutoWikiTests
//
//  Created by Brenner on 27/12/21.
//

import XCTest
@testable import NarutoWiki

class HomeScreenServicesTests: XCTestCase {
    
    private var services: HomeScreenServicesProtocol?
    
    func setupHomeScreenServices(mockSuccess: MockEnumTypeSuccess? = nil, mockError: MockEnumTypeError? = nil) -> HomeScreenServices {
        let serviceLayerMock = ServiceLayerMock()
        serviceLayerMock.mockTypeSuccess = mockSuccess
        serviceLayerMock.mockTypeError = mockError
        let service = HomeScreenServices(serviceLayer: serviceLayerMock)
        return service
    }
    
    func testShouldReturnGenericErrorWhenFetchAllCharacters() {
        services = setupHomeScreenServices(mockError: .genericError)
        services?.fetchAllCharacters(completion: { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssert(error == ErrorModel.genericError)
            }
        })
    }
    
    func testShouldReturnSuccessWhenFetchAllCharacters() {
        services = setupHomeScreenServices(mockSuccess: .fetchAllCharactersSuccess)
        services?.fetchAllCharacters(completion: { result in
            switch result {
            case .success(let characters):
                XCTAssert(characters.first?.name == "Akatsuchi")
            case .failure:
                XCTFail()
            }
        })
    }
    
//    func testShouldReturnEloFaqSuccess() {
//        services = setupEloFlexServices(mockSuccess: .faqEloFlexSuccess)
//        let faqObject = FaqEloFlexObject(question: "1 - O que é a plataforma de benefícios flexíveis Elo Flex?", answer: "É uma plataforma onde você pode escolher os benefícios para o seu cartão elegível que mais atendam às necessidades do dia a dia, substituindo os benefícios que você não utiliza.")
//        let faqModel = FaqEloFlex(resultValue: [faqObject])
//
//        services?.getFaqEloFlex(sucesso: { eloFaq in
//            let validatorQuestion = faqModel.resultValue.first?.question == eloFaq.resultValue.first?.question
//            let validatorAnswer = faqModel.resultValue.first?.question == eloFaq.resultValue.first?.question
//            XCTAssert(validatorQuestion && validatorAnswer == true, "testShouldReturnEloFaqSuccess failed")
//        }, falha: {
//            XCTFail()
//        })
//    }
//
//    func testShouldReturnEloFaqGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        let expectation = expectation(description: "")
//        var wasSuccess: Bool = true
//
//        services?.getFaqEloFlex(sucesso: { success in
//            XCTFail()
//        }, falha: {
//            wasSuccess = false
//            expectation.fulfill()
//        })
//
//        waitForExpectations(timeout: 60.0) { error in
//            if error != nil {
//                XCTFail(error?.localizedDescription ?? "Generic Error")
//            }
//            XCTAssert(wasSuccess == false, "testShouldReturnEloFaqGenericError failed")
//        }
//    }
//
//    func testShouldReturnEloFlexBenefitsListSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexBenefitsListSuccess)
//        let benefit = Benefit(id: nil, name: "Bônus Celular - Plano 20R$", status: nil, bundleID: nil, expirationDate: nil, bundleName: nil, catalogID: nil, benefitType: nil, benefitDescription: nil, productType: nil, term: nil, availability: nil, benefitParameters: nil, benefitItems: nil, texts: nil, isActive: nil)
//        let benefitsObjectModel = BeneficiosEloFlex(benefits: [benefit], resultValue: nil, productTypes: nil)
//
//        services?.getListaDeBeneficios(numeroDoCartao: 1002, sucesso: { eloFlex in
//            let validator = eloFlex.listaDeBeneficiosDisponiveis?.benefits?.first?.name == benefitsObjectModel.benefits?.first?.name
//            XCTAssert(validator, "testShouldReturnEloFlexBenefitsListSuccess failed")
//        }, falha: { error in
//            XCTFail()
//        })
//    }
//
//    func testShouldReturnEloFlexBenefitsListGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.getListaDeBeneficios(numeroDoCartao: 1002, sucesso: { eloFlex in
//            XCTFail()
//        }, falha: { error in
//            XCTAssertNotNil(error, "testShouldReturnEloFlexBenefitsListGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexIssuedBenefitsSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexIssuedBenefitsSuccess)
//
//        let benefit = Benefit(id: nil, name: "Voucher Wi-Fi Nacional", status: nil, bundleID: nil, expirationDate: nil, bundleName: nil, catalogID: nil, benefitType: nil, benefitDescription: nil, productType: nil, term: nil, availability: nil, benefitParameters: nil, benefitItems: nil, texts: nil, isActive: nil)
//        let benefitsObjectModel = BeneficiosEloFlex(benefits: nil, resultValue: [benefit], productTypes: nil)
//
//        services?.getBeneficiosConfigurados(numeroDoCartao: 1002, sucesso: { eloFlex in
//            let validator = eloFlex.listaBeneficiosConfigurados?.resultValue?.first?.name == benefitsObjectModel.resultValue?.first?.name
//            XCTAssert(validator, "testShouldReturnEloFlexIssuedBenefitsSuccess failed")
//        }, falha: { error in
//            XCTAssertNil(error, "testShouldReturnEloFlexIssuedBenefitsSuccess failed")
//        })
//    }
//
//    func testShouldReturnEloFlexIssuedBenefitsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.getBeneficiosConfigurados(numeroDoCartao: 1002, sucesso: { eloFlex in
//            XCTFail()
//        }, falha: { error in
//            XCTAssertNotNil(error, "testShouldReturnEloFlexIssuedBenefitsGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexDemoBenefitsSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexDemoBenefitsSuccess)
//        let demoBenefit = DemoBenefit(id: nil, name: "Voucher Wi-Fi Nacional", images: nil, texts: nil, serviceDescription: nil, isExchangeableOffer: nil)
//        let demoBenefitsModel = DemoBenefits(services: [demoBenefit], changeableServices: [demoBenefit])
//
//        services?.getBeneficiosApresentacao(numeroDoCartao: 1002, sucesso: { eloFlex in
//            let validator = eloFlex.listaBeneficiosApresentacao?.services?.first?.name == demoBenefitsModel.services?.first?.name
//            XCTAssert(validator, "testShouldReturnEloFlexBenefitsListSuccess failed")
//        }, falha: { error in
//            XCTFail()
//        })
//    }
//
//    func testShouldReturnEloFlexDemoBenefitsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.getBeneficiosApresentacao(numeroDoCartao: 1002, sucesso: { eloFlex in
//            XCTFail()
//        }, falha: { error in
//            XCTAssertNotNil(error, "testShouldReturnEloFlexDemoBenefitsGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexMigratedCardsSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexMigrateCardSuccess)
//        let last4Object = CartoesMigradosStruct(last4: "1010")
//        let migratedCardsModel = CartoesMigradosResult(resultValue: [last4Object])
//
//        services?.getCartoesMigrados(sucesso: { migratedCards in
//            let validator = migratedCards.last4Card?.resultValue.first?.last4 == migratedCardsModel.resultValue.first?.last4
//            XCTAssert(validator, "testShouldReturnEloFlexMigratedCardsSuccess failed")
//        }, falha: { error in
//            XCTAssertNil(error, "testShouldReturnEloFlexMigratedCardsSuccess failed")
//        })
//    }
//
//    func testShouldReturnEloFlexMigratedCardsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.postMigrarCartao(finalDoCartao: 1002, sucesso: { success in
//            XCTAssert(success == false, "testShouldReturnEloFlexMigratedCardsGenericError failed")
//        })
//    }
//
//    func testShouldReturnMigrateCardSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexGenericSuccess)
//
//        services?.postMigrarCartao(finalDoCartao: 1002, sucesso: { success in
//            XCTAssert(success == true, "testShouldReturnMigrateCardSuccess failed")
//        })
//    }
//
//    func testShouldReturnMigrateCardGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.getCartoesMigrados(sucesso: { migratedCards in
//            XCTFail()
//        }, falha: { error in
//            XCTAssertNotNil(error, "ttestShouldReturnMigrateCardGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexChangeBenefitsSuccess() {
//        services = setupEloFlexServices(mockSuccess: .eloFlexGenericSuccess)
//
//        services?.postTrocarBeneficio(finalDoCartao: 1002, atualBeneficioID: "", novoBeneficiosID: "", sucesso: { success in
//            XCTAssert(success == true, "testShouldReturnEloFlexChangeBenefitsSuccess failed")
//        })
//    }
//
//    func testShouldReturnEloFlexChangeBenefitsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.postTrocarBeneficio(finalDoCartao: 1002, atualBeneficioID: "", novoBeneficiosID: "", sucesso: { success in
//            XCTAssert(success == false, "testShouldReturnEloFlexChangeBenefitsGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexTermsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.getTermos(sucesso: { terms in
//            XCTFail()
//        }, falha: { error in
//            XCTAssertNotNil(error, "ttestShouldReturnMigrateCardGenericError failed")
//        })
//    }
//
//    func testShouldReturnEloFlexAcceptTermsGenericError() {
//        services = setupEloFlexServices(mockError: .eloFlexGenericError)
//
//        services?.aceitarTermosEloFlex(sucesso: { success in
//            XCTAssert(success == false, "testShouldReturnEloFlexChangeBenefitsGenericError failed")
//        })
//    }
//
}

