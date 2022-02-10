//
//  MainController.swift
//  WeatherAPI
//
//  Created by Victoria on 9.02.22.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var list = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TableViewCell.self))
    }
    
    
    func getData() {
        let session = URLSession.shared
        guard let urlRequest = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=91d72de948c9a6cb82aa807ff6b87804&lat=53.893009&lon=27.567444") else { return }
        
        session.dataTask(with: urlRequest) { (data, response, error)
            in
            if let networkError = error {
                print("\(networkError)")
            }
            else {
                do {
                    let weatherData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    
                    let weather = Weather(weatherData: weatherData)
                    self.list.append(weather)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    print("\(weather)")
                }
                catch let jsonError as NSError {
                    print("\(jsonError)")
                }
            }
        }.resume()
    }
    
}

extension MainController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath)
        guard let arrayCell = cell as? TableViewCell else { return cell }
        arrayCell.setupCell(weather: list[indexPath.row])
        return arrayCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectCell = list[indexPath.row]
        
        let getWeather = DetailsController(nibName: String(describing: DetailsController.self), bundle: nil)
        getWeather.weather = selectCell
        navigationController?.pushViewController(getWeather, animated: true)
    }
    
}
