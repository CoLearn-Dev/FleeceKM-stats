import nltk
from collections import Counter
from nltk.util import ngrams
from tqdm.notebook import tqdm
import pandas as pd

nltk.download("punkt")


def get_top_ngrams(questions, n, top_k=None):
    ngram_counter = Counter()
    for question in questions:
        tokens = nltk.word_tokenize(question.lower())
        ngram_counter.update(ngrams(tokens, n))
    total = sum(ngram_counter.values())
    if not top_k:
        top_k = len(ngram_counter)
    return ngram_counter.most_common(top_k), total


def process_ngrams(questions, n_values, top_k=None):
    df_ngram = pd.DataFrame()
    for n in tqdm(n_values, desc="Processing n-grams"):
        top_ngrams, total = get_top_ngrams(questions, n, top_k)
        ngram_data = [
            (n, rank + 1, " ".join(ngram), freq, freq / total)
            for rank, (ngram, freq) in enumerate(top_ngrams)
        ]
        df_temp = pd.DataFrame(
            ngram_data,
            columns=["n", "rank", "ngram", "frequency", "relative_frequency"],
        )
        df_ngram = pd.concat([df_ngram, df_temp], ignore_index=True)
    return df_ngram


def calculate_ratios(df_ngram, n_values, k_values):
    ratio_sums = {k: [] for k in k_values}
    top_1_percent_ratios = []
    total_counts = []

    for n in n_values:
        subset = df_ngram[df_ngram["n"] == n]
        ratios = subset["relative_frequency"].tolist()
        total_count = len(ratios)
        total_counts.append(total_count)
        sorted_ratios = sorted(ratios, reverse=True)

        top_1_percent_count = max(1, total_count // 100)
        top_1_percent_ratios.append(sum(sorted_ratios[:top_1_percent_count]))

        for k in k_values:
            top_k_ratios = sorted_ratios[:k]
            ratio_sums[k].append(sum(top_k_ratios))

    return ratio_sums, top_1_percent_ratios, total_counts
