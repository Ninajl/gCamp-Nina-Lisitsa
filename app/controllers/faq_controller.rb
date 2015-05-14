class FaqController <ApplicationController
  before_action :authenticate

  def index
    @question1 = CommonQuestion.new
    @question1.question = "What is TaskMe"
    @question1.answer ="TaskMe is an awesome tool that is going to change your life.  TaskMe is your one stop shop to organize all your tasks.  You'll also be able to track comments that you and others make.  TaskMe may eventually replace all need for paper and pens in the entire world.  Well, maybe not, but it's going to be pretty cool.
    "
    @question1.slug ="What-is-TaskMe?"

    @question2 = CommonQuestion.new
    @question2.question = "How do I join TaskMe?"
    @question2.answer = "As soon as it's ready for the public, you'll see a signup link in the upper right.  Once that's there, just click it and fill in the form!
    "
    @question2.slug ="How-do-I-join-TaskMe?"

    @question3 = CommonQuestion.new
    @question3.question = "When will TaskMe be finished?"
    @question3.answer = "TaskMe is a work in progress.  That being said, it should be fully functional in the next few weeks.  Functional.  Check in daily for new features and awesome functionality.  It's going to blow your mind.  Organization is just a click away.  Amazing!
    "
    @question3.slug ="When-will-TaskMe-be-finished?"

    @common_questions = [@question1, @question2, @question3]
  end
end
