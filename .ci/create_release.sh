#!/bin/sh

version=$(cargo metadata --format-version=1 | jq --raw-output '.packages[] | select(.name | contains("raspberry_pi_wireless_bootstrap")) | .version')


distribution_dir=target/distribution
rm -r $distribution_dir
mkdir --parents $distribution_dir

out_path=$distribution_dir/raspberry_pi_wireless_bootstrap_linux_x86_64_${version}.tar.gz

cross build --release --target=x86_64-unknown-linux-gnu

tar --create --gzip \
    --file=$out_path \
    target/x86_64-unknown-linux-gnu/release/raspberry_pi_wireless_bootstrap

echo "Distribution has been built underneath:\n\n  $out_path"
echo "\nNow you need to manually upload it to a GitHub release."
