//
//  Module.swift
//  UNS
//
//  Created by San Byn Nguyen on 16.01.2020.
//  Copyright © 2020 San Byn Nguyen. All rights reserved.
//

import UIKit

public protocol RouterPresenterProtocol: class {}
public protocol InteractorPresenterProtocol: class {}
public protocol PresenterRouterProtocol: class {}
public protocol PresenterInteractorProtocol: class {}
public protocol PresenterViewProtocol: class {}
public protocol ViewPresenterProtocol: class {}

// MARK: - VIPER
public protocol RouterProtocol: RouterPresenterProtocol {
    associatedtype PresenterRouter
    var presenter: PresenterRouter! { get set }
}

public protocol InteractorProtocol: InteractorPresenterProtocol {
    associatedtype PresenterInteractor
    var presenter: PresenterInteractor! { get set }
}

public protocol PresenterProtocol: PresenterRouterProtocol & PresenterInteractorProtocol & PresenterViewProtocol {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    associatedtype ViewPresenter
    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
    var view: ViewPresenter! { get set }
}

public protocol ViewProtocol: ViewPresenterProtocol, UIViewController {
    associatedtype PresenterView
    var presenter: PresenterView! { get set }
}

// MARK: - Module
public protocol Module {
    associatedtype View: ViewProtocol
    associatedtype Presenter: PresenterProtocol
    associatedtype Router: RouterProtocol
    associatedtype Interactor: InteractorProtocol
    
    func assemble(view: inout View, presenter: inout Presenter, router: inout Router, interactor: inout Interactor)
//    func build() -> View
}

public extension Module {
    func assemble(view: inout View, presenter: inout Presenter, router: inout Router, interactor: inout Interactor) {
        view.presenter = (presenter as! View.PresenterView)
        presenter.view = (view as! Presenter.ViewPresenter)
        presenter.interactor = (interactor as! Presenter.InteractorPresenter)
        presenter.router = (router as! Presenter.RouterPresenter)
        interactor.presenter = (presenter as! Interactor.PresenterInteractor)
        router.presenter = (presenter as! Router.PresenterRouter)
    }
}
