User.create!([
  {email: "test3@bacui.com", encrypted_password: "$2a$11$VYlgJQwIrlRNLoXIa9qqR..ki9xV1XkGe.4o1kNTr/tcaGlQ5MtZ6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-08-20 14:59:27", last_sign_in_at: "2018-08-20 14:54:29", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Another", last_name: "instructor", roles: "instructor_pending"},
  {email: "test6@bacui.com", encrypted_password: "$2a$11$lQVID4AbWlrsJ8Z14iqY2OYeEPrDAMX/XWnq7g1DDcHNcDJEVsMQm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-08-31 16:09:26", last_sign_in_at: "2018-08-31 16:09:26", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Student 888", last_name: "Xiao", roles: "student"},
  {email: "test2@bacui.com", encrypted_password: "$2a$11$qPjsHtBAbDrH/SdTKjfFNeAEfWolx/HfVjxkOVVzQI7JHoinx7tri", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 11, current_sign_in_at: "2018-09-06 17:44:22", last_sign_in_at: "2018-09-05 15:13:23", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Yang1", last_name: "Song1", roles: "instructor_pending"},
  {email: "test5@bacui.com", encrypted_password: "$2a$11$bRBvg4b8mikXVQkg8vJBounVyPGXkwayPF/igJPJBvOtufbmJi6fu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2018-09-06 17:44:32", last_sign_in_at: "2018-09-05 15:14:05", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "student777", last_name: "Xiao", roles: "student"},
  {email: "test1@bacui.com", encrypted_password: "$2a$11$TMUAbQrPqIIKTUOeOt68meur4y5QztnTh4LpAIdOL6ofNOXkZ..Ny", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2018-10-15 16:05:25", last_sign_in_at: "2018-08-20 15:32:50", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Yang", last_name: "Song", roles: "admin"},
  {email: "test4@bacui.com", encrypted_password: "$2a$11$mxr0IiPzoWCuiHVGtj87veH5Fd2koClbDg02q.R.K95rlomnNQcym", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-10-15 16:06:16", last_sign_in_at: "2018-08-31 14:55:34", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "student", last_name: "Song", roles: "student"}
])
Actor.create!([
  {name: "Submitter 1", task_id: 1},
  {name: "Submitter 122", task_id: 2}
])
ActorsUser.create!([
  {actor_id: 1, user_id: 4},
  {actor_id: 2, user_id: 4}
])
Artifact.create!([
  {content: "<h1>lalala</h1><div>there are only two font sizes<br><br></div><ul><li>point 1</li><li>point 2</li></ul><div><br></div><ol><li>numbered items</li><li>numbered items again<ol><li>indented</li></ol></li></ol><div><br></div>", author_actor_id: 1},
  {content: "<div><a href=\"https://www.youtube.com/watch?v=t2qZ2_tp-jY\">a link</a></div><blockquote>some one said something and I am citing it</blockquote><div><br></div><pre><strong>&lt;% if </strong><em>task</em><strong>.team_size&gt;1 %&gt;\r\n  &lt;%= </strong><em>link_to </em><strong>\"Your team1\", new_actor_path(:task_id </strong><strong><em>=&gt;</em></strong><em>task</em><strong>.id) if logged_in?(:student) and !</strong><em>actor_for_submission_task </em><strong>%&gt;\r\n  &lt;%= </strong><em>link_to </em><strong>\"Your team2\", edit_actor_path(</strong><em>actor_for_submission_task</em><strong>) if logged_in?(:student) and current_user.actor_by_task(</strong><em>task</em><strong>.id, </strong><strong><em>SubmissionTask</em></strong><strong>) %&gt;\r\n&lt;% else %&gt;</strong></pre>", author_actor_id: 2}
])
Course.create!([
  {title: "My 12th course", archived: false, instructor_id: 3},
  {title: "My 10th course1010", archived: false, instructor_id: 2},
  {title: "My 13th course", archived: false, instructor_id: 2},
  {title: "My 14th course", archived: false, instructor_id: 2},
  {title: "My 12th course1212", archived: false, instructor_id: 2}
])
Task.create!([
  {title: "task course 15", description: "", starts_at: "2018-08-21 17:27:00", ends_at: "2018-08-21 17:27:00", num_reviewed_artifacts: nil, include_self_review: false, archived: false, team_size: 1, course_id: 15, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "task course 99", description: "", starts_at: "2018-08-21 17:57:00", ends_at: "2018-08-21 17:57:00", num_reviewed_artifacts: nil, include_self_review: false, archived: false, team_size: 1, course_id: 15, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "review_task1", description: "desc desc", starts_at: "2018-08-23 14:44:00", ends_at: "2018-08-23 14:44:00", num_reviewed_artifacts: 16, include_self_review: true, archived: false, team_size: 1, course_id: 15, type: "ReviewTask", reviewed_task_id: 1},
  {title: "submission222", description: "", starts_at: "2018-08-23 15:27:00", ends_at: "2018-08-23 15:27:00", num_reviewed_artifacts: nil, include_self_review: nil, archived: false, team_size: 1, course_id: 14, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "review for submission 222", description: "has self review, num reviewed artifacts 888", starts_at: "2018-08-23 15:34:00", ends_at: "2018-08-25 00:00:00", num_reviewed_artifacts: 888, include_self_review: true, archived: false, team_size: 1, course_id: 14, type: "ReviewTask", reviewed_task_id: 4},
  {title: "submission for course 13", description: "submission for course 13", starts_at: "2018-08-23 15:55:00", ends_at: "2018-08-23 15:55:00", num_reviewed_artifacts: nil, include_self_review: nil, archived: false, team_size: 1, course_id: 13, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "review task course 13", description: "desc review task course 13", starts_at: "2018-08-23 15:57:00", ends_at: "2018-08-29 00:00:00", num_reviewed_artifacts: 5, include_self_review: false, archived: false, team_size: 1, course_id: 13, type: "ReviewTask", reviewed_task_id: 7}
])
UserCourse.create!([
  {user_id: 5, course_id: 15},
  {user_id: 6, course_id: 15},
  {user_id: 4, course_id: 15},
  {user_id: 5, course_id: 10}
])
ReviewTask.create!([
  {title: "review_task1", description: "desc desc", starts_at: "2018-08-23 14:44:00", ends_at: "2018-08-23 14:44:00", num_reviewed_artifacts: 16, include_self_review: true, archived: false, team_size: 1, course_id: 15, type: "ReviewTask", reviewed_task_id: 1},
  {title: "review for submission 222", description: "has self review, num reviewed artifacts 888", starts_at: "2018-08-23 15:34:00", ends_at: "2018-08-25 00:00:00", num_reviewed_artifacts: 888, include_self_review: true, archived: false, team_size: 1, course_id: 14, type: "ReviewTask", reviewed_task_id: 4},
  {title: "review task course 13", description: "desc review task course 13", starts_at: "2018-08-23 15:57:00", ends_at: "2018-08-29 00:00:00", num_reviewed_artifacts: 5, include_self_review: false, archived: false, team_size: 1, course_id: 13, type: "ReviewTask", reviewed_task_id: 7}
])
SubmissionTask.create!([
  {title: "task course 15", description: "", starts_at: "2018-08-21 17:27:00", ends_at: "2018-08-21 17:27:00", num_reviewed_artifacts: nil, include_self_review: false, archived: false, team_size: 1, course_id: 15, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "task course 99", description: "", starts_at: "2018-08-21 17:57:00", ends_at: "2018-08-21 17:57:00", num_reviewed_artifacts: nil, include_self_review: false, archived: false, team_size: 1, course_id: 15, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "submission222", description: "", starts_at: "2018-08-23 15:27:00", ends_at: "2018-08-23 15:27:00", num_reviewed_artifacts: nil, include_self_review: nil, archived: false, team_size: 1, course_id: 14, type: "SubmissionTask", reviewed_task_id: nil},
  {title: "submission for course 13", description: "submission for course 13", starts_at: "2018-08-23 15:55:00", ends_at: "2018-08-23 15:55:00", num_reviewed_artifacts: nil, include_self_review: nil, archived: false, team_size: 1, course_id: 13, type: "SubmissionTask", reviewed_task_id: nil}
])
