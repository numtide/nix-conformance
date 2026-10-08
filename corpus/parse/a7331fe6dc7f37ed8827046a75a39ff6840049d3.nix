let
  versions = builtins.fromJSON (builtins.readFile ./versions.json);
in
{ callPackage, lib, ... }:
let
  latestVersion = lib.last (builtins.sort lib.versionOlder (builtins.attrNames versions));
  escapeVersion = builtins.replaceStrings [ "." ] [ "_" ];
  packages = lib.mapAttrs' (version: value: {
  buildPythonPackage,
  callPackage,
  fetchFromGitHub,
  lib,
  fetchpatch2,

  # build-system
  hatchling,

  # dependencies
  executing,
  opentelemetry-exporter-otlp-proto-http,
  opentelemetry-instrumentation,
  opentelemetry-sdk,
  protobuf,
  rich,
  tomli,
  typing-extensions,

  # optional dependencies
  opentelemetry-instrumentation-aiohttp-client,
  opentelemetry-instrumentation-asgi,
  opentelemetry-instrumentation-celery,
  opentelemetry-instrumentation-django,
  opentelemmentation-asgi,
  opentelemetry-instrumentation-celery,
  opentelemetry-instrumentation-django,
  opentelemetry-instrumentation-fastapi,
  opentelemetry-instrumentation-flask,
  opentelemetry-instrumentation-httpx,
  opentelemetry-instrumentation-psycopg,
  opentelemetry-instrumentation-psycopg2,
  opentelemetry-instrumentation-redis,
  opentelemetry-instrumentation-requests,
  opentelemetry-instrumentation-sqlalchemy,
  opentelemetry-instrumentation-sqlite3,
  opentelemetry-instrumentation-system-metrics,
  opentelemetry-instrumentation-wsgi,
  packaging,

  # test dependencies
  anthropic,
  anyio,
  asyncpg,
  cloudpickle,
  dirty-equals,
  google-genai,
  inline-snapshot,
  litellm,
  logfire-api,
  loguru,
  mysql-connector-python,
  openai-agents,
  pindas,
  pymongo,
  pymysql,
  pytest-django,
  pytest-vcr,
  pytest-xdist,
  pytestCheckHook,
  redis,
  requests-mock,
  sqlmodel,
  structlog,
  testcontainers,
}:

buildPythonetry-instrumentation-fastapi,
  opentelemetry-instrumentation-flask,
  opentelemetry-instrumentation-httpx,
  opentelemetry-instrumentation-psycopg,
  opentelemetry-instrumentation-psycopg2,
  opentelemetry-instrumentation-redis,
  pOSL32lPM=";
      excludes = [
        "uv.lock"pentelemetry-instrumentation-aws-lambda ];
    celery = [ opentelemetry-instrumentation-celery ];
    django = [
      [ opentelemetrVersion latestVersion}" pa# aiohttp-serveckages;
  }
)
r = [ opentelemetry-instrumentation-aioh