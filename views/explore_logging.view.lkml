view: explore_logging {
  sql_table_name: `llm.explore_logging` ;;

  dimension_group: creation_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creation_timestamp ;;
  }
  dimension: llm_result {
    type: string
    sql: ${TABLE}.llmResult ;;
  }
  dimension: model_fields {
    type: string
    sql: ${TABLE}.modelFields ;;
  }
  dimension: thumbs_up_down_none {
    type: number
    sql: ${TABLE}.thumbsUpDownNone ;;
  }
  dimension: user_input {
    type: string
    sql: ${TABLE}.userInput ;;
  }
  measure: count {
    type: count
  }
}
