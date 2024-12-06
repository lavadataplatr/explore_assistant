view: employeeperson_assignment_snapshot {
  label: "Employee Assignment Snapshot"
  sql_table_name: `EdwBI.Employee-PersonAssignmentSnapshot`;;

#*********************************** Dimensions ***************************************#

  dimension: current {
    type: date_time
    sql:${TABLE}.SnapshotDate;;
    convert_tz: no
  }

  dimension: assignment_type {
    label: "Assignment Type"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: case when ${TABLE}.AssignmentType = 'E' then "Employee"
                                  when ${TABLE}.AssignmentType = 'A' then "Applicant" ELSE null
        END;;
  }

  dimension: base_department_name {
    label: "Base Department Name"
    view_label: "Department Information"
    type: string
    sql: ${TABLE}.BaseDepartmentName;;
  }

  dimension: Departmentcode {
    label: "Department Code"
    type: string
    sql: substring(${base_department_name},0,3);;
  }

  dimension: ASD_GSD_status{
    label: "w/ASD & w/out ASD category"
    type: string
    sql: case when ${Departmentcode} != '059' then "w/out ASD"
      else "w/ASD"   end;;
    order_by_field: asd_rank
  }

  dimension: Without_ASD{
    label: "Without ASD"
    type: string
    sql: case when ${Departmentcode} != '059' then "Without ASD"
      else NULL   end;;
    order_by_field: asd_rank
  }

  dimension: ASD{
    label: "ASD"
    type: string
    sql: case when ${Departmentcode} = '059' then "ASD"
      else NULL   end;;
  }

  dimension: ASD_Desktop {
    label: "General Hires"
    type: string
    sql: case when ${Departmentcode} = '059' then "ASD"
      when ${ec3} = "Steven Hamilton" then "Desktop Support" else null end;;
  }

  dimension: asd_rank{
    hidden: yes
    type: number
    sql: case when ${ASD_GSD_status} = "w/out ASD" then 1
      when ${ASD_GSD_status} = "w/ASD" then 2  end;;
  }

  dimension: client_name {
    label: "Client Name"
    view_label: "Employee Information"
    group_label: "Client"
    type: string
    sql: ${TABLE}.ClientName;;
  }

  dimension: cost_allocation_id {
    type: number
    sql: ${TABLE}.CostAllocationId;;
  }

  dimension: costing_client {
    label: "Costing Client"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingClient;;
  }

  dimension: costing_client_code {
    label: "Costing Client Code"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingClientCode;;
  }

  dimension: costing_department {
    label: "Costing Department"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingDepartment;;
  }

  dimension: costing_department_code {
    label: "Costing Department Code"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingDepartmentCode;;
  }

  dimension: costing_hr_location {
    label: "Costing Hr Location"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingHrLocation;;
  }

  dimension: costing_location_code {
    label: "Costing Location Code"
    view_label: "Costing Department Information"
    type: string
    sql: ${TABLE}.CostingLocationCode;;
  }

  dimension: department_level1 {
    view_label: "Department Information"
    label: "Department Level-1"
    type: string
    sql: ${TABLE}.DepartmentLevel1;;
    order_by_field: rank
  }

  dimension: rank {
    hidden: yes
    type: number
    sql:  case when ${TABLE}.DepartmentLevel1 = "Info Tech" then 1
        when ${TABLE}.DepartmentLevel1 = "Human Capital" then 2
        when ${TABLE}.DepartmentLevel1 = "Finance" then 3
        when ${TABLE}.DepartmentLevel1 = "Risk and Legal" then 4
        when ${TABLE}.DepartmentLevel1 = "Administration" then 5
        when ${TABLE}.DepartmentLevel1 = "Sales & Marketing" then 6
        when ${TABLE}.DepartmentLevel1 = "Operations" then 7
        else null end;;
  }

  dimension: department_group {
    view_label: "Department Information"
    label: "Department group"
    type: string
    sql: case when ${TABLE}.DepartmentLevel1 = "Operations" then "Operations"
                when ${TABLE}.DepartmentLevel1 = "Sales & Marketing" then "Sales & Marketing"
        else "Corporate" end;;
    order_by_field: rank_group
  }

  dimension: rank_group {
    hidden: yes
    type: number
    sql:  case when ${TABLE}.DepartmentLevel1 = "Corporate" then 1
                 when ${TABLE}.DepartmentLevel1 = "Sales & Marketing" then 2
        when ${TABLE}.DepartmentLevel1 = "Operations" then 3
        end;;
  }

  dimension: department_level2 {
    view_label: "Department Information"
    label: "Department Level-2"
    type: string
    sql: ${TABLE}.DepartmentLevel2;;
  }

  dimension: department_level3 {
    view_label: "Department Information"
    label: "Department Level-3"
    type: string
    sql: ${TABLE}.DepartmentLevel3;;
  }

  dimension: department_type {
    view_label: "Department Information"
    label: "Department Type"
    type: string
    sql: ${TABLE}.DepartmentType;;
  }

  dimension: ec1_name {
    label: "EC-1 Name"
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC1Name;;
  }

  dimension: ec2_name {
    label: "EC-2 Name"
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC2Name;;
  }

  dimension: ec2 {
    hidden: yes
    type: string
    sql: case when ${TABLE}.EC2Name is not null then ${TABLE}.EC2Name end;;
  }

  dimension: ec3_name {
    label: "EC-3 Name"
    group_label: "EC Name"
    type: string
    sql: case when ${TABLE}.EC3Name is null then ${TABLE}.EC2Name else ${TABLE}.EC3Name end;;
  }

  dimension: ec3 {
    # hidden: yes
    label: "EC-3 "
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC3Name;;
  }

  dimension: ec4_name {
    label: "EC-4 Name"
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC4Name;;
  }

  dimension: ec5_name {
    label: "EC-5 Name"
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC5Name;;
  }

  dimension: ec6_name {
    label: "EC-6 Name"
    group_label: "EC Name"
    type: string
    sql: ${TABLE}.EC6Name;;
  }

  dimension: Reporting_Manager{
    label: "Reporting Manager"
    view_label: "Employee Information"
    group_label: "Job"
    sql: {% if EC._parameter_value == 'EC1' %}
                             ${ec1_name}
        {% elsif EC._parameter_value == 'EC2' %}
        ${ec2_name}
        {% elsif EC._parameter_value == 'EC3' %}
        ${ec3_name}
        {% elsif EC._parameter_value == 'EC4' %}
        ${ec4_name}
        {% elsif EC._parameter_value == 'EC5' %}
        ${ec5_name}
        {% endif %};;
  }

  dimension: Reportee {
    label: "Reportee"
    view_label: "Employee Information"
    group_label: "Job"
    sql: {% if EC._parameter_value == 'EC1' %}
                              ${ec2_name}
        {% elsif EC._parameter_value == 'EC2' %}
        ${ec3_name}
        {% elsif EC.parameter_value == 'EC3' %}
        ${ec4_name}
        {% elsif EC._parameter_value == 'EC4' %}
        ${ec5_name}
        {% elsif EC._parameter_value == 'EC5' %}
        ${ec6_name}
        {% endif %};;
  }

  dimension: employee_category {
    label: "Employee Category"
    view_label: "Employee Information"
    group_label: "Employee"
    type: string
    sql: case when ${TABLE}.EmployeeCategory LIKE '%Fulltime%' then 'Full Time'
              when ${TABLE}.EmployeeCategory LIKE '%Full-time%' then 'Full Time'
              when ${TABLE}.EmployeeCategory LIKE '%Part-time%' then 'Part Time'
              when ${TABLE}.EmployeeCategory LIKE '%Parttime%'  then 'Part Time'

      else  'Contractors (FT)' end;;
  }

  #used for cooperate Maps

  dimension: employee_name_map {
    label: "Employee Name"
    hidden: yes
    view_label: "Employee Information"
    group_label: "Employee"
    type: string
    sql: ${TABLE}.EmployeeName;;
    link: {
      label: "Employee Location Map"
      url: "/dashboards/1228?Country%20=&City=&Department%20Name=&Employee%20Name={{ rendered_value | replace: ',', '^,' | url_encode}}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: ethnic_origin {
    type: string
    sql: case when ${TABLE}.EthnicOrigin = "" then "Unspecified" else ${TABLE}.EthnicOrigin end;;
    map_layer_name: countries
  }

  dimension: gender {
    type: string
    sql: case when ${TABLE}.Gender = 'M' then "Male"
                                   when ${TABLE}.Gender = 'F' then "Female"
        when ${TABLE}.Gender = 'U' then "Undisclosed"
        when ${TABLE}.Gender = 'N' then "Not Specified"
        else "Not Specified"  end;;
  }

  dimension:VoluntaryTerminationStatus  {
    type: string
    sql: ${TABLE}.VoluntaryTerminationStatus;;
    #drill_fields: [employee_number,employee_name]
  }

  dimension: employee_name {
    label: "Employee Name"
    view_label: "Employee Information"
    group_label: "Employee"
    type: string
    sql: ${TABLE}.EmployeeName;;
    drill_fields: [detail*]
  }

  dimension: employee_detail {
    type: string
    label: "Employee Details"
    sql: concat(${employee_name}," -- Job Title  --> ",${job_title}, "&   GCA --> ", ${gcalevel});;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${employee_name},${snapshot_date},${transaction_type},${period_type},${record_type});;
  }

  dimension: employee_number {
    label: "Employee Number"
    view_label: "Employee Information"
    group_label: "Employee"
    type: string
    sql: distinct(${TABLE}.EmployeeNumber);;
  }

  dimension: emp_number {
    label: "Emp Number"
    view_label: "Employee Information"
    group_label: "Employee"
    type: string
    sql: ${TABLE}.EmployeeNumber;;
  }

  dimension: gcalevel {
    label: "GCA Level"
    type: string
    sql: ${TABLE}.GCALevel;;
  }

  dimension: gcalevel_bucket {
    label: "GCA Level Bucket"
    type: string
    sql:CASE WHEN ${TABLE}.GCALevel in ('P1','P2','P3','P4')  THEN "P1 - P4"
                                   WHEN ${TABLE}.GCALevel in ('P5','P6')  THEN "P5 - P6"
        WHEN ${TABLE}.GCALevel in ('M1','M2','M3','M4')  THEN "M1 - M4"
        WHEN ${TABLE}.GCALevel in ('M5','M6')  THEN "M5 - M6"
        WHEN ${TABLE}.GCALevel in ('E1','E1G','E2','E2-EC','E5','E4')  THEN "Exec"
        ELSE "Support"  END;;
    order_by_field: GCA_RANK
  }

  dimension: GCA_RANK {
    type: number
    hidden: yes
    sql: case when ${gcalevel_bucket} = "Support" then  1
           when ${gcalevel_bucket} = "P1 - P4" then  2
           when ${gcalevel_bucket} = "P5 - P6" then  4
           when ${gcalevel_bucket} = "M1 - M4" then  3
           when ${gcalevel_bucket} = "M5 - M6" then  5
           when ${gcalevel_bucket} = "Exec" then  6
          else null end;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.FirstName;;
  }

  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.LastName;;
  }

  dimension: middle_name {
    type: string
    hidden: yes
    sql: ${TABLE}.MiddleName;;
  }

  dimension: organization_id {
    type: string
    hidden: yes
    sql: ${TABLE}.OrganizationId;;
  }

  dimension: organization_name {
    type: string
    hidden: yes
    sql: ${TABLE}.OrganizationName;;
  }

  dimension: gl_location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.GlLocationId;;
  }

  dimension: gl_location_name {
    type: string
    hidden: yes
    sql: ${TABLE}.GlLocationName;;
  }

  dimension: source_location_id {
    type: string
    hidden: yes
    sql: ${TABLE}.SourceLocationId;;
  }

  dimension: job_id {
    type: string
    hidden: yes
    sql: ${TABLE}.JobId;;
  }

  dimension: work_arrangement {
    type: string
    hidden: yes
    sql: ${TABLE}.WorkArrangement;;
  }

  dimension: work_arrangement_reason {
    type: string
    hidden: yes
    sql: ${TABLE}.WorkArrangementReason;;
  }

  dimension: parent_client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ParentClientId;;
  }

  dimension: business_region_name {
    type: string
    hidden: yes
    sql: ${TABLE}.BusinessRegionName;;
  }

  dimension: region_name {
    type: string
    hidden: yes
    sql: ${TABLE}.Region;;
  }

  dimension: lhcountry {
    type: string
    hidden: yes
    sql: ${TABLE}.LHCountry;;
  }

  dimension: gl_location_code {
    type: string
    hidden: yes
    sql: ${TABLE}.GlLocationCode;;
  }

  dimension: base_location {
    type: string
    hidden: yes
    sql: ${TABLE}.BaseLocation;;
  }

  dimension: city_name {
    type: string
    hidden: yes
    sql: ${TABLE}.CityName;;
  }

  dimension: country_code_iso2 {
    type: string
    hidden: yes
    sql: ${TABLE}.CountryCodeIso2;;
  }

  dimension: hr_location_province {
    type: string
    hidden: yes
    sql: ${TABLE}.HrLocationProvince;;
  }

  dimension: hr_location_state {
    type: string
    hidden: yes
    sql: ${TABLE}.HrLocationState;;
  }

  dimension: site_hr_location {
    type: string
    hidden: yes
    sql: ${TABLE}.SiteHrLocation;;
  }

  dimension: gcaband {
    type: string
    hidden: yes
    sql: ${TABLE}.GCABand;;
  }

  dimension: gl_client_code {
    type: string
    hidden: yes
    sql: ${TABLE}.GlClientCode;;
  }

  dimension: gl_client_name {
    type: string
    hidden: yes
    sql: ${TABLE}.GlClientName;;
  }


  dimension: attrition_impacting_ind {
    type: yesno
    hidden: yes
    sql: ${TABLE}.AttritionImpactingInd;;
  }

  dimension: tenure_tiers {
    type: string
    hidden: yes
    sql: ${TABLE}.TenureTiers;;
  }

  dimension: boomerangs {
    type: number
    hidden: yes
    sql: ${TABLE}.Boomerangs;;
  }

  dimension: hires {
    type: number
    hidden: yes
    sql: ${TABLE}.Hires;;
  }

  dimension: attrition {
    type: string
    hidden: yes
    sql: ${TABLE}.Attrition;;
  }

  dimension: supervisor_employee_number {
    type: string
    sql: ${TABLE}.SupervisorEmployeeNumber;;
  }

  dimension: supervisor_employee_id {
    type: string
    sql: ${TABLE}.SupervisorEmployeeID;;
  }

  dimension: previous_supervisor_name {
    type: string
    sql: ${TABLE}.PreviousSupervisorName;;
  }

  dimension: previous_supervisor_employee_id {
    type: string
    sql: ${TABLE}.PreviousSupervisorEmployeeID;;
  }

  dimension: veteran_status_code {
    type: string
    sql: ${TABLE}.VeteranStatusCode;;
  }

  dimension: veteran_status_definition {
    type: string
    sql: ${TABLE}.VeteranStatusDefinition;;
  }

  dimension: assignment_status {
    type: string
    sql: ${TABLE}.AssignmentStatus;;
  }

  dimension: technical {
    type: string
    sql: ${TABLE}.Technical;;
  }

  dimension: flsa_status {
    type: string
    sql: ${TABLE}.FlsaStatus;;
  }

  dimension: psaflag {
    type: string
    sql: ${TABLE}.PSAFlag;;
  }

  measure: headcount {
    label: "Head Count"
    view_label: "Employee Measures"
    type: sum_distinct
    drill_fields: [detail*]
    sql: ${TABLE}.Headcount;;
  }

  measure: onshore_headcount {
    label: "Onshore Head Count"
    type: sum_distinct
    sql: case when ${OnOffCategoryExternal} = "On-Shore" then ${TABLE}.Headcount else 0 end;;
    drill_fields: [detail*]
  }

  measure: offshore_headcount {
    label: "Off shore Head Count"
    type: sum_distinct
    sql: case when ${OnOffCategoryExternal} not in ("On-Shore","Near-Shore") then ${TABLE}.Headcount else 0 end;;
    drill_fields: [detail*]
  }

  measure: Headcount_for_attrition {
    label: "Heatcount_for_Attrition"
    type: sum_distinct
    sql: case when ${transaction_type} = "headcount" then ${TABLE}.Headcount else 0 end;;
    drill_fields: [employee_number,employee_name, ec1_name, ec2_name,ec3_name, ec4_name,ec5_name,termination_reason,actual_termination_date,accepted_termination_date,termination_reason_description, VoluntaryTerminationStatus]
  }


  measure: termination_for_attrition {
    label: "Termination_for_Attrition"
    type: sum_distinct
    filters: [Termination_count_dim: "!=0"]
    sql: case when ${transaction_type} = "termination" then ${TABLE}.Headcount else 0 end;;
    drill_fields: [termination_detail*]
  }

  dimension: Termination_count_dim{
    hidden: yes
    type: number
    view_label: "Employee Measures"
    sql: case when  ${TABLE}.ActualTerminationDate  is not null  and
      ${transaction_type} = "termination"  and ${period_type} = "monthly" then 1 else 0 end;;
  }

  dimension: hype_segment {
    label: "Hyper Segment"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: ${TABLE}.HyperionSegment;;
  }

  dimension: job_code {
    label: "Job Code"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.JobCode;;
  }

  dimension: Tier {
    label: "Tier"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: case when ${TABLE}.JobCode in ('27014',  '26008',  '26008-VWG',  '28008',  'TTGS28008',  '27508',
                                           '26015', '27008',  '28014',  'TTGS26015',  '26308',  'TTGS26008',
                                           '26114', '29114',  '26208', '29014', '27514',  '29008',  'P1210',
                                          'TTGS28014',  '26108',  '29108',  'P1226',  'P1420',  'P1417',
                                          '27020',  '28601')  then "Tier ll"
               when ${TABLE}.JobCode  in ('26007',  '27013',  '26207',  '26014',  '28013',  '26307',  'P1418',  '26107',
                                          '28602',  'TTGS28007',  '28007',  '27007',  '29107',  '29007',  '26113',  '27212',
                                          '29113',  'TTGS26007') then "Tier ll1"  else "Tier 1" end;;
  }

  dimension: job_family {
    label: "Job Family"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.JobFamily;;
  }

  dimension: job_title {
    label: "Job Title"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.JobTitle;;
  }

  dimension: latitude {
    label: "Latitude"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: number
    sql: ${TABLE}.Latitude;;
  }

  dimension: location_city {
    label: "Location City"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: string
    sql: ${TABLE}.LocationCity;;
  }

  dimension: location_country {
    label: "Country Code"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: string
    sql: ${TABLE}.LocationCountry;;
    map_layer_name: countries
  }

  dimension: country_name{
    #hidden: yes
    label: "Country Name"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: string
    sql: case when ${TABLE}.LocationCountry = "AE" then "United Arab Emirates"
                              when ${TABLE}.LocationCountry = 'AR' then "Argentina"
        when ${TABLE}.LocationCountry = 'AU' then "Australia"
        when ${TABLE}.LocationCountry = 'BE' then "Belgium"
        when ${TABLE}.LocationCountry = 'BG' then "Bulgaria"
        when ${TABLE}.LocationCountry = 'BR' then "Brazil"
        when ${TABLE}.LocationCountry = 'CA' then "Canada"
        when ${TABLE}.LocationCountry = 'CO' then "Colombia"
        when ${TABLE}.LocationCountry = 'CR' then "Costa Rica"
        when ${TABLE}.LocationCountry = 'CH' then "China"
        when ${TABLE}.LocationCountry = 'DE' then "Germany"
        when ${TABLE}.LocationCountry = 'EG' then "Egypt"
        when ${TABLE}.LocationCountry = 'ES' then "Spain"
        when ${TABLE}.LocationCountry = 'GB' then "United Kingdom"
        when ${TABLE}.LocationCountry = 'GH' then "Ghana"
        when ${TABLE}.LocationCountry = 'GR' then "Greece"
        when ${TABLE}.LocationCountry = 'HK' then "Hong Kong"
        when ${TABLE}.LocationCountry = 'HN' then "Honduras, Central American"
        when ${TABLE}.LocationCountry = 'IE' then "Ireland"
        when ${TABLE}.LocationCountry = 'IL' then "Israel"
        when ${TABLE}.LocationCountry = 'IN' then "India"
        when ${TABLE}.LocationCountry = 'KW' then "Kuwait"
        when ${TABLE}.LocationCountry = 'LB' then "Lebanon"
        when ${TABLE}.LocationCountry = 'MK' then "Macedonia, Republic of"
        when ${TABLE}.LocationCountry = 'MX' then "Mexico"
        when ${TABLE}.LocationCountry = 'MY' then "Malaysia"
        when ${TABLE}.LocationCountry = 'NL' then "Netherlands"
        when ${TABLE}.LocationCountry = 'NZ' then "New Zealand"
        when ${TABLE}.LocationCountry = 'PH' then "Philippines"
        when ${TABLE}.LocationCountry = 'PL' then "Poland"
        when ${TABLE}.LocationCountry = 'SG' then "Singapore"
        when ${TABLE}.LocationCountry = 'TH' then "Thailand"
        when ${TABLE}.LocationCountry = 'TR' then "Turkey"
        when ${TABLE}.LocationCountry = 'US' then "United States of America"
        when ${TABLE}.LocationCountry = 'ZA' then "South Africa"
         when ${TABLE}.LocationCountry = 'SL' then "Sri Lanka"
        Else 'Russia' end;;
    map_layer_name: countries
  }

  dimension: country_name1 {
    hidden: yes
    label: "Location Country Name"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: string
    sql: ${TABLE}.LocationCountryName;;
  }

  dimension: coordinates {
    label: "Coordinates"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude};;
  }

  dimension: longitude {
    label: "Longitude"
    view_label: "Employee Information"
    group_label: "Demographic"
    type: number
    sql: ${TABLE}.Longitude;;
  }

  dimension: age_bracket{
    label: "Age Tier"
    type: string
    sql: ${TABLE}.AgeBracket;;
  }

  dimension: age_group {
    label: "Age Tier 1"
    type: string
    sql: replace(substring(${TABLE}.AgeBracket, 3), ' ', '');;
  }

  dimension: EmployeeBirthMonthDay {
    type: string
    sql:${TABLE}.EmployeeBirthMonthDay;;
  }

  dimension: management_level {
    label: "Management Level"
    type: string
    sql: ${TABLE}.ManagementLevel;;
  }

  dimension: on_off_category {
    label: "Internal Reporting"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: case when ${country_name} in   ("Brazil", "United Arab Emirates") then "On-Shore"
                                  when ${country_name} in ("Belgium", "Netherlands", "Colombia") then "Near-Shore"
        else ${TABLE}.OnOffCategory end;;
  }

  dimension: on_off_category_int1 {
    hidden: yes
    label: "Reporting Location"
    view_label: "Employee Information"
    group_label: "Job"
    sql: {% if Reporting._parameter_value == 'Internal' %}
                             ${on_off_category}
        {% elsif Reporting._parameter_value == 'External' %}
        ${OnOffCategoryExternal}
        {% endif %};;
  }

  dimension: on_off_category_int{
    label: "Reporting Location"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: Case when ${on_off_category_int1} in ('Off-Shore','Not-assigned')  then " Off-Shore"
                                  when ${on_off_category_int1} = 'On-Shore' then "On-Shore"
        when ${on_off_category_int1} = 'Near-Shore' then "Near-Shore"
        end;;
  }

  dimension: on_off_shore_location{
    label: "On / Off Shore Location"
    view_label: "Employee Information"
    suggestable: yes
    group_label: "Job"
    type: string
    sql: Case when ${on_off_category_int1} in ('Off-Shore','Not-assigned')  then " Off-Shore"
                                  when ${on_off_category_int1} = 'On-Shore' then "On-Shore"
        when ${on_off_category_int1} = 'Near-Shore' then "Near-Shore"
        end;;
  }

  dimension: OnOffCategoryExternal {
    label: "External Reporting"
    view_label: "Employee Information"
    group_label: "Job"
    sql: ${TABLE}.OnOffCategoryExternal;;
  }

  dimension: parent_client {
    label: "Parent Client"
    view_label: "Employee Information"
    group_label: "Client"
    type: string
    sql: ${TABLE}.ParentClient;;
  }

  dimension: parent_client_code {
    label: "parent Client Code"
    view_label: "Employee Information"
    group_label: "Client"
    type: string
    sql: ${TABLE}.ParentClientCode;;
  }

  dimension: parent_client_name {
    label: "Parent Client Name"
    view_label: "Employee Information"
    group_label: "Client"
    type: string
    sql: ${TABLE}.ParentClientName;;
  }

  dimension: period_type {
    label: "Period Type"
    type: string
    sql: ${TABLE}.PeriodType;;
  }

  dimension: person_id {
    hidden: yes
    type: string
    sql: ${TABLE}.PersonId;;
  }

  dimension: program_code {
    label: "Program Code"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: ${TABLE}.ProgramCode;;
  }

  dimension: program_name {
    label: "Program Name"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: ${TABLE}.ProgramName;;
  }

  dimension: project_code {
    label: "Project Code"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: ${TABLE}.ProjectCode;;
  }

  dimension: project_name {
    label: "Project Name"
    view_label: "Employee Information"
    group_label: "Miscellaneous"
    type: string
    sql: ${TABLE}.ProjectName;;
  }

  dimension: Proportion1  {
    hidden: yes
    label: "Proportion"
    view_label: "Employee Information"
    group_label: "Job"
    type: number
    sql: ${TABLE}.Proportion;;
  }


  measure: landing_logo {
    type: string
    sql: coalesce(max(1),1);;
    html: <div class="vis">
                  <div style="color:#000000;font-color:black;padding:0px;height:100%;width:100%;line-height:78px;display:inline-block;text-align:left;font-size:40px;padding-top:5px;float:left;background: #CCCCFF;">
                                <table>
                                    <tr>
                                        <td style="margin-left:auto;margin-right:auto; margin-top:30px;padding-left:8px;">
           <img src="https://raw.githubusercontent.com/lavadataplatr/imageslinks/main/download.png" alt=""  height="65px"  </td>


      <td style="height:100%;width:100%;text-align:center;padding-left:80px;"> Headcount Overview </p></a> </td>
      <td style="margin-left:auto;margin-right:auto; margin-top:30px;padding-right:80px;">
      <img src="https://raw.githubusercontent.com/lavadataplatr/imageslinks/main/employee_count_upgrade_timeattendance_icon_time__65051.jpg" alt=""  height="60px"  </td>


      </table>
      </div>
      </div>                  ;;
  }

  measure: percent_complete {
    description: "This Measure is used in Janssen Brand Overview"
    sql: 1*${Attrition_percent} ;;
    html:

      <div style="height:10%;">
      <div>
      <div style="margin-bottom:2rem;padding:1px;color:black;background-color:rgb(150, 191, 255);position:relative; vertical-align: top;" >
      <table>
      <tr style="line-height: 12px;">
      <th style="padding-left: 10px;width: 10%;text-align:left;font-size: 10px;font-family:sans-serif;font-weight:20px">
      Inventory</a>

      </th>
      <th style="margin-bottom:4rem;padding-right: 10px;color:black;width: 5%;text-align:right;font-size: 25px;font-family:sans-serif;font-weight:200;font-style:italic">
      <a > <b>&#x1F6C8;</b></a>

      </th>
      </tr>
      </table>
      </div>
      </div>
      <div style="Text-align:left;font-size:18px;color:#484848;padding-top:1px;line-height:21px;font-family:sans-serif"> <b> Total / Predicted </b> </div>




      <div style="float: left
      ; width:{{ value | times:100}}%
      ; background-color: #3367d6
      ; text-align:left
      ; color: #FFFFFF
      ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value | times:100 | round:0 }}%</p>
      </div>
      <div style="float: left
      ; width:{{ 1| minus:value | times:100}}%
      ; background-color: rgba(0,180,0,0.1)
      ; text-align:right
      ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{value | round:0}}</p>
      </div>







      <a style="display:inline-block;float:center;width:22%">
      <a style="Text-align:center;color:#484848;font-size:23px;font-weight:400;font-family:sans-serif;line-height:21px">{{Termination_count._rendered_value}} </a>
      <a style="Text-align:center;font-size:16px;color:#484848;padding-top:12px;line-height:21px;font-family:sans-serif">Total Orders</a>
      <a style="line-height:10px;"> &nbsp; </a>
      </a>
      <a style="display:inline-block;float:center;width:22%">
      <a style="Text-align:center;color:#484848;font-size:23px;font-weight:400;font-family:sans-serif;line-height:21px">{{headcount._rendered_value}}</a>
      <a style="Text-align:center;font-size:16px;color:#484848;padding-top:12px;line-height:21px;font-family:sans-serif">Predictable orders</a>

      ;;
  }




  measure: percent_complete1 {type: number sql: 1*${Attrition_percent};;
    value_format: "0"
    html:
          <div style="margin-top:1.4rem;padding:1px;color:black;background-color:rgb(150, 191, 255);position:relative; vertical-align: top;" >
      <table>
      <tr style="line-height: 36px;">
      <th style="padding-left: 10px;width: 10%;text-align:left;font-size: 18px;font-family:sans-serif;font-weight:600px">
      OTIF Ship % </a>
<div style="float: left
          ; width:{{ value | times:100}}%
          ; background-color: #3367d6
          ; text-align:left
          ; color: #FFFFFF
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value | times:100 | round:0 }}%</p>
          </div>
          <div style="float: left
          ; width:{{ 1| minus:value | times:100}}%
          ; background-color: rgba(0,180,0,0.1)
          ; text-align:right
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{value | round:0}}</p>
          </div>
      ;;

  }


  dimension: reporting_segment {
    label: "Reporting Segment"
    type: string
    sql: ${TABLE}.ReportingSegment;;
  }

  dimension: rnum {
    hidden: yes
    type: number
    sql: ${TABLE}.rnum;;
  }

  dimension_group: snapshot {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.SnapshotDate;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {value: "Date"}
    allowed_value: {value: "Week"}
    allowed_value: {value: "Month"}
    allowed_value: {value: "Quarter"}
    allowed_value: {value: "Year"}
  }

  dimension: time_grain {
    label_from_parameter: date_granularity
    type: string
    sql: {% if date_granularity._parameter_value == 'Date' %}
      cast(${snapshot_date} as string)
    {% elsif date_granularity._parameter_value == 'Week' %}
      cast(${snapshot_week} as string)
    {% elsif date_granularity._parameter_value == 'Month' %}
      cast(${snapshot_month} as string)
    {% elsif date_granularity._parameter_value == 'Quarter' %}
      cast(${snapshot_quarter} as string)
    {% elsif date_granularity._parameter_value == 'Year' %}
      cast(${snapshot_year} as string)
    {% else %}
      cast(${snapshot_date} as string)
    {% endif %};;
  }

  dimension: Snapshot_month {
    #type: date_raw
    sql: ${TABLE}.SnapshotDate;;
    html: {{ rendered_value | date: "%B, %Y" }};;
    order_by_field: snapshot_month_name
  }

  #Only used for HC reports

  dimension: year_quater {
    label: "Quarter"
    type: string
    sql:case when concat( extract(year from ${TABLE}.SnapshotDate) ,'-Q',extract(Quarter from ${TABLE}.SnapshotDate)) =
                                    concat( extract(year from current_date()) ,'-Q',extract(Quarter from current_date()))
        then 'Current Q' else concat( extract(year from ${TABLE}.SnapshotDate) ,'-Q',extract(Quarter from ${TABLE}.SnapshotDate)) end;;
  }

  dimension: staffing_ratio {
    label: "Staffing Ratio"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.StaffingRatio;;
  }

  dimension: supervisor_name {
    label: "Supervisor Name"
#      hidden: yes
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.SupervisorName;;
  }

  dimension: termination_reason {
    type: string
    sql: ${TABLE}.TerminationReason;;
  }

  dimension: termination_reason_description {
    type: string
    sql: ${TABLE}.TerminationReasonDescription;;
  }

  dimension: termination_reason_more_information {
    type: string
    sql: ${TABLE}.TerminationReasonMoreInformation;;
  }

  dimension: vertical {
    label: "Vertical"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.Vertical;;
  }

  dimension: work_at_home {
    label: "Work at Home"
    view_label: "Employee Information"
    group_label: "Job"
    type: string
    sql: ${TABLE}.WorkAtHome;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.TransactionType;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}.RecordType;;
  }

  dimension: zip_code {
    #hidden:yes
    type: zipcode
    sql: ${TABLE}.ZipCode;;
  }

  dimension: group_function {
    type: string
    sql: ${TABLE}.GroupFunction;;
  }

  dimension: function1 {
    label: "Function"
    type: string
    sql:  ${TABLE}.Function ;;
  }


  dimension: function {
    type: string
    sql: case when ${TABLE}.Function = 'Consulting Global' then 'Human Resources'
              when ${TABLE}.Function = 'Engage Leaders' then 'Executive Management'
              when ${TABLE}.Function = 'Finance Global' or ${TABLE}.Function is null then 'Facility Operations'
              when (${TABLE}.Function = 'Sales & Mkting Global' or ${TABLE}.Function = 'Ops - Other') then 'Marketing'
              when (${TABLE}.Function = 'IT Global' or ${TABLE}.Function = 'Ops Delivery') then  'Information Technology' else 'Legal' end ;;
  }

  dimension: sub_function {
    type: string
    sql: ${TABLE}.subFunction ;;
  }

  dimension: function_department_name {
    type: string
    sql: ${TABLE}.FunctionDepartmentName;;
  }

  dimension: function_department_number {
    type: string
    sql: ${TABLE}.FunctionDepartmentNumber;;
  }

  dimension: function_owner {
    type: string
    sql: ${TABLE}.FunctionOwner;;
  }

  dimension: function_owner_employee_number {
    type: number
    sql: ${TABLE}.FunctionOwnerEmployeeNumber;;
  }

  dimension: sub_function_owner {
    type: string
    sql: ${TABLE}.SubFunctionOwner;;
  }

  dimension: sub_function_owner_employee_number {
    type: number
    sql: ${TABLE}.SubFunctionOwnerEmployeeNumber;;
  }

  dimension: department_owner {
    type: string
    sql: ${TABLE}.DepartmentOwner;;
  }

  dimension: department_owner_employee_number {
    type: number
    sql: ${TABLE}.DepartmentOwnerEmployeeNumber;;
  }

  dimension: sub_function_and_department {
    type: string
    sql: concat(${sub_function}," (",${department_owner}," )");;
  }

  dimension_group: accepted_termination {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.AcceptedTerminationDate;;
  }

  dimension_group: actual_termination {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.ActualTerminationDate;;
  }

  dimension_group: adjusted_service {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.AdjustedServiceDate;;
  }

  dimension_group: effective_end {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.effectiveEndDate;;
  }

  dimension_group: effective_start {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.effectiveStartDate;;
  }

  dimension_group: hire {
    view_label: " Date Information"
    type: time
    timeframes: [
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

  dimension_group: notified_termination {
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
    sql: ${TABLE}.NotifiedTerminationDate;;
  }

  dimension_group: original_hire {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OriginalHireDate;;
  }

  dimension_group: project_start {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.ProjectStartDate;;
  }

  dimension_group: projected_termination {
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
    sql: ${TABLE}.ProjectedTerminationDate;;
  }

  dimension_group: start_date {
    view_label: " Date Information"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.StartDate;;
  }

  #*********************************** Measures ***************************************#

  measure: ec3_reportee {
    type: count_distinct
    label: "EC3 Reportee"
    sql: case when ${TABLE}.EC3Name is null then ${TABLE}.EC2Name else ${TABLE}.EC3Name end;;
    drill_fields: [employee_number]
  }

  measure: ec4_reportee {
    type: count_distinct
    label: "EC4 Reportee"
    sql: case when ${TABLE}.EC4Name is null then ${TABLE}.EC3Name else ${TABLE}.EC4Name end;;
    drill_fields: [employee_number]
  }

  measure: male_headcount {
    type: sum
    filters: [gender: "Male"]
    sql: ${TABLE}.Headcount;;
    drill_fields: [detail*]
    #sql: case when ${TABLE}.Gender = "M" then ${TABLE}.Headcount else 0 end;;
  }

  measure: female_headcount {
    type: sum
    filters: [gender: "Female"]
    sql: ${TABLE}.Headcount;;
    drill_fields: [detail*]
    #sql: case when ${TABLE}.Gender = "F" then ${TABLE}.Headcount else 0 end;;
  }

  measure: undisclosed_headcount {
    type: sum
    filters: [gender: "Undisclosed"]
    sql: ${TABLE}.Headcount;;
    #sql: case when ${TABLE}.Gender = "U" then ${TABLE}.Headcount else 0 end;;
  }

  measure: voluntary_Termination_count{
    label: "Voluntary Termination count"
    view_label: "Employee Measures"
    filters: [Termination_count_dim: "!=0"]
    type: sum
    drill_fields: [termination_detail*]
    sql: case when  ${TABLE}.ActualTerminationDate  is not null  and ${transaction_type} = "termination"  and ${period_type} = "monthly"
      and ${VoluntaryTerminationStatus} = "Voluntary" then 1 else 0 end;;
  }

##needs to be removed

  measure: headcount1 {
    hidden: yes
    type: sum
    drill_fields: [detail*]
    sql:  case when ${transaction_type} = "headcount"  then 1 else 0 end;;
  }

  measure: Termination_count1{
    hidden: yes
    type: sum
    drill_fields: [Termination_count*]
    sql: case when ${transaction_type} = "termination" then 1 else 0 end;;
  }

  measure: Attrition_percent{
    # hidden: yes
    type: number
    sql: (${Termination_count}/NULLIF(${headcount},0) );;
    #value_format_name: percent_1
    drill_fields: [Termination_count*]
  }

  measure: testing {
    sql: MAX(1) ;;
    html:  <div class="w3-light-grey w3-xlarge">
        <div class="w3-container w3-green" style="width:50%">{{employeeperson_assignment_snapshot.Attrition_percent._rendered_value}}</div>
      </div> ;;
  }



  measure: headcount_map {
    hidden: yes
    label: "Employee Head Count"
    view_label: "Employee Measures"
    type: sum
    sql: ${TABLE}.Headcount;;
  }

  measure: Hired_count {
    type: count_distinct
    sql: ${TABLE}.HireDate;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  measure: Proportion_1  {
    label: "Proportion "
    type: sum
    sql: ${TABLE}.Proportion;;
    drill_fields: [detail*]
    value_format: "00"
  }

  measure: Porp_Head {
    label: " "
    drill_fields: [Porp_Head*]
    type: number
    value_format: "#,##0"
    sql: {% if Porp_Head_cnt._parameter_value == 'Proportion' %}
            ${Proportion_1}
        {% elsif Porp_Head_cnt._parameter_value == 'Head' %}
        ${headcount}
        {% endif %};;
  }

  measure: Termination_count{
    label: "Termination count"
    view_label: "Employee Measures"
    filters: [Termination_count_dim: "!=0"]
    type: sum
    sql: case when  ${TABLE}.ActualTerminationDate  is not null  and
      ${transaction_type} = "termination"  and ${period_type} = "monthly" then 1 else 0 end;;
    drill_fields: [termination_detail*]
  }


  parameter: Reporting {
    type: unquoted
    allowed_value: {
      label: "Internal Reporting"
      value: "Internal"
    }
    allowed_value: {
      label: "External Reporting"
      value: "External"
    }
  }

  parameter: Porp_Head_cnt {
    type: unquoted
    allowed_value: {
      label: "Head Count"
      value: "Head"
    }
    allowed_value: {
      label: "Proportion"
      value: "Proportion"
    }
  }

  parameter: EC {
    type: unquoted
    allowed_value: {
      label: "EC1"
      value: "EC1"
    }
    allowed_value: {
      label: "EC2"
      value: "EC2"
    }
    allowed_value: {
      label: "EC3"
      value: "EC3"
    }
    allowed_value: {
      label: "EC4"
      value: "EC4"
    }
    allowed_value: {
      label: "EC5"
      value: "EC5"
    }
  }

#*****************Sets of Drill fields *******************#

  set: termination_detail {
    fields: [
      employee_number,
      employee_name,
      employee_category,
      effective_start_date,
      effective_end_date,
      actual_termination_date,
      termination_reason,
      termination_reason_description,
      VoluntaryTerminationStatus,
      Termination_count
    ]
  }

  set: Termination_count {
    fields: [
      employee_name,
      ec2_name,
      ec3_name,
      location_country,
      base_department_name,
      actual_termination_date,
      OnOffCategoryExternal,
      termination_reason,
      termination_reason_more_information,
      VoluntaryTerminationStatus
    ]
  }

  # ----- Sets of fields for drilling headcount ------

  set: detail {
    fields: [
      employee_number,
      # employee_name,
      OnOffCategoryExternal,
      base_department_name,
      department_level1,
      department_level2,
      department_level3,
      supervisor_name,
      employee_category,
      department_type,
      assignment_type,
      vertical,
      hype_segment,
      parent_client_name,
      client_name,
      program_name,

      ec1_name,
      ec2_name,
      ec3_name,
      ec4_name,
      ec5_name,
      ec6_name,
      location_city

    ]
  }

  set: Porp_Head {
    fields: [
      employee_number,
      employee_name,
      on_off_category,
      base_department_name,
      department_level1,
      department_level2,
      department_level3,
      supervisor_name,
      job_family,
      job_title,
      gcalevel,
      employee_category,
      department_type,
      assignment_type,
      vertical,
      hype_segment,
      parent_client_name,
      client_name,
      program_name,
      project_name,
      ec1_name,
      ec2_name,
      ec3_name,
      ec4_name,
      ec5_name,
      ec6_name,
      location_city,
      Termination_count
    ]
  }

}
