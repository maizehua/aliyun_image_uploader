# Aliyun image uploader

This project implements uploading image file to Aliyun OSS, and have a page to list all the uploaded images.

This site is available at http://maizehua.com


## Development Environment
- ruby 2.5.1
- rails 5.2.0
#### To start this project locally, pull down the code and run:
- `bundle install` (assuming bundler is already installed, otherwise run `gem install bundler` first)
- `bundle exec rails s` and then the rails server should be up on `http://0.0.0.0:3000/`


## Deployment instructions

Run `cap production deploy` locally. <br>
Note that a valid ssh private key paired with the remote ECS instance is needed for this step.
So currently only I can deploy it.

