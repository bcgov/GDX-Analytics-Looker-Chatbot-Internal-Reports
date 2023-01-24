# Version 1.2.1
connection: "redshift_pacific_time"
# Set the week start day to Sunday. Default is Monday
week_start_day: sunday

include: "/Views/*"                # include all views in the views/ folder in this project

explore: chatbot_internal_reports {
  join: chatbot_key_dates {
    sql_on: ${chatbot_internal_reports.timestamp_date} = ${chatbot_key_dates.date_date} ;;
    relationship: many_to_one
    }
}
explore: chatbot_key_dates {}
