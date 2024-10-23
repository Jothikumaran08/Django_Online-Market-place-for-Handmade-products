pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the code from the Git repository
                git branch: 'main', url: 'https://github.com/yourusername/your-django-repo.git'
            }
        }
        
        stage('Setup Python Environment') {
            steps {
                // Setup Python virtual environment
                sh '''
                python3 -m venv env
                source env/bin/activate
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies from requirements.txt
                sh '''
                source env/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Migrations') {
            steps {
                // Run Django database migrations
                sh '''
                source env/bin/activate
                export DJANGO_SETTINGS_MODULE=your_project.settings
                python manage.py migrate
                '''
            }
        }

        stage('Run Tests') {
            steps {
                // Run Django tests
                sh '''
                source env/bin/activate
                python manage.py test
                '''
            }
        }

        stage('Collect Static Files') {
            steps {
                // Collect static files for production
                sh '''
                source env/bin/activate
                python manage.py collectstatic --noinput
                '''
            }
        }

        stage('Restart Django Application') {
            steps {
                // Restart the Django server (adjust this for your setup)
                sh '''
                sudo systemctl restart gunicorn
                '''
            }
        }
    }

    post {
        success {
            // Notify build success (e.g., via email or Slack)
            echo 'Build completed successfully!'
        }
        failure {
            // Notify build failure (e.g., via email or Slack)
            echo 'Build failed. Check logs for details.'
        }
    }
}
