(* Interctive Finance Tracker *)

type log = {
  date : string;
  category : string;
  income_expense : string;
  amount : float;
}

let row_to_log row =
  match row with
  | [date; category; income_expense; amount] ->
      { date; category; income_expense; amount = float_of_string amount }
  | _ -> failwith "Malformed CSV row"

let read_csv filename =
  let csv_data = Csv.load filename in
  List.map row_to_log csv_data


let show_history logs =
  List.iter (fun log ->
    Printf.printf "%s: %s (%s) -> %.2f\n"
      log.date log.category log.income_expense log.amount
  ) logs


let filter_date logs start_date end_date = 
  List.filter (fun log ->
    log.date >= start_date && log.date <= end_date;
  ) logs


let calc_total_expenses logs = 
  List.fold_left (fun acc log ->
    if log.amount < 0.0 then acc -. log.amount else acc  
  ) 0.0 logs


let calc_total_income logs =
  List.fold_left (fun acc log ->
    if log.amount > 0.0 then acc +. log.amount else acc
    ) 0.0 logs


let calc_balance logs = 
  List.fold_left (fun acc log -> acc +. log.amount) 0.0 logs

let process_command logs command = 
  match String.split_on_char ' ' command with
  | ["history"] -> 
    show_history logs
  | ["history_range"; start_date; end_date] -> 
    let filtered_logs = filter_date logs start_date end_date in
    show_history filtered_logs
  | ["expenses"] ->
    Printf.printf "%.2f\n" (calc_total_expenses logs)
  | ["expenses_range"; start_date; end_date] ->
    let filtered_logs = filter_date logs start_date end_date in
    Printf.printf "%.2f\n" (calc_total_expenses filtered_logs)
  | ["income"] ->
    Printf.printf "%.2f\n" (calc_total_income logs)
  | ["income_range"; start_date; end_date] ->
    let filtered_logs = filter_date logs start_date end_date in
    Printf.printf "%.2f\n" (calc_total_income filtered_logs)
  | ["balance"] ->
    Printf.printf "%.2f\n" (calc_balance logs)
  | ["help"] -> 
    Printf.printf "\n"
  | _ -> Printf.printf "unknown command (type 'help' for a list of available commands)\n"


let rec main_loop logs = 
  Printf.printf "\ncommand: ";
  let command = read_line () in
  if command = "exit" then
    Printf.printf("\n")
  else (
    if command = "help" then
      Printf.printf "\
      - history\n\
      - history_range <start_date> <end_date>\n\
      - expenses\n\
      - expenses_range <start_date> <end_date>\n\
      - income\n\
      - income_range <start_date> <end_date>\n\
      - balance\n\
      - exit";
    process_command logs command;
    main_loop logs;
  )
let () =
  let logs = read_csv "large_logs.csv" in
  Printf.printf "WELCOME TO IFT!\n";
  Printf.printf "enter a command (type 'help' for a list of available commands):\n";
  main_loop logs
