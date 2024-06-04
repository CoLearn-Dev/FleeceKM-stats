if [ ! -d "data/hotpotqa-fullwiki" ]; then
  mkdir -p data/hotpotqa-fullwiki
fi

if [ ! -f "data/hotpotqa-fullwiki/hotpot_dev_fullwiki_v1.json" ]; then
    wget http://curtis.ml.cmu.edu/datasets/hotpot/hotpot_dev_fullwiki_v1.json -P data/hotpotqa-fullwiki/
fi

if [ ! -f "data/hotpotqa-fullwiki/hotpot_train_v1.1.json" ]; then
    wget http://curtis.ml.cmu.edu/datasets/hotpot/hotpot_train_v1.1.json -P data/hotpotqa-fullwiki/
fi
