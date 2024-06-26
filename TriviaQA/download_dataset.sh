if [ ! -d "data" ]; then
  mkdir data
fi

if [ ! -d "data/triviaqa-unfiltered" ]; then
  wget https://nlp.cs.washington.edu/triviaqa/data/triviaqa-unfiltered.tar.gz -P data/
  tar -xvzf data/triviaqa-unfiltered.tar.gz -C data/ 
  rm data/triviaqa-unfiltered.tar.gz
fi
