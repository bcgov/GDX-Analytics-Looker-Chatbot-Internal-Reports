# Version 1.1.0
view: chatbot_internal_reports {
  sql_table_name: microservice.chatbot_reports ;;

  dimension: conf_score {
    type: string
    sql: ${TABLE}.conf_score ;;
  }

  dimension: sentiment_score {
    type: number
    sql: ${TABLE}.sentiment_score ;;
  }

  dimension: dashboard_id {
    type: string
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: sentiment_magnitude {
    type: number
    sql: ${TABLE}.sentiment_magnitude ;;
  }

  dimension: session_origin {
    type: string
    sql: ${TABLE}.sessionorigin ;;
  }

  dimension: conversation_length {
    type: number
    sql: ${TABLE}.conversation_length ;;
  }

  dimension: conversation_duration {
    type: number
    sql: ${TABLE}.conversation_duration ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: time_fix {
    type: date
    sql: CASE WHEN timestamp <> '' THEN TO_TIMESTAMP(${TABLE}.timestamp,'YYYY-MM-DD HH24:MI:SS') ELSE NULL END;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, minute, minute10, time_of_day, hour_of_day, hour, date, day_of_month, day_of_week, week, month, quarter, year]
    sql: ${time_fix} ;;
  }

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matched_intent ;;
  }

  dimension: training_result {
    type: string
    sql: ${TABLE}.training_result ;;
  }

  dimension: conversation_rating {
    type: string
    sql: ${TABLE}.conversation_rating ;;
  }

  dimension: issue {
    type: string
    sql: ${TABLE}.issue ;;
  }

  measure: row_count {
    type: count
    drill_fields: []
  }

  measure: false_positive_count {
    group_label: "Training Result Counts"
    type: sum
    sql: CASE WHEN training_result = 'False Positive' THEN 1 ELSE 0 END  ;;
  }
  measure: false_negative_count {
    group_label: "Training Result Counts"
    type: sum
    sql: CASE WHEN training_result = 'False Negative' THEN 1 ELSE 0 END  ;;
  }

  measure: ok_count {
    group_label: "Conversation Rating Counts"
    type: sum
    sql: CASE WHEN conversation_rating IN ('OK','ok','Ok','oK') THEN 1 ELSE 0 END  ;;
  }

  measure: negative_count {
    group_label: "Conversation Rating Counts"
    type: sum
    sql: CASE WHEN conversation_rating = 'Negative' THEN 1 ELSE 0 END  ;;
  }

  measure: other_count {
    group_label: "Conversation Rating Counts"
    type: sum
    sql: CASE WHEN conversation_rating NOT IN ('OK','ok','Ok','oK','Negative') THEN 1 ELSE 0 END  ;;
  }}
