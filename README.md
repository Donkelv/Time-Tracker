### Objective

In this challenge, your task is to retrieve data from an external API and render it like the provided designs. Use Dart and Flutter.

### Brief

Your challenge is to build out this personal time-tracking dashboard. Your task is to build the project to the designs inside the `/design` folder. You will find a mobile version of the design. The design is in JPG static format. Using JPGs will mean that you'll need to use your best judgment for styles such as `font-size`, `padding`, and `margin`. You will find all the required assets in the `/images` folder. The assets are already optimized. Fetch data from the following endpoint:

    https://wookie.codesubmit.io/time-tracking

### Expected behavior

Your users should be able to:

-   [ ] Make sure the design is realised as shown in an Android or iOS simulator 
-   [ ] Switch between viewing Daily, Weekly, and Monthly stats
-   [ ] The text for the previous period's time should change based on the active timeframe. For Daily, it should read "Yesterday" e.g "Yesterday - 2hrs". For Weekly, it should read "Last Week," e.g. "Last Week - 32hrs". It should read "Last Month" for monthly, e.g., "Last Month - 19hrs".

There is also a `style-guide.md` file containing the information you'll need, such as color palette and fonts.

### Extra Credit

If you complete the expected behavior described above you could extend the functionality of the app (in no particular order):

- Allow switching between light and dark mode (use your judgment on sensible colors)
- Add local data persistence to allow offline mode
  - Store result restrieved from given endpoint locally
  - If local data is present, no need to call endpoint for data retrieval
  - Allow adding new data locally (no post endpoint integration)
- Mock data and show trends / development
  - Fake additional data for previous days / weeks / months and show the latest data compared to previous period (e.g. Yesterday 2 hours + 25% compared to day before)
  

### Evaluation Criteria

-   **Dart** best practices
-   Show us your work through your commit history
-   Completeness: did you complete the features?
-   Correctness: does the functionality act in sensible, thought-out ways?
-   Maintainability: is it written in a clean, maintainable way?
-   Testing: is the system adequately tested?

### CodeSubmit

Please organize, design, test, and document your code as if it were going into production - then push your changes to the master branch. After you have pushed your code, you may submit the assignment on the assignment page.

All the best and happy coding!

The aidhere GmbH Team