view: ta_requisition_region {

  sql_table_name:`EdwBI.TA-RequisitionRegion`;;

  #******************************* Dimensions ************************************#


  dimension: parent_system_id {
    type: number
    sql: ${TABLE}.ParentSystemId;;
  }

  dimension: system_id {
    type: number
    sql: ${TABLE}.SystemId;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country;;
    map_layer_name: countries
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region;;
  }

  dimension: load_by {
    hidden: yes
    type: string
    sql: ${TABLE}.LoadBy;;
  }

  dimension_group: load_date {
    hidden: yes
    type: time
    sql: ${TABLE}.LoadDate;;
  }

  dimension: load_process {
    hidden: yes
    type: string
    sql: ${TABLE}.LoadProcess;;
  }

  dimension: create_by {
    hidden: yes
    type: number
    sql: ${TABLE}.CreateBy;;
  }

  dimension_group: create_date {
    hidden: yes
    type: time
    sql: ${TABLE}.CreateDate;;
  }

  dimension: create_process {
    hidden: yes
    type: string
    sql: ${TABLE}.CreateProcess;;
  }

  dimension: update_by {
    hidden: yes
    type: string
    sql: ${TABLE}.UpdateBy;;
  }

  dimension_group: update_date {
    hidden: yes
    type: time
    sql: ${TABLE}.UpdateDate;;
  }

  dimension: update_process {
    hidden: yes
    type: string
    sql: ${TABLE}.UpdateProcess;;
  }

  dimension: inactive_ind {
    hidden: yes
    type: string
    sql: ${TABLE}.InactiveInd;;
  }

  dimension: inactive_date {
    hidden: yes
    type: string
    sql: ${TABLE}.InactiveDate;;
  }

  #**************************** Measure *******************************#


  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      parent_system_id,
      system_id,
      country,
      region,
      load_by,
      load_date_time,
      load_process,
      create_by,
      create_date_time,
      create_process,
      update_by,
      update_date_time,
      update_process,
      inactive_ind,
      inactive_date
    ]
  }
}
