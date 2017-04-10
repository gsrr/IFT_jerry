import nltk
from collections import defaultdict
from nltk.stem.snowball import EnglishStemmer  # Assuming we're working with English
from nltk.stem.porter import *
import pickle
import os
from numpy.linalg import norm

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
        self.index = defaultdict(dict)
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

            if self.unique_id not in self.index[token].keys():
                self.index[token][self.unique_id] = 0
            self.index[token][self.unique_id] += 1

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

    pickle.dump( index.index, open( "./inverted_index_file", "wb" ) )

def usage():
    print "1 : tf with cosine"
    print "2 : tf with Jaccard"
    print "3 : tf-idf with cosine"
    print "4 : tf-idf with Jaccard"

def cosine(q, c):
    q_vec = [q[word][0] for word in q.keys()]
    print q_vec
    ret = {}
    s = 0
    for word in q.keys():
        for d in c[word]:
            if ret.has_key(d) == False:
                ret[d] = 0
            ret[d] += (q[word][0] * c[word][d])
        

def main():
    inverted_index = pickle.load(open( "inverted_index_file", "rb" ))
    while True:
        usage()
        opt = raw_input("Enter your option:")
        query = raw_input("Enter your query:")
        print "opt=%s"%opt, "query=%s"%query
        index_query = Index(nltk.word_tokenize, EnglishStemmer(), nltk.corpus.stopwords.words('english'))
        index_query.add(query)
        cosine(index_query.index, inverted_index)



if __name__ == "__main__":
    #create_corpus()
    main()
