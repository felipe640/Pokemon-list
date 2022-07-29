//
//  MainPokedexViewController.swift
//  Pokedex
//
//  Created by Felipe on 05/04/22.
//

import UIKit
import Combine
import SDWebImage

class MainPokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var viewModel = MainPokedexViewModel()
    fileprivate let cellIdentifier = String(describing: MainPokedexCell.self)
    var subs = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        reloadTable()
        pokemonListSubs()
    }
    
    private func pokemonListSubs() {
        viewModel.loadPokemonList()
    }
    
    private func reloadTable() {
        viewModel.reloadPassthrough.sink(receiveValue: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }).store(in: &subs)
    }

}


extension MainPokedexViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainPokedexCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MainPokedexCell else {
            return UITableViewCell()
        }
        let placeholder = UIImage(named: "pokeball_placeholder")
        let pokemon = viewModel.pokemonList?.results[indexPath.row]
        cell.pokemonLabel.text = pokemon?.name ?? "nil"
        cell.pokemonImage.sd_setImage(with: URL(string: Url.pokemonImage(index: indexPath.row)), placeholderImage: placeholder)
        return cell
    }
    
    
}
