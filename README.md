## Capstone project

### About this project
- Launch a simple nginx application with a default index.html page that is updated as part of the pipeline. V1: Before the update, V2: After the update.
- I chose a rolling deployment strategy, where I update the image for the previous kubernetes cluster.
- The pipeline is built with circleci
- For simplicity and better scalability the cluster is both initialized and updated via circleci, where the udpate of the index.html file (the default file of the nginx app) is performed in a second job.

### General references:
- https://github.com/udacity/cdond-c3-projectstarter 
- https://github.com/BenCoder1991/udacityCICDsubmission (my previous project submission for: "Give Your Application Auto-Deploy Superpowers")
- https://github.com/BenCoder1991/udacityMicroservicesSubmission (my previous project submission for: "Container Orchestration with Kubernetes")
- https://docs.docker.com
- detailed references in the code


### Built With
- [Circle CI](www.circleci.com) - Cloud-based CI/CD service
- [Amazon AWS](https://aws.amazon.com/) - Cloud services
- [AWS CLI](https://aws.amazon.com/cli/) - Command-line tool for AWS
- [Elastic Kubernetes Service](https://aws.amazon.com/eks/) - AWS service to build and scale Kubernetes clusters
- [EKSCTL] (https://eksctl.io) - The official CLI for Amazon EKS
- [Docker] (www.docker.com) - Containerization software


### License
[License](LICENSE.md)
