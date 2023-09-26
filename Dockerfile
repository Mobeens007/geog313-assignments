FROM continuumio/miniconda3:22.11.1
# Copy the environment.yml file into the container
COPY environment.yml .
RUN conda env create -f environment.yml
# Activate the Conda environment
RUN echo "conda activate a2-env" >> ~/.bashrc
ENV PATH="$PATH:/opt/conda/envs/a2-env/bin"
# Create a non-root user and switch to that user
RUN useradd -m jupyteruser
USER jupyteruser
# Set the working directory to /home/jupyteruser
#WORKDIR /root/geog313-assignments/assignment-2
WORKDIR /home/jupyteruser
# Expose the JupyterLab port
EXPOSE 8888
# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
# docker run -it -p 8888:8888 -v /root/geog313-assignments/assignment-2:/home/jupyteruser assign2
