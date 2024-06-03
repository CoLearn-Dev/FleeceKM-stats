if [ -d "./data/google-natural-questions" ]; then
    echo "Dataset already downloaded"
    exit 0
fi

mkdir -p ./data/google-natural-questions

wget https://storage.cloud.google.com/natural_questions/v1.0-simplified/simplified-nq-train.jsonl.gz -P ./data/google-natural-questions

gzip -dkc ./data/google-natural-questions/simplified-nq-train.jsonl.gz > ./data/google-natural-questions/simplified-nq-train.jsonl

gsutil -m cp -R gs://natural_questions/v1.0 ./data/google-natural-questions

src_dirs=(
    "./data/google-natural-questions/v1.0/dev/"
)

python ./GoogleNQ/simplify_nq_data.py --data_dir ./data/google-natural-questions/v1.0/dev/

# rm -rf "$dest_dir"v1.0