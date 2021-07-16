# README 

# THE YARKET PLACE 

## I. Introduction 

Welcome! “**The Yarket Place**” is a platform where students can freely exchange their products on/off campus. It was created (1) to utilize used furniture and textbooks; (2) to provide an easy market platform for students; (3) to foster a sense of community among members of the Yale Community. With these purposes in mind, "**The Yarket Place**" is open only to users with Yale email accounts. Hope you enjoy **Yarketing!**

## II. How to install and run this application

1. Clone this repo into your local computer
2. Once you are in the directory, type the following command in your terminal. 
```
bundle install
```
3. This application utilizes [ImageMagick](https://imagemagick.org/), so you may need to run install this software with the following command
- For Mac:
```
brew install imagemagick
```
- For Linux:
```
sudo apt-get install imagemagick
```
4. Type the following command into your terminal
```
rails db:migrate db:seed
```
5. View the application in your browser with
```
rails server
```

## III. License 

Copyright [2021] [Anh Dang, Kyle Andruczk, Taek Jin Han]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.