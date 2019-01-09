# Tamil Shallow Parser

## History

- This was originally developed at LTRC Lab, IIIT-Hyderabad. Available for download @ http://ltrc.iiit.ac.in/showfile.php?filename=downloads/shallow_parser.php

- Tamil Parser Source - http://ltrc.iiit.ac.in/analyzer/tamil/shallow-parser-tam-3.0.fc8.tgz
- Online Test - http://ltrc.iiit.ac.in/analyzer/tamil

## Port

This was developed sometime in 2009 and tested on Fedora 8. I was recently trying to do some Tamil NLP processing and tried to install on latest OS and didn't work. Then I grabbed Fedora 8 ISO file, configured in Hyper V and worked.

Wanted to run this on Docker with latest OS, so this can be utilized by other Tamil enthusiasts.

During my analysis found the following.

- component/binaries are not compatible with latest 64 bit OS, had to use 32 bit OS.
- Doesn't compile on latest build tool due to older CRF++ library. Had to grab the latest one @ https://taku910.github.io/crfpp/
- Find the other binary dependencies the tool used (dos2unix, for example)

## Docker

The parser can be run by following the steps

- `docker pull ithiru/tamil-shallow-parser`
- `docker run --rm -i -t ithiru/tamil-shallow-parser:latest`

By default it would display the test case output similar to one below.

```
<Sentence id="1">
1       ((      NP      <fs af='குவிப்பு,n,any,sg,any,d,,' case_name="nom"  head="குவிப்பு"  paradigm="n4"  poslcat="NM">
1.1     சொத்து  JJ      <fs af='சொத்து,n,any,sg,any,d,,' paradigm="n4"  poslcat="NM"  case_name="nom">
1.2     குவிப்பு        NN      <fs af='குவிப்பு,n,any,sg,any,d,,' name="குவிப்பு"  case_name="nom"  poslcat="NM"  paradigm="n4">
1.3     :       SYM     <fs af=':,punc,,,,,,' poslcat="NM">
        ))
2       ((      NP      <fs af='விசாரணை,n,any,sg,any,d,க்கு,kku' case_name="dat"  head="விசாரணைக்கு"  paradigm="n2"  poslcat="NM">
2.1     விசாரணைக்கு     NNP     <fs af='விசாரணை,n,any,sg,any,d,க்கு,kku' case_name="dat"  name="விசாரணைக்கு"  paradigm="n2"  poslcat="NM">
        ))
3       ((      NP      <fs af='டெல்லி,n,any,sg,any,d,,' case_name="nom"  head="டெல்லி"  paradigm="n2"  poslcat="NM">
3.1     டெல்லி  NN      <fs af='டெல்லி,n,any,sg,any,d,,' name="டெல்லி"  case_name="nom"  paradigm="n2"  poslcat="NM">
        ))
4       ((      VGNF    <fs af='செல்லம்,n,any,sg,any,d,,a' head="செல்ல"  case_name="nom"  paradigm="n13"  adj="a">
4.1     செல்ல   VM      <fs af='செல்லம்,n,any,sg,any,d,,a' adj="a"  paradigm="n13"  case_name="nom"  name="செல்ல">
        ))
5       ((      NP      <fs af='மதுகோடா,unk,,,,,,' head="மதுகோடா"  poslcat="NM">
5.1     மறுத்த  JJ      <fs af='மறு,v,any,any,any,,த்த்_அ,ww_a' poslcat="NM"  paradigm="v11"  tense="PAST"  rp="Y">
5.2     மதுகோடா NNP     <fs af='மதுகோடா,unk,,,,,,' name="மதுகோடா"  poslcat="NM">
5.3     !       SYM     <fs af='!,punc,,,,,,' poslcat="NM">
        ))
</Sentence>
```

## Parsing Texts

You can run the parser manually with your own inputs by following the steps

- `docker run --rm -i -t ithiru/tamil-shallow-parser:latest /bin/bash`
- `shallow_parser_tam < /root/app/nlp/tests/shallowparser_tam_utf.rin`

The above will dump the same output as above.

`shallow_parser_tam --help` - this will provide the following usage.

```
shallow-parser-tam version 3.0
usage : shallow_parser_tam  --mode=[debug|fast] --in_encoding=[wx|utf] --out_encoding=[wx|utf] --input=<input_file> --output=<output_file>

  --in_encoding  : Encoding of the Input Text [utf or wx]
  --out_encoding : Encoding of the Output Text [utf or wx]
  --mode         : Debug or Fast mode [debug|fast] *Default fast mode
  --input        : Input file
  --output       : Output file
                  Prepared as a part of SAMPARK (ILMT Consortium Project)
                  Author: Avinesh PVS
                  IIIT Hyderabad {shallowparser@research.iiit.ac.in}
```
