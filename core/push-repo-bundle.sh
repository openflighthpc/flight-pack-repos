#!/bin/bash
cd "$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)"
if [ -f core.tar.bz2 ]; then
  aws --profile flight s3 cp --acl public-read core.tar.bz2 s3://alces-flight-packs/v1/core.tar.bz2
  aws --profile flight s3 cp --acl public-read core.yml s3://alces-flight-packs/v1/core.yml
  shopt -s nullglob
  for a in packs/*.tar.bz2; do
    aws --profile flight s3 cp --acl public-read $a s3://alces-flight-packs/v1/$(basename "$a")
  done
else
  echo "$0: repo bundle not found; run create-repo-bundle.sh first?"
fi
