# { '5.0' => '5.0.0', '5.1' => '5.1.0', '5.2' => '5.2.0'}.each do |rails, version|
{ '5.0' => '5.0.0', '5.1' => '5.1.0'}.each do |rails, version|
  appraise "rails-#{rails}" do
    gem "rails", "~> #{version}"
    gem "sqlite3"
    gem "mysql2", "< 0.4.0"
    gem "pg", "0.21.0"
  end
end

appraise "rails-master" do
  gem "rails", git: "https://github.com/rails/rails.git", branch: "master"
  gem "sqlite3"
  gem "mysql2"
  gem "pg"
end
