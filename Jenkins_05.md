"Assignment 5:
Topics Covered:  (User Authentication, User Authorization)
     Assignment on Authentication and Authorization
        Their is an organization which has 3 teams
            - Developer
            - Devops
            - Testing
        First you need to create 9 dummy jenkins jobs.Each job will print their jobname, build number.
            For Developer create 3 dummy jobs.In developer view
                job1:- dev-1
                job2:- dev-2
                job3:- dev-3
            For Testing create 3 dummy jobs. In testing view
                job1:- test-1
                job2:- test-2
                job3:- test-3
            For Devops create 3 dummy jobs. In devops view
                job1:- devops-1
                job2:- devops-2
                job3:- devops-3
        Users in each team: 
            developer: [ They can see only dev jobs, can build it, see workspace and configure it ]
                - developer-1 
                - developer-2 
            testing: [ They can see all test jobs ,can build it, see workspace and can configure it, | They can also view dev jobs ]
                - testing-1 
                - testing-2 
            devops:  [ They can see all devops jobs ,can build it, see workspace and can configure it, | They can also view dev and test jobs  ]
                - devops-1 
                - devops-2
            admin
                -  admin-1 [ It will have full access ]
        See what Authorization strategy suits it and implement it.
        Also go through all authorization strategy
        Legacy mode
        Project Based
        Matrix Based
        Role-Based
        Point 2:-
        Enable SSO with Goggle"
-----------------------------------------------------
1. First you need to create 9 dummy jenkins jobs.Each job will print their jobname, build number.
   
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/ab9b3ce6-bf6d-4ac2-9024-a6a2b87c5c00)
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/aded3946-849c-4a5f-a694-b074eafbc2fb)
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/fc289d3f-0488-4586-b604-365c8972a6ba)
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/ff887a7f-43ff-4b25-9fb9-3a4ffd1d3a33)
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/9d8847a1-4ae3-43b0-b971-b0ae9df54604)

2.  Users in each team: 
            developer: [ They can see only dev jobs, can build it, see workspace and configure it ]
                - developer-1 
                - developer-2 
            testing: [ They can see all test jobs ,can build it, see workspace and can configure it, | They can also view dev jobs ]
                - testing-1 
                - testing-2 
            devops:  [ They can see all devops jobs ,can build it, see workspace and can configure it, | They can also view dev and test jobs  ]
                - devops-1 
                - devops-2

    ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/42e785c1-8c2a-47df-b81a-7c505d506986)
   ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/11e120a5-86bd-4669-898c-4742b632453c)
   ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/0d44fd60-8b36-4021-8294-b4f56bf7f0cd)
   ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/16286199-ebcc-420a-9c77-7de51552af03)
   ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/d78c2c51-fae7-4509-8153-02c3d5501fa7)
 ![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/e4ca8fd5-823a-4147-b758-8d6bbf419c03)
![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/8c8d33f6-bc3e-4d0f-bc95-cda8aa216354)


























