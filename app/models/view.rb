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
    ActiveRecord::Base.connection.execute("SELECT created_at, week_number,
             max(views) AS views,
             ROW_NUMBER() OVER(ORDER BY views DESC) AS row_number_classement_week,
                    clip_id
    FROM (SELECT v.created_at as created_at, strftime('%W', v.created_at) AS week_number,
                       sum(case when v.id is not null then 1 else 0 end) AS views,
                                    clip_id
          FROM views v
                GROUP BY week_number, clip_id)
    GROUP BY clip_id
    ORDER BY clip_id;")

  end
end
