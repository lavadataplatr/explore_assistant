view: headcount {
  sql_table_name:`EdwBI.Employee-HeadCountDailyHR`;;

#************************************************************ String Dimensions ***************************************#

  dimension: key {
    type: string
    sql: ${TABLE}.RowNumber;;
    primary_key: yes
    hidden: yes
  }

  dimension: employment_category {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.EmploymentCategory;;
  }

  dimension: gender {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.Gender;;
  }

  dimension: gcalevel {
    label: "GCA Level"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.GCALevel;;
  }

  dimension: job_name {
    label: "GCA Band"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.JobName;;
  }

  dimension: job_title {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.JobTitle;;
  }

  dimension: technical {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.Technical;;
  }

  dimension: voluntary_termination_status {
    view_label: "Attrition"
    label: "Term Category (Voluntary/Involuntary) Flag"
    type: string
    sql: ${TABLE}.VoluntaryTerminationStatus;;
  }

  dimension: term_reason {
    view_label: "Attrition"
    type: string
    sql: ${TABLE}.TermReason;;
  }

  dimension: segment {
    view_label: "Account Ownership"
    type: string
    sql: ${TABLE}.Segment;;
  }

  dimension: job_family {
    view_label: "Employee"
    description: "Agent/G&A"
    type: string
    sql: ${TABLE}.JobFamily;;
  }

  dimension: management_level {
    label: "Manager Level"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.ManagementLevel;;
  }

  dimension: staffing_ratio {
    label: "Job Staff Ratio"
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.StaffingRatio;;
  }

  dimension: cost_hr_location {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.CostingHRLocation;;
  }

  dimension: ethnicity {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.Ethnicity;;
  }

  dimension: country_name {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.CountryName;;
  }

  dimension: business_region_description {
    label: "Region"
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.BusinessRegionDescription;;
  }

  dimension: employee_number {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.EmployeeNumber;;
  }

  dimension: first_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.FirstName;;
  }

  dimension: last_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.LastName;;
  }

  dimension: middle_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.MiddleName;;
  }

  dimension: pay_basis {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.PayBasis;;
  }

  dimension: organization_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.OrganizationName;;
  }

  dimension: organization_code {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.OrganizationCode;;
  }

  dimension: location_id {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.LocationId;;
  }

  dimension: location_name {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.LocationName;;
  }

  dimension: site_hr_location {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.SiteHrLocation;;
  }

  dimension: cost_client_code {
    label: "Cost Client Code"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostingClientCode;;
  }

  dimension: cost_client_description {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostingClientDescription;;
  }

  dimension: cost_client_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostClientName;;
  }

  dimension: program_code {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.ProgramCode;;
  }

  dimension: program_name {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.ProgramName;;
  }

  dimension: project_code {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.ProjectCode;;
  }

  dimension: project_name {
    view_label: "Client Profile"
    type: string
    sql: ${TABLE}.ProjectName;;
  }

  dimension: job_code {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.JobCode;;
  }

  dimension: assignment_category {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.AssignmentCategory;;
  }

  dimension: assignment_status {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.AssignmentStatus;;
  }

  dimension: cost_location_code {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostingLocationCode;;
  }

  dimension: cost_location_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostingLocationName;;
  }

  dimension: cost_department_name {
    label: "Cost Department Name"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.CostDepartmentName;;
  }

  dimension: cost_department_code {
    view_label: "Employee"
    label: "Cost Department Code"
    type: string
    sql: ${TABLE}.CostingDepartmentCode;;
  }

  dimension: legal_employer {
    label: "GRE"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.LegalEmployer;;
  }

  dimension: flsa_status {
    label: "FLSA"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.FlsaStatus;;
  }

  dimension: psaflag {
    view_label: "Employee"
    label: "PSA FLAG"
    description: "The mapped PSA in the employee’s Oracle Profile – Assignment Form"
    type: string
    sql: ${TABLE}.PSAFlag;;
  }

  dimension: ec1_name {
    view_label: "Employee"
    type: string
    label: "EC1 Name"
    sql: ${TABLE}.EC1Name;;
  }

  dimension: ec2_name {
    view_label: "Employee"
    type: string
    label: "EC2 Name"
    sql: ${TABLE}.EC2Name;;
  }

  dimension: ec3_name {
    view_label: "Employee"
    type: string
    label: "EC3 Name"
    sql: ${TABLE}.EC3Name;;
  }

  dimension: ec4_name {
    type: string
    label: "EC4 Name"
    view_label: "Employee"
    sql: ${TABLE}.EC4Name;;
  }

  dimension: ec5_name {
    type: string
    label: "EC5 Name"
    view_label: "Employee"
    sql: ${TABLE}.EC5Name;;
  }

  dimension: state {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.State;;
  }

  dimension: work_arrangement {
    label: "Work Arrangment Type"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.WorkArrangement;;
  }

  dimension: work_arrangement_reason {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.WorkArrangementReason;;
  }

  dimension: veteran_status_definition {
    view_label: "Employee"
    label: "Protected Veteran Status"
    type: string
    sql: ${TABLE}.VeteranStatusDefinition;;
  }

  dimension: supervisor1_oracle_id {
    view_label: "Employee"
    label: "New Supervisor Employee ID"
    type: string
    sql: ${TABLE}.Supervisor1OracleId;;
  }

  dimension: supervisor1_name {
    view_label: "Employee"
    label: "New Supervisor Name"
    type: string
    sql: ${TABLE}.Supervisor1Name;;
  }

  dimension: new_supervisor_location_code {
    view_label: "Employee"
    label: "New Supervisor Location Code"
    type: string
    sql: ${TABLE}.NewSupervisorLocationCode;;
  }

  dimension: previous_supervisor_employee_id {
    view_label: "Employee"
    label: "Previous Supervisor Employee ID"
    type: string
    sql: ${TABLE}.PreviousSupervisorEmployeeID;;
  }

  dimension: previous_supervisor_name {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.PreviousSupervisorName;;
  }

  dimension: person_id {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.PersonID;;
  }

  dimension: person_gu_id {
    view_label: "Employee"
    label: "Person GU ID"
    type: string
    sql: ${TABLE}.PersonGuId;;
  }

  dimension: manager_turnover_distinct_supervisors {
    label: "Manager Turnover/Distinct Supervisors"
    view_label: "Employee"
    type: string
    sql: ${TABLE}.ManagerTurnoverDistinctSupervisors;;
  }

  dimension: account_ownership_key {
    hidden: yes
    type: string
    sql: ${TABLE}.AccountOwnershipKey;;
  }

  dimension: sub_function {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.SubFunction;;
  }

  dimension: registered_disabled {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.RegisteredDisabled;;
  }

  dimension: default_department_code {
    hidden: yes
    view_label: "Employee"
    type: string
    sql: ${TABLE}.DefaultDepartmentCode;;
  }

  dimension: default_client_code {
    #hidden: yes
    view_label: "Employee"
    type: string
    sql: ${TABLE}.DefaultClientCode;;
  }

  dimension: assignment_type {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.AssignmentType;;
  }

  dimension: business_group_id {
    view_label: "Employee"
    type: string
    sql: ${TABLE}.BusinessGroupId;;
  }


  #****************************************************** Number Dimensions ***********************************************************#

  dimension: system_id {
    view_label: "Account Ownership"
    type: number
    sql: ${TABLE}.SystemID;;
  }

  dimension: head_count {
    hidden: yes
    type: number
    sql: ${TABLE}.headCount;;
  }



  #******************************************* Boolean/Yes-No Dimensions **************************************************#

  dimension: attrition_impacting_ind {
    type: yesno
    hidden: yes
    view_label: "Attrition"
    sql: ${TABLE}.AttritionImpactingInd;;
  }

  dimension: is_weekly {
    type: string
    sql: CASE WHEN ${TABLE}.IsWeekly = 1 THEN 'Yes' else 'No' end;;
  }

  dimension: is_monthly {
    type: string
    sql: CASE WHEN  ${TABLE}.IsMonthly = 1 THEN 'Yes' else 'No' end;;
  }

  dimension: is_quarterly {
    type: string
    sql: CASE WHEN ${TABLE}.IsQuarterly = 1 THEN 'Yes' else 'No' end;;
  }

  dimension: is_yearly {
    type: string
    sql: CASE WHEN ${TABLE}.IsYearly = 1 THEN 'Yes' else 'No' end ;;
  }

  #*************************************** Date/Time Dimensions ******************************************************************#

  dimension_group: original_hire_date {
    label: "Original Hire"
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.OriginalHireDate;;
  }

  dimension_group: hire {
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.HireDate;;
  }

  dimension_group: adjusted_service {
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.AdjustedServiceDate;;
  }

  dimension_group: production_start {
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.ProductionStartDate;;
  }

  dimension_group: termination {
    view_label: "Attrition"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.TerminationDate;;
  }

  dimension_group: effective_start {
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.EffectiveStartDate;;
  }

  dimension_group: effective_end {
    view_label: "Employee"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.EffectiveEndDate;;
  }

  dimension_group: calendar {
    view_label: "Calendar"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.CalendarDate;;
  }


  #********************************************************** Custom Dimensions **********************************************************#

  dimension:term_filter {
    hidden: yes
    description: ""
    type: string
    sql: case when  ${termination_date} = ${calendar_date} then 'Yes' else 'No' end;;
  }

  dimension:hire_filter {
    hidden: yes
    description: ""
    type: string
    sql: case when ${hire_date} = ${calendar_date} then 'Yes' else 'No' end;;
  }

  dimension: prod_flag {
    type: string
    view_label: "Attrition"
    label: "Production/Pre-Production Flag"
    sql: CASE WHEN ${job_family} = 'G&A' then 'Production' WHEN ${job_family} = 'Agent' THEN
        (CASE WHEN ${hire_date} = ${calendar_date} OR ${calendar_date}  < ${production_start_date} THEN  'Non-Production' ELSE 'Production' END )
         ELSE 'Production' END;;
  }

  dimension: impacting_non_impacting{
    type: string
    hidden: no
    label: "Attrition Category (Impacting\Non impacting)"
    view_label: "Attrition"
    sql:  case when CAST(${attrition_impacting_ind} as string)  = 'true' then 'Impacting' else 'Non-Impacting' end ;;
  }

  dimension: hire_prod_bucket {
    label: "Hire to Termination Tires"
    view_label: "Employee"
    type: string
    hidden: yes
    sql:   CASE WHEN (DATE_DIFF(${termination_date},${hire_date}, day)) <= 30 THEN 'First 30 Days'
          When (DATE_DIFF(${termination_date},${hire_date}, day)) <= 90 THEN 'First 90 Days'
          When ABS(DATE_DIFF(${termination_date},${hire_date}, day)) <= 180 THEN 'First 180 Days'
          When ABS(DATE_DIFF(${termination_date},${hire_date}, day)) = 365 THEN '365 Days' ELSE "More Than 365 Days" END;;
  }

  dimension: age_tires_sort_order {
    hidden: yes
    view_label: "Employee"
    type: string
    sql:SPLIT(${TABLE}.AgeBracket, '.')[OFFSET(0)] ;;
  }

  dimension: age_tires {
    label: "Age Tiers"
    view_label: "Employee"
    type: string
    sql:case when ${TABLE}.AgeBracket LIKE '%.%' then RIGHT(${TABLE}.AgeBracket, LENGTH(${TABLE}.AgeBracket) - 2) else ${TABLE}.AgeBracket end;;
    order_by_field: age_tires_sort_order
  }

  dimension: tenure_in_days {
    label: "Employee Tenure in days"
    view_label: "Employee"
    type: number
    sql:date_diff(IFNULL(${termination_date},current_date()),${hire_date},Day);;
  }

  dimension: tenure_in_months {
    label: "Employee Tenure in months"
    view_label: "Employee"
    type: number
    sql:date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH);;
  }

  dimension: tenure_in_years {
    label: "Employee Tenure in years"
    view_label: "Employee"
    type: number
    sql:date_diff(IFNULL(${termination_date},current_date()),${hire_date},YEAR);;
  }

  dimension:tenure_group_bucket {
    label: "Employee Tenure Tiers"
    # hidden: yes
    view_label: "Employee"
    description: " "
    case: {
      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},Day)  >=0 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},Day)  <=30;;
        label: "Between 0 to 30 Days"
      }

      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},Day)  >=31 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},Day)  <=60;;
        label: "Between 31 to 60 Days"
      }
      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH) >=0 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH) <=3;;
        label: "Between 0 to 3 Months"
      }
      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH)  >=4 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH)  <=6;;
        label: "Between 4 to 6 Months"
      }
      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},MONTH)  >=7 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},YEAR) <=1;;
        label: "Between 7 to 1 Years"
      }

      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},YEAR)  >=1 and date_diff(IFNULL(${termination_date},current_date()),${hire_date},YEAR)  <=2;;
        label: "Between 1 to 2 Years"
      }
      when: {
        sql: date_diff(IFNULL(${termination_date},current_date()),${hire_date},YEAR)  > 2;;
        label: "Greater Than 2 Years "
      }

    }
  }

  dimension: boomerangs_rehires {
    hidden: yes
    view_label: "Employee"
    type: string
    sql: CASE WHEN ${termination_date}  is NOT NULL AND (${hire_date} = ${calendar_date}) THEN ${employee_number} ELSE NULL END;;
  }


  dimension: gl_client_code {
    view_label: "Client Profile"
    label: "GL Client Code"
    type: string
    sql: case when ${TABLE}.DefaultClientCode ="" then ${TABLE}.CostingClientCode else ${TABLE}.DefaultClientCode  end;;
  }

  dimension: gl_client_name {
    view_label: "Client Profile"
    description: "General Ledger Client Name"
    label: "GL Client Name"
    type: string
    sql: CASE WHEN ${cost_client_description} is null THEN concat (${cost_client_code}, " - ", ${cost_client_description})  ELSE ${cost_client_description} END;;
  }

  #************************************************************** Measures ***************************************************************#

  measure: headcount_daily {
    label: "Headcount Daily"
    type: sum
    view_label: "Headcount"
    sql: ${head_count};;
    drill_fields: [detail*]
  }

  measure: number_of_days {
    label: "Number of Days"
    type: count_distinct
    view_label: "Headcount"
    sql: ${calendar_date};;
  }

  measure: average_daily_headcount {
    label: "Average Daily Headcount"
    type: number
    view_label: "Headcount"
    sql: ${headcount_daily}/NULLIF(${number_of_days},0);;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: hired_count {
    label: "Total Hired - Count"
    type: count_distinct
    view_label: "Headcount"
    sql: ${employee_number};;
    filters: [hire_filter: "Yes"]
  }

  measure: total_headcount_distinct {
    label: "Total Distinct Headcount"
    type: count_distinct
    view_label: "Headcount"
    sql: ${employee_number};;
  }

  measure: terminations {
    type: count
    label: "Prod Terminations- Count"
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [prod_flag: "Production",term_filter: "Yes"]
  }

  measure: total_terminations {
    type: count
    label: "Total Terminations - Count "
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [term_filter: "Yes"]
  }

  measure: impacting_terminations {
    type: count
    label: "Prod Terminations(Impacting) - Count"
    view_label: "Attrition"
    filters: [prod_flag: "Production",term_filter: "Yes",impacting_non_impacting: "Impacting"]
    drill_fields: [detail*]
  }

  measure: nonimpacting_terminations {
    type: count
    label: "Prod Terminations(Non-Impacting) - Count"
    view_label: "Attrition"
    filters: [prod_flag: "Production",term_filter: "Yes",impacting_non_impacting: "Non-Impacting"]
    drill_fields: [detail*]
  }

  measure: voluntary_terminations {
    type: count
    label: "Prod Terminations(Voluntary) - Count"
    view_label: "Attrition"
    filters: [prod_flag: "Production",term_filter: "Yes",voluntary_termination_status: "Voluntary"]
    drill_fields: [detail*]
  }

  measure: involuntary_terminations {
    type: count
    label: "Prod Terminations(Involuntary) - Count"
    view_label: "Attrition"
    filters: [prod_flag: "Production",term_filter: "Yes",voluntary_termination_status:"Involuntary"]
    drill_fields: [detail*]
  }

  measure: terminations_first_30_days {
    type: count
    label: "Prod Terminations(First 30 Days) - Count"
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [prod_flag: "Production",term_filter: "Yes",hire_prod_bucket: "First 30 Days"]
  }

  measure: terminations_first_90_days {
    type: count
    label: "Prod Terminations(First 90 Days) - Count"
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [prod_flag: "Production",term_filter: "Yes",hire_prod_bucket: "First 90 Days"]
  }

  measure: terminations_first_180_days {
    type: count
    label: "Prod Terminations(First 180 Days) - Count"
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [prod_flag: "Production",term_filter: "Yes",hire_prod_bucket: "First 180 Days"]
  }

  measure: terminations_365_days {
    type: count
    label: "Prod Terminations(365 Days) - Count"
    view_label: "Attrition"
    drill_fields: [detail*]
    filters: [prod_flag: "Production",term_filter: "Yes",hire_prod_bucket: "365 Days"]
  }

  measure: boomerangs {
    type: count_distinct
    view_label: "Employee"
    label: "Boomerangs/Rehires"
    sql: ${boomerangs_rehires};;
  }


  set: detail {
    fields: [
      key,
      system_id,
      assignment_type,
      gender,
      gcalevel,
      job_name,
      job_title,
      term_reason,
      segment,
      job_family,
      management_level,
      staffing_ratio,
      ethnicity,
      country_name,
      business_region_description,
      employee_number,
      first_name,
      last_name,
      middle_name,
      original_hire_date_date,
      hire_date,
      adjusted_service_date,
      pay_basis,
      organization_name,
      location_id,
      location_name,
      site_hr_location,
      program_code,
      program_name,
      project_code,
      project_name,
      job_code,
      assignment_status,
      cost_location_code,
      cost_department_code,
      legal_employer,
      flsa_status,
      psaflag,
      ec1_name,
      ec2_name,
      ec3_name,
      work_arrangement,
      work_arrangement_reason,
      age_tires,
      supervisor1_oracle_id,
      supervisor1_name,
      cost_client_code,
      person_id,
      person_gu_id,
      termination_date,
      production_start_date,
      manager_turnover_distinct_supervisors,
      veteran_status_definition,
      account_ownership_key,
      previous_supervisor_employee_id,
      previous_supervisor_name,
      technical,
      sub_function,
      effective_start_date,
      effective_end_date,
      new_supervisor_location_code,
      registered_disabled,
      default_department_code,
      default_client_code,
      cost_department_name,
      calendar_date,
      cost_client_description,
      head_count,
      voluntary_termination_status,
      attrition_impacting_ind,
      business_group_id,
      state,
      is_weekly,
      is_monthly,
      is_quarterly,
      is_yearly
    ]
  }
}
