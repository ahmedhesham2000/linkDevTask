# Project: MVVM Architecture with Cubit State Management and Dio for HTTP Requests

## Objective
This project aims to evaluate the candidate's ability to:
1. Implement the **MVVM (Model-View-ViewModel)** architecture.
2. Validate user inputs effectively.
3. Consume APIs and handle network requests using **Dio**.
4. Manage application state using the **Cubit** state management pattern.

---

## Project Overview
The application is built using Flutter and demonstrates the following key concepts:
- **MVVM Architecture**: Separation of concerns between the UI (View), business logic (ViewModel), and data (Model).
- **Input Validation**: Ensures user inputs are validated before processing.
- **API Consumption**: Fetches data from a RESTful API using **Dio** and handles responses.
- **State Management**: Uses the **Cubit** pattern to manage and update the application state.

---

## Features
1. **User Input Validation**:
   - Validates user inputs (e.g., email, phone, gender, etc.) before submission.
   - Displays appropriate error messages for invalid inputs.

2. **API Integration with Dio**:
   - Consumes a RESTful API using **Dio** to fetch and display data.
   - Handles API errors and displays appropriate feedback to the user.

3. **State Management with Cubit**:
   - Uses **Cubit** to manage the application state.
   - Implements Cubit to handle UI updates based on state changes.

4. **MVVM Architecture**:
   - **View**: UI components (Flutter widgets).
   - **ViewModel**: Mediates between the View and Model, handles business logic.
   - **Model**: Represents the data and interacts with the API.


---

## Getting Started

### Prerequisites
- Flutter SDK installed (version 3.0.0 or higher).
- Dart SDK installed (version 2.17.0 or higher).
- An IDE (e.g., Android Studio, VS Code) with Flutter and Dart plugins.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```
2. Navigate to the project directory:
   ```bash
   cd your-repo-name
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## Key Dependencies
- **flutter_bloc**: For state management using the Cubit pattern.
- **dio**: For making HTTP requests to consume APIs.
- **equatable**: For simplifying equality comparisons in Cubit states.
- **formz**: For form validation (optional).

---

## Usage
1. **Input Validation**:
   - Enter data in the input fields and observe validation messages.
   - Submit the form only when all inputs are valid.

2. **API Consumption with Dio**:
   - The app fetches data from the API using **Dio** and displays it on the screen.
   - Handle loading, success, and error states appropriately.

3. **State Management with Cubit**:
   - Observe how the UI updates based on state changes managed by Cubit.
  
---
## Download the App

### Android (APK) and Ios(IPA)
[[Download](https://drive.google.com/drive/folders/1Xjh14qVRyPn3_wFbnY0X9jyTQ-0FlYsd?usp=sharing)


---

## Contributing
Contributions are welcome! If you find any issues or want to add new features, feel free to open a pull request.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact
For any questions or feedback, please reach out to:
- **Your Name**
- **Email**: your.email@example.com
- **GitHub**: [your-username](https://github.com/your-username)

---

## Acknowledgments
- Special thanks to the Flutter and Dart communities for their excellent documentation and resources.
- Inspiration from [Bloc Library](https://bloclibrary.dev/) for state management.

---

Happy coding! 🚀
