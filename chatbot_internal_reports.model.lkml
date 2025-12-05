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

explore: chatbot_new_internal_reports {
  join: chatbot_key_dates {
    sql_on: ${chatbot_new_internal_reports.timestamp_date} = ${chatbot_key_dates.date_date}
        AND ${chatbot_new_internal_reports.which_bot}= ${chatbot_key_dates.which_bot} ;;
    relationship: many_to_one
  }
  sql_always_where: ${timestamp_date} IS NOT NULL ;;
}

explore: chatbot_key_dates {}
