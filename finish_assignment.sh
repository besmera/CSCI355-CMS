#!/bin/sh

echo "Adding all work to be saved"
git add .

echo "Saving work..."
git commit -a -m "Finished checkpoint"

echo "Closing assignment"
git checkout master