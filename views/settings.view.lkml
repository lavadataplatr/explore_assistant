view: settings {
  sql_table_name: `llm.settings` ;;

  dimension: config {
    type: string
    sql: ${TABLE}.config ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }
  measure: count {
    type: count
  }
}
