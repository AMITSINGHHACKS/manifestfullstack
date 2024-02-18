#!/bin/bash

# Set global Git configurations
git config --global user.email amitkumar.singh@vsit.edu.in
git config --global user.name AMITSINGHHACKS

# Display contents of deployment.yml before modification
cat deployment.yml

# Replace a specific pattern in deployment.yml with ${APP_NAME}:${IMAGE_TAG}
sed -i 's+${APP_NAME}.*+${APP_NAME}:${IMAGE_TAG}+g' deployment.yml

# Display contents of deployment.yml after modification
cat deployment.yml

# Add all changes to the Git staging area
git add .

# Commit changes with a Jenkins build number in the commit message
git commit -m "Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}"

# Push changes to the main branch on GitHub using credentials
withCredentials([gitUsernamePassword(credentialsId: 'git', gitToolName: 'Default')]) {
    git push https://github.com/AMITSINGHHACKS/manifestfullstack HEAD:main
}
