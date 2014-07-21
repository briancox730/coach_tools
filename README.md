# Coach Tools
### A workout program scraper and data/statistic builder

Athletes Tools is a data-gathering app for athletes following a structured athletics program. It was built using Ruby on Rails with charts and graphs delivered by Javascript. It delivers workouts automatically to athletes using HTML parsing with Nokogiri.

URL: http://athletes-tools.herokuapp.com/

Task List:

- [x] Authentication with Devise
  - [x] Admin name spacing
  - [x] User login
- [x] Page Scraping with Nokogiri
- [x] Workout recognition and building
  - [x] Scrapes workout page
  - [x] Spits it down in to "workouts"
  - [x] Build workout to workout relationships
  - [x] Movement relationship and loading on workouts
- [x] Initial database schema
- [x] Personal record percentages
- [x] Program Association
- [x] Workouts that need to be completed show on user show page
  - [x] eg. (This is Squat here are your squat percentages)
- [ ] Automatically classify workouts
- [ ] Build Workout and Athlete statistics and displays
  - [x] Athlete show page
  - [ ] Program show stats
  - [ ] Workout show page
- [ ] Buid movement relation hierarchy
- [ ] Coach Dashboards
- [ ] Like performances
- [ ] Build Friends/Workout partners

#### Mobile First Design (weight breakdown)
![Alt text](/mobile-profile-page.png?raw=true "Profile Page")
#### Comparison Graph on mobile
![Alt text](/mobile-graphs.png?raw=true "Profile Page")
#### Graphing adjustable for different devies
![Alt text](/profile-page.png?raw=true "Profile Page")
#### Schema
![Alt text](/schema.png?raw=true "Schema")
