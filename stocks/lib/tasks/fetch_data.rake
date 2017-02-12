
namespace :fetch_data do
  desc 'init data'
  task :init_stocks => :environment do
    Stock.create_form_yahoo
  end
end
