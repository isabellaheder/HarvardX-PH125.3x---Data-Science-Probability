# QUESTIONS 3 AND 4 - Esophageal cancer and alcohol/tobacco use, part 1

# Case-control studies help determine whether certain exposures are associated with outcomes 
# such as developing cancer. The built-in dataset esoph contains data from a case-control 
# study in France comparing people with esophageal cancer (cases, counted in ncases) to people 
# without esophageal cancer (controls, counted in ncontrols) that are carefully matched on a variety 
# of demographic and medical characteristics. The study compares alcohol intake in grams per day (alcgp) 
# and tobacco intake in grams per day (tobgp) across cases and controls grouped by age range (agegp).

#The dataset is available in base R and can be called with the variable name esoph:

# head(esoph)
# You will be using this dataset to answer the following four multi-part questions (Questions 3-6).

# You may wish to use the tidyverse package:

library(tidyverse)

# The following three parts have you explore some basic characteristics of the dataset.

# Each row contains one group of the experiment. Each group has a different combination of age, 
# alcohol consumption, and tobacco consumption. The number of cancer cases and number of controls 
# (individuals without cancer) are reported for each group.

# 3A) How many groups are in the study?

nrow(esoph)
# 88

# 3B) How many cases are there?
# Save this value as all_cases for later problems.

all_cases <- sum(esoph$ncases)
all_cases
# 200

# 3C) How many controls are there?
# Save this value as all_controls for later problems.

all_controls <- sum(esoph$ncontrols)
all_controls
# 775

# The following four parts ask you to explore some probabilities within this dataset related to alcohol and tobacco consumption.

# 4A) What is the probability that a subject in the highest alcohol consumption group is a cancer case?
# Report your answer to 3 significant figures.

head(esoph$alcgp)

esoph %>%
dplyr::filter(alcgp== "120+") %>%
summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
mutate(p_case = ncases / (ncases + ncontrols)) %>%
pull(p_case)

# 0.402

# 4B) What is the probability that a subject in the lowest alcohol consumption group is a cancer case?
# Report your answer to 3 significant figures.

esoph %>%
dplyr::filter(alcgp== "0-39g/day") %>%
summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
mutate(p_case = ncases / (ncases + ncontrols)) %>%
pull(p_case)

# 0.0653

# 4C) Given that a person is a case, what is the probability that they smoke 10g or more a day?

smoke_case <- esoph %>%
dplyr::filter(tobgp != "0-9g/day") %>%
pull(ncases) %>%
sum()
smoke_case / all_cases

# 0.61

# 4D Given that a person is a control, what is the probability that they smoke 10g or more a day?
# Report your answer to 3 significant figures.
smoke_case <- esoph %>%
dplyr::filter(tobgp != "0-9g/day") %>%
pull(ncontrols) %>%
sum()
smoke_case / all_controls
# 0.423
