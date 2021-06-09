require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT id
      FROM users
      WHERE id = ?
    SQL
    return nil unless user.length > 0 

    Users.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
end

class Questions
  attr_accessor :id, :title, :body, :author_id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT id
      FROM questions
      WHERE id = ?
    SQL
    return nil unless question.length > 0 

    Questions.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end

class QuestionsFollows
  attr_accessor :id, :question_id, :user_id
  
  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT id
      FROM questions_follows
      WHERE id = ?
    SQL
    return nil unless question_follow.length > 0 

    QuestionsFollows.new(question_follow.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

class Replies
  attr_accessor :id, :question_id, :user_id, :reply_id, :body
  
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT id
      FROM replies
      WHERE id = ?
    SQL
    return nil unless reply.length > 0 

    Replies.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply_id = options['reply_id']
    @body = options['body']
  end
end

class QuestionLikes
  attr_accessor :id, :user_like, :user_id, :question_id
  
  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT id
      FROM question_likes
      WHERE id = ?
    SQL
    return nil unless question_like.length > 0 

    QuestionLikes.new(question_like.first)
  end

  def initialize(options)
    @id = options['id']
    @user_like = options['user_like']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end