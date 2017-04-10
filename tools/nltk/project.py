import nltk
from collections import defaultdict
from nltk.stem.snowball import EnglishStemmer  # Assuming we're working with English
from nltk.stem.porter import *
import os

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
        print self.unique_id
        self.unique_id += 1           

def create_corpus():
    index = Index(nltk.word_tokenize, EnglishStemmer(), nltk.corpus.stopwords.words('english'))

    doc_path = "./documents"
    for line in os.listdir(doc_path):
        with open(doc_path + "/" + line, "r") as fr: 
            print "documents/%s"%line,
            data = fr.read()
            index.add(data)

    with open("./inverted_index_file", "w") as fw:
        for key in index.index:
            fw.write(key + "::" + " ".join([ str(x) for x in index.index[key]]) + "\n")

def usage():
    print "1 : tf with cosine"
    print "2 : tf with Jaccard"
    print "3 : tf-idf with cosine"
    print "4 : tf-idf with Jaccard"

def main():
    while True:
        usage()
        opt = raw_input("Enter your option:")
        query = raw_input("Enter your query:")
        print "opt=%s"%opt, "query=%s"%query
        index_query = Index(nltk.word_tokenize, EnglishStemmer(), nltk.corpus.stopwords.words('english'))
        index_query.add(query)
        print index_query.index

if __name__ == "__main__":
    main()
