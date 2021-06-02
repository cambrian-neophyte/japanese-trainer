# japanese-trainer

A command line interface program for learning japanese words. I am neither proficient in racket, nor japanese, so use this at your own risk.


# Usage

~~Download the binary~~  Currently, there are no binaries available. To run the program with racket, use the following command
```sh
$ racket main.rkt
```

# Requirements / Dependencies 

* Racket 7.2 (older versions might work, or not)

# code structure

Currently words have to be entered in racket files such as `verbs.rkt` `nouns.rkt` etc. most of the actual program code is contained in `foundations.rkt` and `main.rkt`.


* `hiragana.rkt` a dictionary for romaji->hiragana strings
* `foundations.rkt` functions required for parsing word lists and romaji->hiragana conversion
* `main.rkt` the IO loop 
* `verbs.rkt` list of verbs japanese->english
