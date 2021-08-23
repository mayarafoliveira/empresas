//
//  SearchView.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit
import Domain

public protocol SearchViewDelegate: AnyObject {
    func searchFor(enterprise: String)
    func showEnterpriseDetail(_ enterprise: Enterprise)
}

class SearchView: UIView {
    weak var delegate: SearchViewDelegate?
    
    private var enterprises: [Enterprise] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // Header
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = .searchBackground
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .graySecondary
        searchView.layer.cornerRadius = 4
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private lazy var searchIcon: UIImageView = {
        let searchIcon = UIImageView()
        searchIcon.image = .searchIcon
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        return searchIcon
    }()
    
    private lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        searchTextField.keyboardType = .default
        searchTextField.autocorrectionType = .no
        searchTextField.textColor = .grayText
        searchTextField.tintColor = .pinkMain
        searchTextField.placeholder = "Pesquise por empresa"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchTextField
    }()
    
    private lazy var noResultsLabel: UILabel = {
        let noResultsLabel = UILabel()
        noResultsLabel.text = "Nenhum resultado encontrado"
        noResultsLabel.textAlignment = .center
        noResultsLabel.textColor = .grayText
        noResultsLabel.font = UIFont.systemFont(ofSize: 18)
        noResultsLabel.isHidden = true
        noResultsLabel.translatesAutoresizingMaskIntoConstraints = false
        return noResultsLabel
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.setBackgroundColor(to: .white)
        addSubviews()
        setupConstraints()

        searchTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(backgroundImage)
        self.addSubview(searchView)
        self.searchView.addSubview(searchIcon)
        self.searchView.addSubview(searchTextField)
        self.addSubview(noResultsLabel)
        self.addSubview(tableView)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupBackgroundImageConstraints()
        setupSearchViewConstraints()
        setupSearchIconConstraints()
        setupSearchTextFieldConstraints()
        setupNoResultsLabelConstraints()
        setupTableViewConstraints()
    }
    
    // Header
    func setupBackgroundImageConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.heightAnchor.constraint(
                equalTo: self.heightAnchor,
                multiplier: 1.0/3.5
            )
        ])
    }
    
    func setupSearchViewConstraints() {
        NSLayoutConstraint.activate([
            searchView.rightAnchor.constraint(
                equalTo: self.rightAnchor,
                constant: -16
            ),
            searchView.leftAnchor.constraint(
                equalTo: self.leftAnchor,
                constant: 16
            ),
            searchView.topAnchor.constraint(
                equalTo: self.backgroundImage.bottomAnchor,
                constant: -24
            ),
            searchView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupSearchIconConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.leftAnchor.constraint(
                equalTo: self.searchView.leftAnchor,
                constant: 16
            ),
            searchIcon.topAnchor.constraint(
                equalTo: self.searchView.topAnchor,
                constant: 14
            ),
            searchIcon.bottomAnchor.constraint(
                equalTo: self.searchView.bottomAnchor,
                constant: -14
            )
        ])
    }
    
    func setupSearchTextFieldConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.rightAnchor.constraint(
                equalTo: self.searchView.rightAnchor,
                constant: -12
            ),
            searchTextField.leftAnchor.constraint(
                equalTo: self.searchIcon.rightAnchor,
                constant: 15
            ),
            searchTextField.topAnchor.constraint(
                equalTo: self.searchView.topAnchor,
                constant: 5
            ),
            searchTextField.bottomAnchor.constraint(
                equalTo: self.searchView.bottomAnchor,
                constant: -5
            )
        ])
    }
    
    func setupNoResultsLabelConstraints() {
        NSLayoutConstraint.activate([
            noResultsLabel.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            noResultsLabel.centerYAnchor.constraint(
                equalTo: self.centerYAnchor
            )
        ])
    }
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.topAnchor.constraint(
                equalTo: self.searchView.bottomAnchor,
                constant: 16
            )
        ])
    }
}

// MARK: TextField
extension SearchView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        self.delegate?.searchFor(enterprise: text)
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.enterprises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        cell.textLabel?.text = self.enterprises[indexPath.row].enterpriseName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        self.delegate?.showEnterpriseDetail(self.enterprises[indexPath.row])
    }
}

extension SearchView {
    public func updateList(_ enterprises: [Enterprise]) {
        self.enterprises = enterprises
        noResultsLabel.isHidden = !enterprises.isEmpty
    }
}
