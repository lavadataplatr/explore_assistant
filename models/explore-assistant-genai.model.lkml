connection: "looker_extension_assistant"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: explore_assistant_genai_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: explore_assistant_genai_default_datagroup

explore: headcount {
  label: "Beta Headcount(HR)"
  join: account_ownership_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${account_ownership_details.account_ownership_key}=${headcount.account_ownership_key} ;;
  }
}
