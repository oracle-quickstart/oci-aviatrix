#!/usr/bin/env bash

# Builds mkpl .zip for ORM. Uses local copy of existing TF.
# Replaces: variables.tf
# Adds: mkpl-schema.yaml, image_subscription.tf
# Output: $out_file

out_file="aviatrix-byol-5.0.1.zip"

echo "cleanup"
rm -rf ./tmp_package
rm $out_file

echo "Creating tmp dir...."
mkdir ./tmp_package

echo "Copying files to tmp dir...."
cp -v ./* ./tmp_package/
echo "Copying terraform-modules directory to tmp dir...."
cp -rv ../../terraform-modules ./tmp_package

echo "Removing provider.tf...."
rm ./tmp_package/provider.tf

echo "Removing .terraform"
rm -rf ./tmp_package/.terraform

echo "Removing statefile and tfvars"
rm ./tmp_package/terraform.tfstate*
rm ./tmp_package/terraform.tfvars
rm ./tmp_package/*.sh

echo "Creating $out_file ...."
cd tmp_package
zip -r $out_file *
cd ..
mv tmp_package/$out_file ./

echo "Deleting tmp dir...."
rm -rf ./tmp_package


echo "Listing content of $out_file"
unzip -l ./$out_file
