# cicd-microservice-py-app
Install Flask:
```pip install Flask```

Run the Microservice:

```python app.py```

Test the Microservice:
```curl http://127.0.0.1:5000/```

Build and run the Docker container:

```
docker build -t python-microservice .
docker run -p 5000:5000 python-microservice
```

if any error,use the below command to login to docker conatiner:
```docker run -it --rm python-microservice /bin/bash```

execut the unit test using the below command:

```python -m unittest test_app.py```

