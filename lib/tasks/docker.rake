namespace :docker do
  desc 'Push docker images to DockerHub'
  task :push_image do
    TAG = `git rev-parse --short HEAD`.strip
    sh "docker build -t dmlaziuk/railsapp:#{TAG} ."
    IMAGE_ID = `docker images | grep dmlaziuk\/railsapp | head -n1 | awk '{print $3}'`.strip
    sh "docker tag #{IMAGE_ID} dmlaziuk/railsapp:latest"
    sh "docker push dmlaziuk/railsapp:#{TAG}"
    sh 'docker push dmlaziuk/railsapp:latest'
  end
end
