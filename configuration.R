library(tidyverse)

# package for yse this to connect to GIT
install.packages("usethis")

library(usethis)

use_git_config(user.name = "josegabrielguerrero", user.email = "josegabrielguerrero26@gmail.com")

create_github_token()

## https://github.com/settings/tokens/new?scopes=repo,user,gist,workflow&description=DESCRIBE%20THE%20TOKEN%27S%20USE%20CASE
##TOKEN: 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


#Step 1b: Store your PAT in RStudio.
install.packages("gitcreds")
library(gitcreds)
gitcreds_set()


# Website for class DS 350 
  #https://byuistats.github.io/DS350_assignments/semester_project.html"