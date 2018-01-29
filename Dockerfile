FROM rootproject/root-ubuntu16

ENV USERNAME oliver
RUN useradd -m $USERNAME  
RUN echo "$USERNAME:$USERNAME" | chpasswd  
RUN usermod --shell /bin/bash $USERNAME  
RUN usermod -aG sudo $USERNAME  
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME  
RUN chmod 0440 /etc/sudoers.d/$USERNAME  
# Replace 1000 with your user/group id
RUN usermod  --uid 1000 $USERNAME  
RUN groupmod --gid 1001 $USERNAME

CMD ["/bin/bash"]
