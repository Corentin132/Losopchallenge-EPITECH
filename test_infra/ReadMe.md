---

# Load Test for lostoptchallenge.com

This bash script is designed to perform a load test on the website lostoptchallenge.com by sending repetitive GET requests to the /api/counter/add API endpoint.

## Usage

1. Make sure you have curl installed on your system.

2. Run the bash script `load_test.sh` using the following command:
    ```bash
    ./test_charge.sh
    ```

3. The script will send GET requests in a loop to the specified API endpoint.

## Customization

If you want to customize the test or go further, you can:

- Modify the number of instances by adjusting the value of the while loop.
- Modify the curl request headers according to the test requirements.
- Use tools like Gobuster or FFuF to further explore the application.

## Adding Gobuster or FFuF

You can integrate the use of Gobuster or FFuF for deeper exploration of the website. Here's how to do it:

1. Install Gobuster or FFuF on your system, following the instructions provided in their respective documentation.

2. Use one of the following commands to run Gobuster or FFuF and explore the website's resources:
    ```bash
    gobuster dir -u https://lostoptchallenge.com -w /path/to/wordlist.txt
    ```
    or
    ```bash
    ffuf -w /path/to/wordlist.txt -u https://lostoptchallenge.com/FUZZ
    ```

Make sure to replace `/path/to/wordlist.txt` with the path to your own wordlist, and adjust the tool parameters according to the specific needs of your load test.

---
