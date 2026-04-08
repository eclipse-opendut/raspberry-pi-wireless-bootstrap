#!/bin/sh

set -e

version=$(cargo metadata --format-version=1 | jq --raw-output '.packages[] | select(.name | contains("raspberry_pi_wireless_bootstrap")) | .version')

targets="x86_64-apple-darwin x86_64-unknown-linux-gnu"

for target in $targets; do

    if [ $target != "x86_64-apple-darwin" ]; then
        cross build --release --target=$target
    else
        host_cpu_arch=$(rustc -vV | grep "host:")

        if [ "$host_cpu_arch" = "host: x86_64-apple-darwin" ]; then
            cargo build --release
        else
            echo "Skipping build for macOS, since we are not on a macOS system. Cross-compiling for macOS is generally not supported/allowed by Apple."
            continue;
        fi
    fi


    distribution_dir=target/distribution
    rm -r $distribution_dir || true
    mkdir --parents $distribution_dir

    out_path=$distribution_dir/raspberry_pi_wireless_bootstrap_${target}_${version}.tar.gz

    tar --create --gzip \
        --file="$out_path" \
        --directory="target/$target/release/" \
        raspberry_pi_wireless_bootstrap \
        ../../../README.md

    echo "Distribution has been built underneath:\n\n  $out_path\n"
done

echo "Now you need to manually upload the distributions to a GitHub release."
