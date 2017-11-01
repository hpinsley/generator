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

# publish

# Runtime stage
