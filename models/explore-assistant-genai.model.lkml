connection: "looker_extension_assistant"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: explore_assistant_genai_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: explore_assistant_genai_default_datagroup
