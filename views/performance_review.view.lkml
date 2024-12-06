view: performance_review {
  derived_table: {
    sql: with performance_ratings as (
              select EmployeeNumber,  Q12022Rating,Q22022Rating,Q32022Rating,Q42022Rating,Q12023Rating,Q22023Rating
             from `EdwBI.Employee-PersonAssignmentIT`
            ),
            piv as (SELECT
              EmployeeNumber,
              'Q1 2022' AS Period,
              Q12022Rating AS Rating
            FROM performance_ratings
            UNION ALL
            SELECT
              EmployeeNumber,
              'Q2 2022' AS Period,
              Q22022Rating AS Rating
            FROM performance_ratings
            UNION ALL
            SELECT
              EmployeeNumber,
              'Q3 2022' AS Period,
              Q32022Rating AS Rating
            FROM performance_ratings
            UNION ALL
            SELECT
              EmployeeNumber,
              'Q4 2022' AS Period,
              Q42022Rating AS Rating
            FROM performance_ratings
             UNION ALL
            SELECT
              EmployeeNumber,
              'Q1 2023' AS Period,
              Q12023Rating AS Rating
            FROM performance_ratings
             UNION ALL
            SELECT
              EmployeeNumber,
              'Q2 2023' AS Period,
              Q22023Rating AS Rating
            FROM performance_ratings )
           select  EmployeeNumber,Period, case  WHEN Rating = 0 then 'Cannot Assess'
                  WHEN Rating = 5 then 'Significant Contributor'
                  WHEN Rating = 4 then 'Extraordinary Performer'
                  WHEN Rating = 3 then 'Fully Satisfactory'
                  WHEN Rating = 2 then 'Opportunity to Improve'
                  WHEN Rating =  1 then 'No Rating'
             end as Rating from piv;;
  }

#****************************** Dimensions *************************************#

  dimension: employee_number {
    type: string
    sql: ${TABLE}.EmployeeNumber;;
  }

  dimension: pk {
    hidden: yes
    type: string
    primary_key: yes
    sql: coalesce(${TABLE}.EmployeeNumber,${TABLE}.Period);;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.Rating;;
  }

  dimension: distribution {
    label: "Distribution"
    type: string
    sql:  case
              when ${TABLE}.rating = 'Significant Contributor'  then "30 - 35 %"
              when ${TABLE}.rating = 'Extraordinary Performer'  then "0 - 5 %"
              when ${TABLE}.rating = 'Fully Satisfactory'  then "50 -55 %"
              when ${TABLE}.rating = 'Opportunity to Improve'  then "0 - 15 %"
      Else null end;;
    order_by_field: rank
  }

  dimension: rank {
    hidden: yes
    type: number
    sql:  case when ${distribution} = "0 - 5 %" then 1
              when ${distribution} = "30 - 35 %" then 2
              when ${distribution} = "50 -55 %" then 3
              when ${distribution} = "0 - 15 %" then 4
               end;;
    #alpha_sort: yes
    }

#******************************** Meaures *************************************#

    measure: proposed_distribution {
      type: number
      sql: case when ${rating} = "Extraordinary Performer" then 5
            when ${rating} = "Significant Contributor" then 35
            when ${rating} = "Fully Satisfactory" then 55
            when ${rating} = "Opportunity to Improve" then 15 end;;

    }

    measure: count {
      hidden: yes
      type: count
      drill_fields: [detail*]
    }

    set: detail {
      fields: [
        employee_number,
        period,
        rating
      ]
    }
  }
