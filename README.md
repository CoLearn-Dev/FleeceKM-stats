# ASKMe QA dataset analysis project

This project contains scripts for downloading and processing the Google Natural Questions, HotpotQA, and TriviaQA datasets, as well as Jupyter notebooks for analyzing the data. The goal of this project is to provide a starting point for researchers and developers who want to work with these datasets, by providing a simple and easy-to-use interface for downloading, processing, and analyzing the data. 

This project is a part of the ASKMe QA benchmark. 

## Project Structure

The project is organized into directories for each dataset:

- [``GoogleNQ/``](GoogleNQ/)
- [``HotpotQA/``](HotpotQA/)
- [``TriviaQA/``](TriviaQA/)

Each directory contains scripts for downloading and processing the respective dataset(``download_dataset.sh``), as well as a Jupyter notebook (``stats.ipynb``) for analyzing the data. In addition to downloading the dataset, the GoogleNQ directory's [``download_and_simplify_dataset.sh``](GoogleNQ/download_and_simplify_dataset.sh) script also simplifies it to a more manageable format that's more suitable for analysis.

Each directory also contains a ``sample.json`` or ``sample.jsonl`` file that contains a single entry from the dataset, to give an idea of the structure of the data for your convenience.

The [``data/``](data/) directory would contain the raw and processed data files for each dataset.

## Getting Started

1. Clone the repository.
2. Install the dependencies listed in [``pyproject.toml``](pyproject.toml) using poetry.

```sh
poetry install
```

3. Download and process the datasets using the scripts in the respective directories. For example, to download and process the Google Natural Questions dataset:

```sh
./GoogleNQ/download_dataset.sh
```

Note that the script requires the `gsutil` command-line tool to be installed. You can install it by following the instructions [here](https://cloud.google.com/storage/docs/gsutil_install). The rest of the datasets can be downloaded and processed in a similar manner, without any additional dependencies.

## License

This project is licensed under the Apache License 2.0, in accordance with Google's Natural Questions dataset - see the `LICENSE` file for details.