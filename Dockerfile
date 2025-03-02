COPY install.sh /app/install.sh
RUN chmod +x /app/install.sh && /app/install.sh
chmod +x install.sh && ./install.sh
