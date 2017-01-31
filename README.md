# Astro Web

###*QA Assignment*

This QA assignment will cover Level 1 and 2 as described.

####*QA Level 1*
This will technically test the performance and loading time of a website, in this release:
* Verify page loads within 0.1s, this test would fail and needed info will be logged in failuretracker folder.
* Verify page loads within 5s
* Verify page loads completely
* Page Load time will be printed in terminal every time user visits the page 
* Iterating all links in Homepage and verify there are none of links will return non 200 header respond
* Details of which link returns what response code will be printed in terminal

####*QA Level 2*
Determine the sequence of the promotion called “Auto-Debit Campaign”
* Verify the “Auto-Debit Campaign” should not be in third
* Verify the “Auto-Debit Campaign” should not be in last
* Click "Auto-Debit Campaign" and follow the site to signup new account


This automation task uses Watir Webdriver (Selenium) and follows Page Object pattern.

We could add more TCs by adding related TCs to *.feature files. 
For instance, you have 6 TCs related to homepage feature, just simply add them to homepage.feature file.

For debug purpose, this quite easy to do so, you can either 

. *Adding this line to anywhere you want to debug*
```ruby
binding.pry
```

. *If using any IDE, such as RubyMine, putting an breakpoint and executing as debug mode*

###*Project Layout*

* config/config.yml : Data set
* features/*.feature : cucumber features
* features/step_definitions/steps.rb : generic steps that apply to all features
* features/support/env.rb : configures gems to use
* features/support/pages : the pages which are related to automation tests
* failuretracker: stores the info (screenshot/html file) when any TC is failed

###*Prerequisites*

* Ruby http://www.ruby-lang.org/en/downloads/
* Ruby Gems http://rubygems.org/
* Bundler: 
```ruby
gem install bundler rake
```

###*Configuration*
```ruby
bundle install
```
###*Running Features*

To run a specific feature, for instance: homepage.feature, you can either:

. *Using terminal: after navigating to astro_web/ directory*
```
cucumber features/homepage.feature
```

. *Using IDE such as RubyMine, click on search.feature file and choose "Run homepage.feature" on the context menu*
