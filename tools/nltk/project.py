import nltk
from collections import defaultdict
from nltk.stem.snowball import EnglishStemmer  # Assuming we're working with English
from nltk.stem.porter import *

class Index:
    """ Inverted index datastructure """

    def __init__(self, tokenizer, stemmer=None, stopwords=None):
        """
            tokenizer   -- NLTK compatible tokenizer function
            stemmer     -- NLTK compatible stemmer 
            stopwords   -- list of ignored words
        """
        self.tokenizer = tokenizer
        self.stemmer = stemmer
        self.index = defaultdict(list)
        self.documents = {}
        self.unique_id = 0
        if not stopwords:
            self.stopwords = set()
        else:
            self.stopwords = set(stopwords)

    def lookup(self, word):
        """
            Lookup a word in the index
        """
        word = word.lower()
        if self.stemmer:
            word = self.stemmer.stem(word)

        return [self.__documents.get(id, None) for id in self.index.get(word)]

    def add(self, document):
        """
            Add a document string to the index
        """
        for token in [t.lower() for t in nltk.word_tokenize(document)]:
            if token in self.stopwords:
                continue

            if self.stemmer:
                token = self.stemmer.stem(token)

            if self.unique_id not in self.index[token]:
                self.index[token].append(self.unique_id)

        self.documents[self.unique_id] = document
        self.unique_id += 1           


index = Index(nltk.word_tokenize, EnglishStemmer(), nltk.corpus.stopwords.words('english'))
fr = open("documents/224415.product")
data = fr.read()
index.add(data)
fr = open("documents/128297.product")
data = fr.read()
index.add(data)
print index.index



