view: employeeworld_country {
  sql_table_name: `Edw.Employee-WorldCountry`;;


#****************************** Dimensions ***********************************#

  dimension: country {
    hidden: yes
    type: string
    sql: ${TABLE}.Country;;
    link: {
      label: "Employee Location Map"
      url: "/dashboards/1199?Country={{ rendered_value | replace: ',', '^,' | url_encode}}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: country_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.CountryCode;;
  }

  dimension: dd {
    hidden: yes
    type: string
    sql: ${TABLE}.DD;;
  }

  dimension: ddm {
    hidden: yes
    type: string
    sql: ${TABLE}.DDM;;
  }

  dimension: dms {
    hidden: yes
    type: string
    sql: ${TABLE}.DMS;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude;;
  }
  dimension: country_cordinates {
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude};;

  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
