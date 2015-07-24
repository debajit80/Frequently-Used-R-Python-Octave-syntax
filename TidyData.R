## example dataset name - students
grade male female
A    1      5
B    5      0
C    5      2
D    5      5
E    7      4
## varibles --> grade,sex, count 
gather(students, sex, count, -grade)

##  The data argument, students, gives the name of the
##  original dataset. The key and value arguments -- sex and count, respectively -- 
## give the column names for our tidy dataset. 
## The final argument, -grade, says that we want to gather all columns EXCEPT the grade column 
## (since grade is already a proper column variable.)

## multiple variables stored in one column
## example dataset name - students2
grade male_1 female_1 male_2 female_2
A      3        4      3        4
B      6        4      3        5
C      7        4      3        8
D      4        0      8        1
E      1        1      2        7
## Use gather() to stack the columns of students2, 
## like we just did with students. This time, name the
## 'key' column sex_class and the 'value' column count. 
gather(students2, sex_class, count, -grade)

## tidyr offers a convenient separate() function for the purpose of 
## separating one column into multiple columns
separate(res, sex_class, c("sex","class"))

## varaiables stored in both rows and columsn
## example dataset - students 3
name    test class1 class2 class3 class4 class5
Sally midterm      A   <NA>      B   <NA>   <NA>
Sally   final      C   <NA>      C   <NA>   <NA>
Jeff midterm   <NA>      D   <NA>      A   <NA>
Jeff   final   <NA>      E   <NA>      C   <NA>
Roger midterm   <NA>      C   <NA>   <NA>      B
Roger   final   <NA>      A   <NA>   <NA>      A
Karen midterm   <NA>   <NA>      C      A   <NA>
Karen   final   <NA>   <NA>      C      A   <NA>
Brian midterm      B   <NA>   <NA>   <NA>      A
Brian   final      B   <NA>   <NA>   <NA>      C
#
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  ### Call to mutate() goes here %>%
  mutate(class=extract_numeric(class)) %>%
  print
## The fourth messy data problem we'll look at occurs when multiple observational units 
## are stored in the same table
## example - students4 
id  name sex class midterm final
168 Brian   F     1       B     B
168 Brian   F     5       A     C
588 Sally   M     1       A     C
588 Sally   M     3       B     C
710  Jeff   M     2       D     E
710  Jeff   M     4       A     C
731 Roger   F     2       C     A
731 Roger   F     5       B     A
908 Karen   M     3       C     C
908 Karen   M     4       A     A

## 
score_range read_male read_fem read_total math_male math_fem math_total write_male write_fem write_total
700-800     40151    38898      79049     74461    46040     120501      31574     39101       70675
600-690    121950   126084     248034    162564   133954     296518     100963    125368      226331
500-590    227141   259553     486694    233141   257678     490819     202326    247239      449565
400-490    242554   296793     539347    204670   288696     493366     262623    302933      565556
300-390    113568   133473     247041     82468   131025     213493     146106    144381      290487
200-290     30728    29154      59882     18788    26562      45350      32500     24933       5743

sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  ### <Your call to group_by()> %>%
  group_by(part,sex) %>%
  mutate(total=sum(count), prop=count/total) %>%
  print