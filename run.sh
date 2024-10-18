echo "Job starts"
sleep .5
echo "Processing..."
ruby lib/main.rb > result/out.md
echo "Done"