# jupyter-spark Docker container

## Setup
- If you'll need to load a dataset, you can add the files inside the data folder or update the volumes in the docker-compose.yml pointing to where your data directory is.
- If you'll need to add some notebooks, you can add them in the notebooks directory, there's where your notebooks will be stored. 

## Running
To start the docker container, simply run this command:
```
docker-compose up --build
```
This will download all required dependencies and start the Jupyter notebook.

