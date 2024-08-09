# User Signup and Test Script

This repository contains a Bash script that allows users to sign up, set passwords, and take a test. The script ensures secure handling of user data and provides detailed test results.

## Features

- **Signup & Signin:**
  - Secure user registration and login functionality.
  - Checks for existing usernames to prevent duplicates.
  - Ensures passwords match during signup.

- **Test System:**
  - Users can take a test with timed input.
  - Stores user answers and compares them with correct answers.
  - Provides detailed results including correct answers and user performance.

- **Error Handling:**
  - Ensures unique usernames.
  - Verifies password confirmation during signup.

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/Saravanakumar312/user-signup-test-script.git
    cd user-signup-test-script
    ```

2. Run the script:
    ```sh
    ./test_portal.sh
    ```

## Files

- `test_portal.sh`: Main script for user signup, password management, and test-taking.
- `User.csv`: Stores usernames.
- `Password.csv`: Stores passwords.
- `questionbank.txt`: Contains the questions for the test.
- `Correctans.csv`: Stores correct answers for the test.
- `Userans.csv`: Stores user answers during the test.

## Contributing

Feel free to fork this repository and submit pull requests. Any feedback or contributions are welcome!

## License

This project is licensed under the MIT License.

