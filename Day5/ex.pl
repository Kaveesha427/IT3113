student(alice).
student(bob).
student(charlie).
student(diana).

teacher(drSmith).
teacher(drJones).
teacher(drClark).
teacher(drWilliams).
teacher(drBrown).

course(cs101,programming).
course(cs102,database).
course(cs103,ai).
course(cs104,maths).
course(cs105,algorithms).

enrolled(alice,cs101).
enrolled(bob,cs101).
enrolled(charlie,cs102).
enrolled(diana,cs103).
enrolled(alice,cs104).
enrolled(bob,cs105).
enrolled(charlie,cs104).

teaches(drSmith,cs101).
teaches(drJones,cs102).
teaches(drClark,cs103).
teaches(drWilliams,cs104).
teaches(drBrown,cs105).


% Q1) Create a rule classmate(X,Y) which is true when X and Y are
% enrolled in the same course and X\=Y.

classmate(X,Y):-student(X),student(Y),enrolled(X,Z),enrolled(Y,Z),X\=Y.

% Q2) Create a rule is_student_of(Student,Teacher) that succeeds when
% teacher is an instructor of Student.

is_student_of(Student,Teacher):-student(Student),teacher(Teacher),enrolled(Student,Z),teaches(Teacher,Z).

% Q3) Create a rule share_teacher(X,Y) that is true if two students have
% at least one teacher in common.

share_teacher(X,Y):-student(X),student(Y),enrolled(X,Z),enrolled(Y,Z),X\=Y.

% Q4) Define a rule beginner_course(C) which is true if C is a course in
% programming or maths.(use the: OR operator)

beginner_course(C):-course(C,programming);course(C,maths).


% Q5)Create a rule enrolled_in_any_course(Student) that is true if a
% student is enrolled in any course(use the anonymous variable _)

enrolled_in_any_course(Student):-student(Student),enrolled(Student,_).

% Q6) Create a rule has_students(Teacher) that is true if a teacher
% teaches at least one student(again use _)

has_students(Teacher):-teacher(Teacher),teaches(Teacher,Z),enrolled(_,Z).


% Q7)Define a rule advanced_student(Student) which is true if the
% student enrolled in an advanced course(you already have
% advanced_course/1)

advanced_student(Student):-student(Student),enrolled(Student,Z),\+beginner_course(Z).

%Q8) Create a rule teaches_multiple(Teacher) that is true if a teacher
%teaches two different courses

teaches_multiple(Teacher):-teacher(Teacher),teaches(Teacher,X),teaches(Teacher,Y),X\=Y.

% Q9) Create a rule not_enrolled(Student,Course) which is true if the
%student not enrolled in a course(use \+operator for negation)

not_enrolled(Student,Course):-student(Student),\+enrolled(Student,Course).

% Q10) Create a rule student_pair(Student1,Student2,Course) which gives
% pairs of students enrolled in same course

student_pair(Student1,Student2,Course):-student(Student1),student(Student2),enrolled(Student1,Course),enrolled(Student2,Course),Student1\=Student2.
