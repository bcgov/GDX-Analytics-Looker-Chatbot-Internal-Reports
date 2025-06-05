view: chatbot_servnav_key_dates {
  sql_table_name:microservice.chatbot_servnavkeydates ;;

dimension:text {}
dimension_group: date {
  label: "Key"
  type: time
  timeframes: [raw, date, day_of_month, day_of_week, week, month, quarter, year]
  sql: ${TABLE}.date ;;
}

measure: events {
  type: list
  list_field: text
}
}
