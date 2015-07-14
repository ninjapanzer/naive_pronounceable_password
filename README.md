### To run
- `ruby app.rb`

### A little bit about the problem

To produce a pronounceable password you need to know the likely hood that a letter will appear after the next letter. We can prepare this information by constructing some probability data from a corpus of words. In this example we are just using the nouns from the wordnet corpus. I have preprocessed this data so its a single word per line. We look at each letter in successon until the end of the word and record the pairs of letters and how often those pairs occur. With this information we can given a seed letter build a chain of letters that you should be able to pronounce normally. What is cool is this corpus can be replace with a copus from any language and generated passwords should be pronounceable in the given language of the corpus.

### Some improvments and food for thought

Because "THERE CAN BE ONLY ONE" most common letter many passwords of a certain length will start looking the same. We can apply a bias so there is greater variance with generated passwords.

Also we could inprove our algorithm to use a 2 letter look ahead method or a 1 behind and 1 head strategy to build even more realistic words.