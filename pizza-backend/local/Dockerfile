FROM mcr.microsoft.com/mssql/server:2019-CU10-ubuntu-20.04
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=SaPassword1

COPY --chmod=555 init-db.sh /opt/

ENTRYPOINT [ "/opt/init-db.sh" ]
CMD [ "/opt/mssql/bin/sqlservr" ]