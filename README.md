# Interactive Finance Tracker

---

## **Overview**

The **Interactive Finance Tracker** is a command-line, terminal-based application designed to process personal spending stored in CSV format. It provides users with statistics about their income, expenses, and balance. Users can choose which statistic to display using specific commands.

---

## **Functionalities**

1. **View Complete Transaction History**
   - Displays all financial transactions from the input CSV file in chronological order.

2. **View Transactions Within a Date Range**
   - Filters and displays transactions in given time interval.

3. **Calculate Total Income**
   - Computes the total income recorded in the financial log.

4. **Calculate Income Within a Date Range**
   - Calculates the total income in given time intercal.

5. **Calculate Total Expenses**
   - Computes the total expenses recorded in the financial log.

6. **Calculate Expenses Within a Date Range**
   - Calculates the total expenses in given time interval.

7. **Calculate Net Balance**
   - Computes the overall balance by summing all income and expenses.

---

## **Setup**

1. **Prerequisites**
   - Install **OCaml** on your system:
     - Follow [this guide](https://cs3110.github.io/textbook/chapters/preface/install.html) for installation instructions.
   - Install the **Csv** library for OCaml:
     ```bash
     opam install csv
     ```

2. **Clone the Repository**
   - Clone the repository containing the source code:
     ```bash
     git clone https://github.com/Kezak1/Interactive-Finance-Analyzer.git
     cd Interactive-Finance-Analyzer
     ```

3. **Build the Project**
   - The project uses **Dune** for building and running. Install Dune if not already installed:
     ```bash
     opam install dune
     ```
   - Build the project:
     ```bash
     dune build
     ```

---

## **Running the Program**

1. **Prepare the CSV File**
   - Ensure your CSV file follows this structure:
     ```csv
     date,category,income_expense,amount
     ```
     e.g.
     ```csv
     2023-01-01,Salary,income,5000
     2023-01-05,Groceries,expense,-150
     2023-01-10,Utilities,expense,-100
     ```

2. **Execute the Program**
   - Run the program using Dune:
     ```bash
     dune exec main.exe
     ```

3. **Interact Using Commands**
   - Example interaction:
     ```
     WELCOME TO IDT!
     Enter a command (type 'help' for a list of available commands):
     > history
     2023-01-01: Salary (income) -> 5000.00
     2023-01-05: Groceries (expense) -> -150.00
     2023-01-10: Utilities (expense) -> -100.00
     ```

---

## **Command Calls**

1. **history**
   - Displays all financial transactions in chronological order.

2. **history_range <start_date> <end_date>**
   - Displays transactions occurring within the specified date range.

3. **expenses**
   - Displays the total expenses.

4. **expenses_range <start_date> <end_date>**
   - Displays the total expenses within the specified date range.

5. **income**
   - Displays the total income.

6. **income_range <start_date> <end_date>**
   - Displays the total income within the specified date range.

7. **balance**
   - Displays the current balance.

### Note:
- Date format does not have to be strictly YYYY-MM-DD.
- Users can omit MM-DD to specify a year range (e.g., 2023 to 2024).
- Similarly, users can specify only YYYY-MM for monthly filtering.

---

## **Example Commands**

1. **Show Full Transaction History**
   - Input: `history`
   - Output:
     ```
     2023-01-01: Salary (income) -> 5000.00
     2023-01-05: Groceries (expense) -> -150.00
     2023-01-10: Utilities (expense) -> -100.00
     ```

2. **Show History for a Date Range**
   - Input: `history_range 2023-01-01 2023-01-31`
   - Output:
     ```
     2023-01-01: Salary (income) -> 5000.00
     2023-01-05: Groceries (expense) -> -150.00
     2023-01-10: Utilities (expense) -> -100.00
     ```

3. **Calculate Total Income**
   - Input: `income`
   - Output:
     ```
     5000.00
     ```

4. **Calculate Income for a Date Range**
   - Input: `income_range 2023-01-01 2023-01-31`
   - Output:
     ```
     5000.00
     ```

5. **Calculate Total Expenses**
   - Input: `expenses`
   - Output:
     ```
     250.00
     ```

6. **Calculate Expenses for a Date Range**
   - Input: `expenses_range 2023-01-01 2023-01-31`
   - Output:
     ```
     250.00
     ```

7. **Calculate Net Balance**
   - Input: `balance`
   - Output:
     ```
     4750.00
     ```

---

## **Future Enhancements**

- Implementing analytics such as spending trends and anomaly detection.
- Adding visualizations for income and expense trends.
- Expanding filtering capabilities, e.g., by category or amount thresholds.

