if [ -d "./data/google-natural-questions/v1.0" ]; then
    echo "Dataset already downloaded"
else
    mkdir -p ./data/google-natural-questions

    gsutil -m cp -R gs://natural_questions/v1.0 ./data/google-natural-questions
fi

if [ -f "./data/google-natural-questions/simplified-nq-train.jsonl" ]; then
    echo "Dataset already downloaded"
else
    gsutil -m cp gs://natural_questions/v1.0-simplified/simplified-nq-train.jsonl.gz ./data/google-natural-questions/simplified-nq-train.jsonl.gz

    gzip -d ./data/google-natural-questions/simplified-nq-train.jsonl.gz
fi

if [ -f "./data/google-natural-questions/simplified-nq-dev.jsonl" ]; then
    echo "Dataset already downloaded"
else
    python ./GoogleNQ/simplify_nq_data.py --data_dir ./data/google-natural-questions/v1.0/dev --output_dir ./data/google-natural-questions/

    gzip -d ./data/google-natural-questions/simplified-nq-dev.jsonl.gz
fi
