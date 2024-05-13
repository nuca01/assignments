//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Nuca on 13.05.24.
//

import XCTest
@testable import UnitTestingAssignment
final class UnitTestingAssignmentTests: XCTestCase {
    var viewModel: CartViewModel?
    var firstProductInAllProducts: Product? {
        viewModel?.allProducts?.first
    }
    
    override func setUpWithError() throws {
        viewModel = CartViewModel()
        fetchProducts()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testAddProductWithNilID() throws {
        let expectedProductCount = viewModel?.selectedItemsQuantity
        let expectedSelectedProductsCount = viewModel?.selectedProducts.count
        
        viewModel?.addProduct(withID: nil)
        
        XCTAssertEqual(expectedProductCount, viewModel?.selectedItemsQuantity)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
    }
    
    func testAddProductWithInvalidID() throws {
        let expectedProductCount = viewModel?.selectedItemsQuantity
        let expectedSelectedProductsCount = viewModel?.selectedProducts.count
        
        viewModel?.addProduct(withID: -5)
        
        XCTAssertEqual(viewModel?.selectedItemsQuantity, expectedProductCount)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
    }
    
    func testAddProductWithValidID() throws {
        let expectedProductCount = (viewModel?.selectedItemsQuantity ?? 0) + 1
        let expectedSelectedProductsCount = (viewModel?.selectedProducts.count ?? 0) + 1
        let expectedProductsSelectedQuantity = (viewModel?.allProducts?.first?.selectedQuantity ?? 0) + 1
        
        viewModel?.addProduct(withID: firstProductInAllProducts?.id)
        
        XCTAssertEqual(viewModel?.selectedItemsQuantity, expectedProductCount)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
        XCTAssertEqual(expectedProductsSelectedQuantity, firstProductInAllProducts?.selectedQuantity)
    }
    
    func testAddMultipleProductsWithSameID() throws {
        let expectedProductCount = (viewModel?.selectedItemsQuantity ?? 0) + 3
        let expectedSelectedProductsCount = (viewModel?.selectedProducts.count ?? 0) + 1
        let expectedProductsSelectedQuantity = (firstProductInAllProducts?.selectedQuantity ?? 0) + 3
        
        for _ in 0..<3 {
            viewModel?.addProduct(withID: firstProductInAllProducts?.id)
        }
        
        XCTAssertEqual(viewModel?.selectedItemsQuantity, expectedProductCount)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
        XCTAssertEqual(expectedProductsSelectedQuantity, firstProductInAllProducts?.selectedQuantity)
    }
    
    func testAddProductWithNilProduct() throws {
        let expectedProductCount = viewModel?.selectedItemsQuantity
        let expectedSelectedProductsCount = viewModel?.selectedProducts.count
        
        viewModel?.addProduct(product: nil)
        
        XCTAssertEqual(expectedProductCount, viewModel?.selectedItemsQuantity)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
    }
    
    func testRemoveProductWithInvalidID() {
        let expectedProductCount = viewModel?.selectedItemsQuantity
        let expectedSelectedProductsCount = viewModel?.selectedProducts.count
        
        viewModel?.removeProduct(withID: 1)
        
        XCTAssertEqual(expectedProductCount, viewModel?.selectedItemsQuantity)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
    }
    
    func testRemoveProductWithValidId() {
        viewModel?.addProduct(withID: firstProductInAllProducts?.id)
        let expectedProductCount = (viewModel?.selectedItemsQuantity ?? 0) - 1
        let expectedSelectedProductsCount = (viewModel?.selectedProducts.count ?? 0) - 1
        let expectedProductsSelectedQuantity = (firstProductInAllProducts?.selectedQuantity ?? 0) - 1
        
        viewModel?.removeProduct(withID: firstProductInAllProducts!.id!)
        
        XCTAssertEqual(viewModel?.selectedItemsQuantity, expectedProductCount)
        XCTAssertEqual(expectedSelectedProductsCount, viewModel?.selectedProducts.count)
        XCTAssertEqual(expectedProductsSelectedQuantity, firstProductInAllProducts?.selectedQuantity)
    }
    
    func testClearCart() {
        viewModel?.addProduct(withID: firstProductInAllProducts?.id)
        viewModel?.addProduct(withID: firstProductInAllProducts?.id)
        viewModel?.addProduct(withID: viewModel?.allProducts?.last?.id)
        let previouslySelectedProducts = viewModel?.selectedProducts ?? [Product]()
        
        viewModel?.clearCart()
        
        XCTAssertEqual(viewModel?.selectedItemsQuantity, 0)
        XCTAssertEqual(0, viewModel?.selectedProducts.count)
        for product in previouslySelectedProducts {
            XCTAssertEqual(0, product.selectedQuantity, "failed test for \(String(describing: product.id))")
        }
    }
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func fetchProducts() {
        viewModel?.fetchProducts()
        
        while viewModel?.allProducts == nil {
            print("fetching")
        }
    }
    
}


