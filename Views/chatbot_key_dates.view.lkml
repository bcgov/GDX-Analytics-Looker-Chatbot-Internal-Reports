# Version 1.0.0
view: chatbot_key_dates {
  sql_table_name: microservice.chatbot_keydates ;;

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
