FROM mariadb

# Copy SQL script to initialize database
COPY ./create-database.sql /docker-entrypoint-initdb.d/

# Copy SQL script to populate database
COPY ./populate-database.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
