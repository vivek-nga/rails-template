class EventHandleWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    p args
    10000.times { Aritcle.create(title: Faker::Book.title, body: Faker::Book.author) }
  end
end
