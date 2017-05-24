import nltk
from collections import defaultdict
from nltk.stem.snowball import EnglishStemmer  # Assuming we're working with English
from nltk.stem.porter import *
import pickle
import os
from numpy.linalg import norm
import operator

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
    def add_token(self, tokens, unique_id):
        for token in tokens:
            if token in self.stopwords:
                continue

            if self.stemmer:
                token = self.stemmer.stem(token)

            if unique_id not in self.index[token].keys():
                self.index[token][unique_id] = 0
            self.index[token][unique_id] += 1

            if self.documents[unique_id].has_key(token) == False:
                self.documents[unique_id][token] = 0
            self.documents[unique_id][token] += 1

    def add(self, document):
        """
            Add a document string to the index
        """
        self.documents[self.unique_id] = {}
        for token in [t.lower() for t in nltk.word_tokenize(document)]:
            if token in self.stopwords:
                continue

            if self.stemmer:
                token = self.stemmer.stem(token)

            if self.unique_id not in self.index[token].keys():
                self.index[token][self.unique_id] = 0
            self.index[token][self.unique_id] += 1

            if self.documents[self.unique_id].has_key(token) == False:
                self.documents[self.unique_id][token] = 0
            self.documents[self.unique_id][token] += 1


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

    pickle.dump( index, open( "./inverted_index_file", "wb" ) )

def usage():
    print "1 : tf with cosine"
    print "2 : tf with Jaccard"
    print "3 : tf-idf with cosine"
    print "4 : tf-idf with Jaccard"
    print "5 : tf-idf with Jaccard(Relevance Feedback)"

def tf_cosine(q, c):
    ret = {}
    s = 0
    for word in q.index.keys():
        for d,val in c.index[word].items():
            if ret.has_key(d) == False:
                ret[d] = 0
            ret[d] += (q.index[word][0] * val)

    q_vec = [val for word,val in q.documents[0].items()]
    for d in ret.keys():
        d_vec = [val for word,val in c.documents[d].items()]
        #print d, ret[d], q_vec, d_vec
        ret[d] = ret[d]/(norm(q_vec)*norm(d_vec))
    return ret

def tf_jaccard(q, c):
    ret = {}
    s = 0
    for word in q.index.keys():
        for d,val in c.index[word].items():
            if ret.has_key(d) == False:
                ret[d] = 0
            ret[d] += 1     # intersection

    q_set = len(q.documents[0].keys())
    for d in ret.keys():
        d_set = len(c.documents[d].keys())
        #print d, ret[d], q_set, d_set
        ret[d] = float(ret[d]) / (q_set + d_set - ret[d])
    return ret

def tfidf_cosine(q, c):
    ret = {}
    s = 0
    for word in q.index.keys():
        for d,val in c.index[word].items():
            if ret.has_key(d) == False:
                ret[d] = 0
            val = float(val) / len(c.index[word].keys())   # tf / idf
            ret[d] += (q.index[word][0] * val)

    q_vec = [val for word,val in q.documents[0].items()]
    for d in ret.keys():
        d_vec = [float(val) / len(c.index[word].keys()) for word,val in c.documents[d].items()]
        #print d, ret[d], q_vec, d_vec
        ret[d] = ret[d]/(norm(q_vec)*norm(d_vec))
    return ret

def tfidf_jaccard(q, c):
    ret = {}
    s = 0
    for word in q.index.keys():
        for d,val in c.index[word].items():
            if ret.has_key(d) == False:
                ret[d] = 0
            ret[d] += 1     # intersection

    q_set = len(q.documents[0].keys())
    for d in ret.keys():
        d_set = len(c.documents[d].keys())
        #print d, ret[d], q_set, d_set
        ret[d] = float(ret[d]) / (q_set + d_set - ret[d])
    return ret

def output(ret, doc_map):
    sr = sorted(ret.items(), key=operator.itemgetter(1))
    print "\tDocId\tScore"
    for item in sr[::-1][:10]:
        print "\t%s\t%f"%(doc_map[str(item[0])], item[1])

def get_relev_str(doc_path):
    ret = []
    fr = open(doc_path, "r")
    doc = fr.read()
    tokens = nltk.word_tokenize(doc)
    pos_tokens = nltk.pos_tag(tokens)
    for word in pos_tokens:
        if word[1] == "NN" or word[1] == "VB":
            ret.append(word[0])
    return ret

def get_doc_map():
    dic = {}
    with open("map_documents", "r") as fr:
        lines = fr.readlines()
        for line in lines:
            line = line.strip()
            key,value = line.split(None, 1)
            dic[value] = key
    return dic

def main():
    doc_map = get_doc_map()
    index = pickle.load(open( "inverted_index_file", "rb" ))
    while True:
        usage()
        opt = raw_input("Enter your option:")
        query = raw_input("Enter your query:")
        print "opt=%s"%opt, "query=%s"%query
        index_query = Index(nltk.word_tokenize, EnglishStemmer(), nltk.corpus.stopwords.words('english'))
        index_query.add(query)
        if opt == "1" :
            ret = tf_cosine(index_query, index)
        elif opt == "2" :
            ret = tf_jaccard(index_query, index)
        elif opt == "3":
            ret = tfidf_cosine(index_query, index)
        elif opt == "4":
            ret = tfidf_jaccard(index_query, index)
        elif opt == "5":
            while True:
                ret = tfidf_jaccard(index_query, index)
                output(ret, doc_map)
                doc_path = raw_input("Please Enter doc path for relevance feedback:")
                relev_toks = get_relev_str(doc_path)
                index_query.add_token(relev_toks, 0)
        else:
            pass

        output(ret, doc_map)
if __name__ == "__main__":
    #create_corpus()
    main()
    #print get_relev_str("documents/159196.product")
