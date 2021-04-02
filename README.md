# Tiny Tune Scraper - iTunes Games Web Scraper (Microverse Ruby Capstone Project)

![Microverse](https://img.shields.io/badge/-Microverse-007bff?style=for-the-badge)


## Description
This a mini console scraper application for iTunes App store games, developed using Ruby. The scraping source is [Apple iTunes App Store games website](https://apps.apple.com/us/genre/ios-games/id6014). Contents under the iTunes App Store games are categorized according to Most Popular, Alphabetical index and more games. In a similar way, running the TinyTuneScraper app you can choose a sorted list to to scrape its content. See a quick video of the project walkthrough [here](https://www.loom.com/share/efecaf78d234412fb2a0e8d3b3113e3b)
<p align="center">
  <img src="assets/screenshot_1.jpg">
</p>


## Library Directory 📙

| Contents                  |
| ------------------------- |
| [App Screenshots](#app-screenshots) |
| [Built With](#built-with)   |
| [Setup Instructions](#setup-instructions)   |
| [Testing](#testing)   |
| [Author](#author)       |
| [License](#license)       |


## App Screenshots
| |
|:-------------------------:|
| <img width="800" alt="Welcome screen screenshot" src="assets/screenshot_2.jpg"> <p align="center"> Welcome screen/ Instructions <p>|
| <img width="800" alt="Porpular scrape screenshot" src="assets/screenshot_3.jpg"> <p align="center"> Porpular scrape</p>|
| <img width="800" alt="Aphabetical scrape screenshot" src="assets/screenshot_4.jpg"> <p align="center"> Aphabetical scrape  </p> |


## Built With

- Ruby 2.7
- Nokogiri 1.10.10
- HTTParty 0.18.1
- Rubocop 0.88.0
- Rspec 3.9.0


## Setup Instructions

1. - Copy the git link `https://github.com/rloterh/TinyTuneScraper.git` of this project
2. - In your terminal run the command `git clone https://github.com/rloterh/TinyTuneScraper.git`
3. - Navigate to the cloned project directory
4. - Install dependencies using the command `bundle install`
5. - You can optionally install the dependencies individually in your ruby environment using the commands below:
  - `gem install nokogiri`
  - `gem install httparty`
  - `gem install rubocop`
  - `gem install rspec`


### Getting Started
1. - Navigate the *bin* directory by running the command `cd bin` in the terminal (from the root directory)
2. - To execute the app  run the command `ruby main.rb` in the terminal
3. - Follow the instruction displayed in the terminal below the welcome screen
4. - Type `pop`, `more` or a letter between `|a-z|`
5. - If the scrape output has has index pages option, use **_>_** or **_<_** keys on your keyboard to navigate to the next or previous indexed page
6. - To exit index page(s), press 'e'


## Testing

__NB:__ Before running test ensure `rubocop` and`rspec` gems are installed
 

### Validating Ruby Syntax & Coding Standard

1. - Go to the terminal (directory pointing to the root of the project)
2. - Run the command `rubocop`
3. - Click on the check button to validate
4. - All validations should pass, when no error message is displayed in the terminal 

### Running Test Cases

1. - Go to the terminal (directory pointing to the root of the project)
2. - Run the command `rspec`
3. - To run test cases individually run the command `rpsec relative_path_of_testfile`
     <br>(replace rerelative_path_of_testfile with the actual relative path to the test file you want to run)
4. - All test cases passes, when no error message is shown in the terminal


## Author

### 👨‍💻 Robert Loterh

[![GitHub](https://img.shields.io/badge/-GitHub-000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/rloterh) <br>
[![LINKEDIN](https://img.shields.io/badge/-LINKEDIN-0077B5?style=for-the-badge&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/robert-loterh/) <br>
[![EMAIL](https://img.shields.io/badge/-EMAIL-D14836?style=for-the-badge&logo=Mail.Ru&logoColor=white)](mailto:rloterh@gmail.com) <br>
[![TWITTER](https://img.shields.io/badge/-TWITTER-1DA1F2?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/RLoterh) <br>



## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/rloterh/TinyTuneScraper/issues/new).


## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Scrape source is [Apple iTunes App Store](https://apps.apple.com)
- Project specification designed by [Microverse](https://www.microverse.org/)


### License

![Cocoapods](https://img.shields.io/cocoapods/l/AFNetworking?color=red&style=for-the-badge)
