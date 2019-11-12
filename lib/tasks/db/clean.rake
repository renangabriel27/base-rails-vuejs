namespace :db do
  desc 'Clean data'

  task clean: :environment do
    puts 'Cleaning data...'

    [User].each(&:delete_all)
  end
end
