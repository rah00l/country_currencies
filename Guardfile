# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :test, :all_after_pass => false do
	watch(%r{^app/models/(.+)\.rb$}) { |m| "test/unit/#{m[1]}_test.rb" }
	watch(%r{^app/controllers/(.+)\.rb$}) { |m| "test/functional/#{m[1]}_test.rb" }
	watch(%r{^app/views/.+\.rb$}) { "test/integration" }
	watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
end
