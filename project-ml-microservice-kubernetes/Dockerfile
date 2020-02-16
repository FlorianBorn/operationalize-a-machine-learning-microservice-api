FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
RUN mkdir -p /udacity/

## Step 2:
# Copy source code to working directory
COPY app.py /udacity/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip -r /udacity/requirements.txt

## Step 4:
# Expose port 80
# what's the use of EXPOSE?
# See: https://forums.docker.com/t/what-is-the-use-of-expose-in-docker-file/37726/3
EXPOSE 80

## Step 5:
# Run app.py at container launch
RUN /udacity/app.py
