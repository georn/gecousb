# GeCoUSB

Generators of knowledge, or "GECO" by its acronym in spanish,
is a student group that does life in the Simón Bolívar University in Caracas
, Venezuela.
It's main objective is to facilitate and contribute to the implementation of
spaces where integral academic content can be generated within the university for
the undergraduate level students.

Therefore, it is an organisation for the support and development of students of the
Simón Bolívar University, through the generation and compilation of study content
in different areas. It also seeks to maintains and improve knowledge already acquired
by students in various areas of interest.

The spaces of generation of critical content of the Venezuelan universities have been
declining due to the great political turmoil that has development in the recent years;
therefore, it is necessary to generate a proposal wherever the university that is
responsible for developing information relevant to the growth of the country.
GECO, seeks to be that proposal.

GECO website has been in operation for a couple of years at [Geco](http://gecousb.com.ve/) developed in Wordpress . The current project seeks to make the website of the student group independent from Wordpress it in order to not only keep its current platform but to growth and expand its services to Venezuelan undergraduate students.

## MVP

At first the MVP of this project is settle on avoiding feature regression, so the application needs to do the following:

```

As a student,
so I can study my courses,
I want to find the resources provided by the university community.

As a student,
so I can join GECO,
I want to find information about the student group, members, and projects.

As a student,
so I can assist to Geco's classes
I want to find out information about the schedules for the term.

```

Later on, the project involves giving a platform to teacher's assistant

```
As a teacher's assistant,
So I can give content to my students to study
I want to be able to upload new posts with content related to the course.

```

## Tech Stack
- Ruby on Rails
- RSpec
- Capybara
- Factory Girl
- Faker
- Postgresql
- HTML, CSS, Sass
- Bootstrap 4
- Google API

# Progress

## Model

At the early stage of the project it was set the structure of the models to be needed and their relationship to each other based on the requirements.

![Gecousb model](/gecousb-model-updated.jpg)

This shows that the web application will have users that are going to be able to have *many Post* and *many Terms*. This is because at latter stages, users, or university students, will have the ability to make their own guides and continue to grow the available content at the disposal of the university and future cohorts as well as the ability to track down their performance at ease.

Courses is another central piece of the web application, Geco has been gathering university content such as guides, exams, practice through years and putting them at the disposal of the university community for the practice and improvement students. The content has been organise and stored in a Google Drive.

The model was throughly tested given that them and their relationship represented the backbone of the application. For it, not only [testing validations](https://github.com/thoughtbot/shoulda-matchers) were used to make sure the entries were right but also [testing the factories](https://robots.thoughtbot.com/testing-your-factories-first) and the use of [Faker](https://github.com/stympy/faker) was immensely useful at this early stage.

At latter stages, Events or Classes will be introduced to develop a calendar feature that will be used to announce the Geco classes made by students for students. This is currently being done via Twitter.

At an early stage the [Clearance Gem](https://github.com/thoughtbot/clearance/) was used to set Users but it is important to latter separate this model to incorporate Administrator who will take care to curate the guides made by students to maintain quality as well as set the schedule for classes Geco schedule during the terms.

## Style

For the styling of the website [Bootstrap 4 beta](https://github.com/twbs/bootstrap-rubygem), in order to take advantage of the grid system, responsiveness and new features such as [cards](https://v4-alpha.getbootstrap.com/components/card/). Given that the application is built on Rails, Sass comes by default and the new Bootstrap uses Sass as main preprocessor. It adds to the use of the Asset Pipeline and partials that are used through the application.

Additionally the project also uses [Font Awesome](http://fontawesome.io/) for awesomeness.

This may give the application that Bootstrap-ish look, but, hey, I'm not a designer.

### Homepage
![Geco homepage](/geco-homepage.jpeg)

### Courses
![Geco Courses](/geco-courses-cards.jpeg)

The image shows the gathering of the title from the courses in the Google Drive of Geco.


## Drive

The drive implementation represented a challenge while theres documentation about the Google Client API there is not much regarding how to implement it to Rails. The [API for Ruby is on Alpha](https://developers.google.com/api-client-library/ruby/) meaning that heres not much support either, except the one given by Rubyst.
