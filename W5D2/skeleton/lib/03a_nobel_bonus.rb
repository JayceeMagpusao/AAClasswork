# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      yr, subject
    FROM
      nobels
    WHERE
      subject = 'Physics' AND subject NOT IN ('Chemistry')
    GROUP BY
      yr, subject;
  SQL
end
