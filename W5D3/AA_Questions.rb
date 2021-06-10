require 'sqlite3'
require 'singleton'
require 'byebug'

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
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    return nil unless user.length > 0 

    user.map { |use| Users.new(use) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0 

    user.map { |use| Users.new(use) }
  end

  def authored_questions(id)
    Questions.find_by_author_id(id)
  end


end

class Questions
  attr_accessor :id, :title, :body, :author_id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    return nil unless question.length > 0 

    question.map { |quest| Questions.new(quest) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE author_id = ?
    SQL
    return nil unless question.length > 0 

    question.map { |quest| Questions.new(quest) }
  end
end

class QuestionsFollows
  attr_accessor :id, :question_id, :user_id
  
  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions_follows
      WHERE id = ?
    SQL
    return nil unless question_follow.length > 0 

    question_follow.map { |quest| QuestionsFollows.new(quest) }
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
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    return nil unless reply.length > 0 

    reply.map { |rep| Replies.new(rep) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply_id = options['reply_id']
    @body = options['body']
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL
    return nil unless reply.length > 0 

    reply.map { |rep| Replies.new(rep) }
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    return nil unless reply.length > 0 

    reply.map { |rep| Replies.new(rep) }
  end
end

class QuestionLikes
  attr_accessor :id, :user_like, :user_id, :question_id
  
  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    return nil unless question_like.length > 0 

    question_like.map { |like| QuestionLikes.new(like) }
  end

  def initialize(options)
    @id = options['id']
    @user_like = options['user_like']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end