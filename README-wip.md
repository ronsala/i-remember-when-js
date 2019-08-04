# I Remember When

I Remember When crowdsources first-hand history, allowing users to read and write memories of events of historical interest.

You can watch a video demo at
<todo>.
For a transcript of the video, see demo_transcript.md.

You can read a blog post about the creation of I Remember When at
<todo>

## Installation

You can either clone the repository directly from GitHub into a local directory on your computer or you can Fork the app so that you can contribute to the code.

Once you Fork or Clone this app, cd into that directory and then execute:

*bash:*

```bash
bundle install
rails db:migrate
```

The app uses the [dotenv-rails gem](https://github.com/bkeepers/dotenv) for an environment variable for security. Create a file in the top level of the directory, with a .env extension. This file should not be checked into a public repository. In this file, set the values you want to ensure user and admin login secrets, which will be accessible in the ENV hash. For example:

*config.env:*

```
SECRET_KEY=YOURSECRETKEYHERE
ADMIN_KEY=YOURADMINKEYHERE
```

Then,

*bash:*

```bash
export SECRET_KEY=YOURSECRETKEYHERE
export ADMIN_KEY=YOURADMINKEYHERE
```

Please note, the included tests specify the ADMIN_KEY as "149162". Either use this value while testing or change the value in the tests in your fork.

## Usage

*bash:*

```bash
rails s
```

Click on the link in your terminal to open the app in your browser.

## Running the tests

*bash:*

```bash
rspec spec
```

## Built With

* [Ruby on Rails](https://rubyonrails.org/)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronsala/i-remember-when. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the I Remember When project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ronsala/quiet-places/blob/master/CODE_OF_CONDUCT.md).

## License

This app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Acknowledgments

* Those who share their memories that we may all benefit from the lessons of history.
* todo photo credits
* PurpleBooth for the [README-Template.md gist](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).
* [Flatiron School](https://flatironschool.com) for instruction and community.
* My spouse for support and reality checking.