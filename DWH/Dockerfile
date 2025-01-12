FROM ubuntu:latest

# Install necessary packages (wget if needed)
RUN apt-get update && apt-get install -y wget openjdk-11-jdk python3 python3-venv python3-pip

RUN python3 -m venv /opt/venv

ENV VIRTUAL_ENV=/opt/venv
ENV PATH=$VIRTUAL_ENV/bin:$PATH
RUN pip install --upgrade pip

RUN pip3 install dbt-core

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64
ENV PATH=$PATH:$JAVA_HOME/bin

# Copy the tar file into the image (if it's local)
COPY streamsets-datacollector-common-3.22.3.tar /opt/

# Or download it directly (if it's remote)
#RUN wget -O /tmp/streamsets-datacollector-common-3.22.3.tar <download_url>

# Extract the tar file
RUN tar -xf /opt/streamsets-datacollector-common-3.22.3.tar -C /opt/ # Extract to /opt/

# Clean up the tar file (optional)
RUN rm /opt/streamsets-datacollector-common-3.22.3.tar

# Set the working directory (optional)
WORKDIR /opt/streamsets-datacollector-3.22.3

# Set your command or entrypoint
CMD ["./bin/streamsets", "dc"]