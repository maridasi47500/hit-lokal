class View < ApplicationRecord
  belongs_to :clip
  def self.allviews
    ActiveRecord::Base.connection.execute("
                                          SELECT s.* FROM ( 
                                              SELECT 
                                                      strftime('%W', date(p.created_at, 'unixepoch', 'localtime')) AS week_number,
                                                                sum(case when myviews.id is not null then 1 else 0 end) AS views, clip_id
                                                          FROM views myviews
                                                              GROUP BY week_number, clip_id) s
                                                              WHERE NOT EXISTS(SELECT 1 FROM views p
                                                                               WHERE strftime('%W', date(p.created_at, 'unixepoch', 'localtime')) = s.week_number
                                                                                                GROUP BY p.clip_id
                                                                                                                 HAVING SUM(case when myviews.id is not null then 1 else 0 end) > s.views)
                                          ")
  end
  def self.myviews
     week_number="strftime('%W', vvv.created_at)"
todayweek_number="strftime('%W', 'now')"
     my_week_number="strftime('%W', vv.created_at)"
today_week_number="strftime('%W', 'now')"
    ActiveRecord::Base.connection.execute("
SELECT created_at, week_number,
             max(views) AS views,
             (case when week_number = '28' then 'week number is 28' else 'wekk number is not 28' end) as mytest,
             myclipid,
             classement_semaine,
                    clip_id,
                    ce_classement_semaine_derniere2,
                    position_la_semaine_derniere2,
                    max(ce_classement_semaine) as pire_position,
                    max(classement_semaine) as ma_pire_position,
                    min(ce_classement_semaine) as mailleure_position,
                    min(classement_semaine) as ma_mailleure_position
    FROM (SELECT v.id as myid,v.clip_id as myclipid, v.created_at as created_at, strftime('%W', v.created_at) AS week_number,
             ROW_NUMBER() OVER(PARTITION BY  strftime('%W', v.created_at) ORDER BY sum(case when v.id is not null then 1 else 0 end) DESC) AS classement_semaine, 
             ROW_NUMBER() OVER(PARTITION BY  strftime('%W', v.created_at) ORDER BY count(v.id) DESC) AS ce_classement_semaine, 
             (case when strftime('%W',v.created_at) = '52' and strftime('%W','now') = '1' or strftime('%W','now') = cast((cast(strftime('%W',v.created_at) as integer) + 1) as string) then ('semderniere')  else 'pas de classement' end) as position_la_semaine_derniere,

                       sum(case when v.id is not null then 1 else 0 end) AS views,
                                    clip_id
          FROM views v)
                left outer join (SELECT v1.id as myid2,v1.clip_id as myclipid2,v1.clip_id as clip_id2, v1.created_at as created_at2, strftime('%W', v1.created_at) AS week_number2,
             (case when strftime('%W',v1.created_at) = '52' and strftime('%W','now') = '1' or strftime('%W','now') = cast((cast(strftime('%W',v1.created_at) as integer) + 1) as string) then 'semderniere'  else 'pas de classement' end) as position_la_semaine_derniere2,
             ROW_NUMBER() OVER(PARTITION BY  strftime('%W', v1.created_at) ORDER BY count(v1.id) DESC) AS ce_classement_semaine_derniere2, 

                       sum(case when v1.id is not null then 1 else 0 end) AS views2,
                       clip_id as clip_ip2
                                    
          FROM views v1
                GROUP BY week_number2, clip_id2 having v1.clip_id = clip_id 

)
    GROUP BY clip_id
    ORDER BY clip_id  ;")

  end
end
