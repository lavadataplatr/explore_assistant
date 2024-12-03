view: explore_prompts {
  sql_table_name: `llm.explore_prompts` ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: model_explore {
    type: string
    sql: ${TABLE}.model_explore ;;
  }
  dimension: prompt {
    type: string
    sql: ${TABLE}.prompt ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
  }
}
