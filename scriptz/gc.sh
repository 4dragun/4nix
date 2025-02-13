#!/usr/bin/env bash

cd ~/4nix
echo " GIT COMMIT AUTOMATION STARTED..."
git add .
read -p "enter commit message: " mas
git commit -m "$mas"
git push origin main
echo " GIT COMMIT AUTOMATION FINISHED..."
