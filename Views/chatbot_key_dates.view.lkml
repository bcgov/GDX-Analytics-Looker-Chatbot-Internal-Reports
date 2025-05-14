# Version 1.0.0
view: chatbot_key_dates {
  #sql_table_name: microservice.chatbot_keydates ;;
  derived_table: {
    sql: (SELECT 'GOV-COVID' AS which_bot, * FROM microservice.chatbot_keydates)
        UNION ALL
      (SELECT 'GOV-SERVNAV' AS which_bot, * FROM microservice.chatbot_servnavkeydates)
      ;;
  }

  dimension: which_bot {}
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
