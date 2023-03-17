# Chart Project README

<img width="809" alt="image" src="https://user-images.githubusercontent.com/5871505/225914687-48d584fd-e27b-40bc-8e1f-038f97b10061.png">

## Setup

The data is stored in `lib/seeds`.

Run `rails db:seed` to populate the data model.

## Running in Development

Use `foreman start --procfile=Procfile.dev` to spin up the Rails server and start the TailwindCSS watch process.

## Application Usage

The application will grab the minimum and maximum timestamps from the `DataPoint` collection and that will populate the `start` and `end` time input boxes.

An update to the `input` box (`change` event) will trigger a query and pull in the relevant points and create chart.

## Chart Usage

The chart is able to be zoomed in/out using a mouse wheel or pinch/pull motion.

It is suggested to take the end time and subtract a little time to put as the start time.  This is a easier way to render a smaller chart (dataset is 90k+ points).  For example, `2104-02-02T09:03:35.346Z` start time and `2104-02-02T10:02:35.818Z` end time will create a nice looking chart.

## Technologies Utilized

This project uses Rails 7 and Chart.js.  They are joined together using Stimulus (see `app/javascript/controllers/index_controller.js`).  The `annotate` gem is used to generate comments especially for the `DataPoint` model.  The styling is done using `TailwindCSS` that is optionally integrated with Rails 7.

## Improvement Options

There are several areas of opportunity to improve.  The queries are not optimized and will return the whole dataset given the chance.  The Chart.js application can seemingly handle all the points, but it generates a huge mess of unreadable data (hence not autoloading data up front).

Caching would be nice for some of the queries and views although they're both pretty sparse.

Testing would be a huge plus to add.  However, as this is done on limited time and Stimulus and Chart.js were learned on the fly with it, testing took a huge backseat to it.

The Api layer could use a lot more figuring out especially if there are more endpoints and data being added eventually.

The UI/UX is not great and could use a little love.  While functional, the inputs and chart do not really tell a functional story.  The chart display could be more accessible and provide better 'curb appeal' to intrigue users more.

The Chart itself and data being present could be modified to better show a visual story.  Generally, there could be fixed 'zoom levels' in the data where the Chart presentation would look better and the data be limited or generalized down (reduce points and/or interpolate and reduce) to be limited as to not clutter.  While generalizing data down might not be the best for data integrity, there may be so many points that any story would be lost without it.

Lastly, there is not a robust (or any) system of error handling and logging.  Errors are presented in either the `foreman` terminal instance or in the dev console on your web browser.  Better UI could allow for a `notice` banner for better communication to the user.
