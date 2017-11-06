FROM microsoft/dotnet:2-sdk

WORKDIR /integration

# restore

COPY integration.csproj .
RUN dotnet restore

# copy source

COPY . .

ENTRYPOINT ["dotnet", "test"]