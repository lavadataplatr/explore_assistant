connection: "looker_extension_assistant"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: explore_assistant_genai_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: explore_assistant_genai_default_datagroup

explore: headcount {
  label: "Headcount-GenAI"
  join: account_ownership_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${account_ownership_details.account_ownership_key}=${headcount.account_ownership_key} ;;
  }
}


explore: employeeperson_assignment_snapshot {
  label: "Employee Assignment Snapshot - Gen AI"
  join: country_coordinates {
    from: employeeworld_country
    type: left_outer
    sql_on: ${employeeperson_assignment_snapshot.location_country}=${country_coordinates.country_code} ;;
    relationship: one_to_one
  }

  join: performance_review {
    from: performance_review
    type: left_outer
    relationship: one_to_many
    sql_on: ${employeeperson_assignment_snapshot.employee_number} =  ${performance_review.employee_number};;
  }

  join: ta_requisition_region {
    from: ta_requisition_region
    type: left_outer
    relationship: one_to_many
    sql_on: ${employeeperson_assignment_snapshot.country_name} = ${ta_requisition_region.country} ;;
  }
}
