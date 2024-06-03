if [ -d "./data/google-natural-questions/v1.0" ]; then
    echo "Raw Dataset already downloaded"
else
    mkdir -p ./data/google-natural-questions

    gsutil -m cp -R gs://natural_questions/v1.0 ./data/google-natural-questions
fi

if [ -f "./data/google-natural-questions/simplified-nq-train.jsonl" ]; then
    echo "Train dataset already simplified"
else
    python ./GoogleNQ/simplify_nq_data.py --data_dir ./data/google-natural-questions/v1.0/train --output_dir ./data/google-natural-questions/

    gzip -d ./data/google-natural-questions/simplified-nq-train.jsonl.gz
fi

if [ -f "./data/google-natural-questions/simplified-nq-dev.jsonl" ]; then
    echo "Dev dataset already simplified"
else
    python ./GoogleNQ/simplify_nq_data.py --data_dir ./data/google-natural-questions/v1.0/dev --output_dir ./data/google-natural-questions/

    gzip -d ./data/google-natural-questions/simplified-nq-dev.jsonl.gz
fi
