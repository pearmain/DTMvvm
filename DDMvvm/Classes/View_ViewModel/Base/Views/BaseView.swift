//
//  BaseView.swift
//  Daily Esport
//
//  Created by Dao Duy Duong on 10/7/15.
//  Copyright © 2015 Nover. All rights reserved.
//

import UIKit
import RxSwift

open class BaseView<VM: GenericViewModel>: UIView, GenericView {
    
    public typealias ViewModelElement = VM
    
    public var disposeBag: DisposeBag? = DisposeBag()
    
    private var _viewModel: VM?
    public var viewModel: VM? {
        get { return _viewModel }
        set {
            disposeBag = DisposeBag()
            _viewModel?.destroy()
            
            _viewModel = newValue
            
            viewModelChanged()
        }
    }
    
    init(viewModel: VM? = nil) {
        self._viewModel = viewModel
        super.init(frame: .zero)
        setup()
    }
    
    init(frame: CGRect, viewModel: VM? = nil) {
        self._viewModel = viewModel
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        backgroundColor = .clear
        
        initialize()
        viewModelChanged()
    }
    
    private func viewModelChanged() {
        bindViewAndViewModel()
        viewModel?.react()
    }
    
    open func initialize() {}
    open func bindViewAndViewModel() {}
    
    open func destroy() {
        disposeBag = DisposeBag()
        viewModel?.destroy()
    }

}

open class BaseCollectionCell<VM: GenericCellViewModel>: UICollectionViewCell, GenericView {
    
    public typealias ViewModelElement = VM
    
    public var disposeBag: DisposeBag? = DisposeBag()
    
    private var _viewModel: VM?
    public var viewModel: VM? {
        get { return _viewModel }
        set {
            disposeBag = DisposeBag()
            _viewModel?.destroy()
            
            _viewModel = newValue
            
            viewModelChanged()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        destroy()
    }
    
    private func setup() {
        backgroundColor = .clear
        initialize()
    }
    
    private func viewModelChanged() {
        bindViewAndViewModel()
        viewModel?.react()
    }
    
    open func destroy() {
        disposeBag = DisposeBag()
        viewModel?.destroy()
    }
    
    open func initialize() {}
    open func bindViewAndViewModel() {}
    
}

open class BaseTableCell<VM: GenericCellViewModel>: UITableViewCell, GenericView {
    
    public typealias ViewModelElement = VM
    
    public var disposeBag: DisposeBag? = DisposeBag()
    
    private var _viewModel: VM?
    public var viewModel: VM? {
        get { return _viewModel }
        set {
            disposeBag = DisposeBag()
            _viewModel?.destroy()
            
            _viewModel = newValue
            
            viewModelChanged()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        destroy()
    }
    
    private func setup() {
        backgroundColor = .clear
        separatorInset = .zero
        layoutMargins = .zero
        preservesSuperviewLayoutMargins = false
        
        initialize()
    }
    
    private func viewModelChanged() {
        bindViewAndViewModel()
        viewModel?.react()
    }
    
    open func destroy() {
        disposeBag = DisposeBag()
        viewModel?.destroy()
    }
    
    open func initialize() {}
    open func bindViewAndViewModel() {}
    
}










