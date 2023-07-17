# Flutter Weather App

Task Description:
Your task is to develop a Flutter weather application that fetches real-time weather data from an API and presents it in a user-friendly interface. The app should provide current weather information, as well as a 5-day forecast for a selected location. You are expected to demonstrate your proficiency in Flutter development, including UI design, data retrieval, and state management.

## Task Requirements:

### User Interface:
- I have designed the app minimally with a flat design and simple layout. Page 0 is the search and pages 1...N display the weather information. Current Page is indicated at the of the screen. 
- Each weather view page displays the current weather conditions, including temperature, weather description, humidity, wind speed, and an appropriate weather icon.
- Page 0 provides a search functionality to allow users to enter a location and fetch weather data for that location.
- Each weather page displays a 5-day forecast with the date, weather icon, and maximum and minimum temperatures for each day.
- Data retreival uses proper logic  to  handle errors, dealing with errors, success and waiting within the UI logic. Returns dummy data to showcase UI if fails. 
- Use of customscrollview and  MediaQuery to manage screen sizes
### Data Retrieval:
- Fetches weather data from  Weatherbit
- Utilize appropriate API endpoints to retrieve current weather data and forecast data.
- Handle API requests and responses appropriately, including error handling and parsing of the received data.
- Ensure the app updates the weather data periodically or allows manual refresh to fetch the latest information. The app updates every minute if there is no data, or every 15 mins if there is. All locations and lat long are stored in Hive so the user can save locations and retrieve the weather data accordingly. The app automatcially finds the users current location for the first screen. 

### State Management:
- Use Getx to handle state. 
- Handle loading, success, and error states when fetching weather data. 
- Implement appropriate state management for UI components, such as handling user interactions and updating the UI based on retrieved data.

### Code Quality:
- Write clean, modular, and maintainable code.
- Implement appropriate separation of concerns (e.g., UI components, data retrieval, state management) - I have implemented MVVM architecture. 
- Follow Flutter best practices and conventions. 
- Properly organise the project structure and use meaningful variable and function names. 
- Add comments to explain complex logic or functionality.

### Testing:
- Write unit tests to ensure the correctness of critical app functionality. Unit tests have been carried out to test API end point.  
- Test the app's state management and handling of different scenarios, such as successful data retrieval, network errors, and invalid location searches. 
- Aim for a reasonable test coverage to demonstrate your testing skills.

Submission Guidelines:

1. Git Repository
2. Include a README file in the repository that explains how to run the app and any additional information you think is relevant.
3. Commit your code regularly with descriptive commit messages.

Completion Time
2 days

Note: Feel free to make assumptions where specific requirements are not mentioned.


### NOTES 
I have completed the basic version of the app, however if I had more time I would have restructure the local storage to just one hive box instead of two. This would be a single box of key: Location and value: latlong. 