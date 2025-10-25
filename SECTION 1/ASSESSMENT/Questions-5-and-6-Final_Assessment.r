# QUESTIONS 5 AND 6: Esophageal cancer and alcohol/tobacco use, part 2

# The following four parts look at probabilities related to alcohol and tobacco consumption among the cases.

# 5A For cases, what is the probability of being in the highest alcohol group?
highest_alc <- subset(esoph, alcgp== "120+")
highest_alc_cases <- sum(highest_alc$ncases)
highest_alc_cases

all_cases

45/200
# 0.225

# 5B For cases, what is the probability of being in the highest tobacco group?
highest_tab <- subset(esoph, tobgp== "30+")
highest_tab_cases <- sum(highest_tab$ncases)
highest_tab_cases

31/200
# 0.155

# 5C For cases, what is the probability of being in the highest alcohol group and the highest tobacco group?
highest_tab_alc <- subset(esoph, tobgp== "30+" & alcgp== "120+")
highest_tab_alc_cases <- sum(highest_tab_alc$ncases)
highest_tab_alc_cases

10/200
# 0.05

# 5D For cases, what is the probability of being in the highest alcohol group or the highest tobacco group?
highest_tab_or_alc_cases <- highest_alc_cases + highest_tab_cases- highest_tab_alc_cases
highest_tab_or_alc_cases

66/200
# 0.33

# The following six parts look at probabilities related to alcohol and 
# tobacco consumption among the controls and also compare the cases and the controls.

# 6A For controls, what is the probability of being in the highest alcohol group?
# Report your answer to 3 significant figures.
high_alc_controls <- esoph %>%
dplyr::filter(alcgp== "120+") %>%
pull(ncontrols) %>%
sum()
p_control_high_alc <- high_alc_controls/all_controls
p_control_high_alc
# 0.0687

# 6B How many times more likely are cases than controls to be in the highest alcohol group?
# Report your answer to 3 significant figures.
high_tob_controls <- esoph %>%
dplyr::filter(tobgp== "30+") %>%
pull(ncontrols) %>%
sum()
p_control_high_tob <- high_tob_controls/all_controls
p_control_high_tob
# 3.27

# 6C For controls, what is the probability of being in the highest tobacco group?
# Report your answer to 3 significant figures.
high_alc_tob_controls <- esoph %>%
dplyr::filter(alcgp== "120+" & tobgp== "30+") %>%
pull(ncontrols) %>%
sum()
p_control_high_alc_tob <- high_alc_tob_controls/all_controls
p_control_high_alc_tob
# 0.0841

# 6D For controls, what is the probability of being in the highest alcohol group OR the highest tobacco group?
# Report your answer to 3 significant figures.
p_control_either_highest <- p_control_high_alc + p_control_high_tob - p_control_high_alc_tob
p_control_either_highest
# 0.0133

# 6E How many times more likely are cases than controls to be in the highest alcohol group or the highest tobacco group?
# Report your answer to 3 significant figures.
0.33 / p_control_either_highest
# 2.37





