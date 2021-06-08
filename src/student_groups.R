
source('lib.R')

###

df <- read.delim(paste0(DATA_DIR, 'students.txt'), as.is = TRUE, header = TRUE)
head(df)

gg_df <- df %>%
  filter(DNA_structure != '') %>%
  filter(histone_mark != '') %>%
  # ZDNA_mouse_1  => ZDNA
  mutate(DNA_type = gsub('_.*', '', DNA_structure)) %>%
  mutate(group = paste(DNA_type, ':', histone_mark))


ggplot(gg_df) +
  aes(x = group) +
  geom_bar() +
  coord_flip() +
  ggtitle(sprintf('Number of students = %s', nrow(gg_df)))
ggsave('stuent_groups.pdf', path = OUT_DIR)

