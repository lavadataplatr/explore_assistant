view: account_ownership_details {
  sql_table_name: `EdwBI.Operations-AccountOwnershipDetails`;;



  ## Note :- IF we add New Coloumn in this View Please add it in Drill set as well.

#******************************************************* Primary Fields **********************************************#


  dimension: account_ownership_key {
    type: string
    sql: ${TABLE}.AccountOwnershipKey ;;
    view_label: "Account Ownership"
    label: "Account Ownership Key"
    primary_key: yes
    hidden: yes
  }



#******************************************** String Dimensions ****************************************************************#

  dimension: client_code {
    type: string
    sql: ${TABLE}.ClientCode ;;
    view_label: "Account Ownership"
    label: "Client Code"
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.ClientName ;;
    view_label: "Account Ownership"
  }

  dimension: parent_client_code {
    type: string
    sql: ${TABLE}.ParentClientCode ;;
    view_label: "Account Ownership"
  }

  dimension: parent_client_name {
    type: string
    sql: ${TABLE}.ParentClientName ;;
    view_label: "Account Ownership"
  }

  dimension: client_success_lead {
    type: string
    sql: ${TABLE}.ClientSuccessLead ;;
    view_label: "Account Ownership"
  }

  dimension: delivery_direct_report {
    type: string
    sql: ${TABLE}.DeliveryDirectReport ;;
    view_label: "Account Ownership"
  }

  dimension: client_owner_region_name {
    type: string
    sql: ${TABLE}.ClientOwnerRegionName ;;
    view_label: "Account Ownership"
  }

  dimension: global_workforce_managament_owner {
    type: string
    sql: ${TABLE}.GlobalWorkforceManagamentOwner ;;
    view_label: "Account Ownership"
  }

  dimension: quality_assurance_owner {
    type: string
    sql: ${TABLE}.QualityAssuranceOwner ;;
    view_label: "Account Ownership"
  }

  dimension: talent_acquisition_owner {
    type: string
    sql: ${TABLE}.TalentAcquisitionOwner ;;
    view_label: "Account Ownership"
  }

  dimension: engage_sales_owner {
    type: string
    sql: ${TABLE}.EngageSalesOwner ;;
    view_label: "Account Ownership"
  }

  dimension: digital_sales_owner {
    type: string
    sql: ${TABLE}.DigitalSalesOwner ;;
    view_label: "Account Ownership"
  }

  dimension: process_improvement_leader {
    type: string
    sql: ${TABLE}.ProcessImprovementLeader ;;
    view_label: "Account Ownership"
  }

  dimension: pro_active_solution_owner {
    type: string
    sql: ${TABLE}.ProActiveSolutionOwner ;;
    view_label: "Account Ownership"
  }
  dimension: learning_development_owner {
    type: string
    sql: ${TABLE}.LearningDevelopmentOwner ;;
    view_label: "Account Ownership"
  }

  dimension: operations_lead {
    type: string
    sql: ${TABLE}.OperationsLead ;;
    view_label: "Account Ownership"
  }

  dimension: parent_client_name_code {
    type: string
    view_label: "Account Ownership"
    label: "Parent Client Name & Code"
    sql: case when ${parent_client_code} is  null  then ${parent_client_name} else CONCAT(${parent_client_name}, ' (', REPLACE(${parent_client_code}, '(', '\\('), ')') end ;;
  }

  dimension: client_name_code {
    type: string
    view_label: "Account Ownership"
    label: "Client Name & Code"
    sql: CONCAT(${client_name}, ' (', REPLACE(${client_code}, '(', '\\('), ')');;
  }

  dimension: business_segment {
    view_label: "Account Ownership"
    type: string
    sql: ${TABLE}.BusinessSegment ;;
  }

  dimension: business_vertical {
    type: string
    view_label: "Account Ownership"
    sql: ${TABLE}.BusinessVertical ;;
  }

  dimension: client_portfolio {
    type: string
    view_label: "Account Ownership"
    sql: ${TABLE}.ClientPortfolio ;;
  }

  dimension: delivery_lead {
    type: string
    view_label: "Account Ownership"
    sql: ${TABLE}.DeliveryLead ;;
  }

  dimension: delivery_prime {
    type: string
    view_label: "Account Ownership"
    sql: ${TABLE}.DeliveryPrime ;;
  }

  dimension: portfolio_lead {
    type: string
    view_label: "Account Ownership"
    sql: ${TABLE}.PortfolioLead ;;
  }

#******************************************** Number Dimensions ****************************************************************#

  dimension: client_id {
    type: number
    sql: ${TABLE}.ClientId ;;
    view_label: "Account Ownership"
  }

  dimension: parent_client_id {
    type: number
    sql: ${TABLE}.ParentClientId ;;
    view_label: "Account Ownership"
  }

  dimension: main_owner_flag {
    type: number
    sql: ${TABLE}.MainOwnerFlag ;;
    view_label: "Account Ownership"
  }

  dimension: client_owner_region_id {
    type: number
    sql: ${TABLE}.ClientOwnerRegionId ;;
    view_label: "Account Ownership"
  }

  dimension: parent_client_key {
    type: number
    sql: ${TABLE}.ParentClientKey ;;
    view_label: "Account Ownership"
  }

  dimension_group: effective_end_date {
    type: time
    label: "Effective End"
    view_label: "Account Ownership"
    datatype: datetime
    sql: ${TABLE}.EffectiveEndDate ;;
    hidden: yes
  }

  ## Note :- IF we add New Coloumn in this View Please add it in Drill set as well.

  set: all_fields {
    fields: [account_ownership_key,business_segment,business_vertical,client_code,client_id,client_name,client_name_code,client_owner_region_id,client_owner_region_name,client_portfolio,client_success_lead,delivery_direct_report,delivery_lead,delivery_prime,digital_sales_owner,effective_end_date_date,engage_sales_owner,global_workforce_managament_owner,learning_development_owner,main_owner_flag,operations_lead,parent_client_code,parent_client_id,parent_client_key,parent_client_name,parent_client_name_code,portfolio_lead,pro_active_solution_owner,process_improvement_leader,quality_assurance_owner,talent_acquisition_owner,effective_end_date_month,effective_end_date_quarter,effective_end_date_year]
  }

}
