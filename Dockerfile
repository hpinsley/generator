# Build Stage
FROM microsoft/aspnetcore-build:latest as build-env

WORKDIR /generator

# restore

COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# copy source

COPY . .

# test

# Hack to trick the xunit runner to think it is inside of team city.
# This kicks in enhanced team city integration
ENV TEAMCITY_PROJECT_NAME=fake

RUN dotnet test tests/tests.csproj

# publish

RUN dotnet publish api/api.csproj -o /publish

# Runtime stage

FROM microsoft/aspnetcore:latest

COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT [ "dotnet", "api.dll" ]