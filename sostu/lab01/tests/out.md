```
huanli@ThinkCentre$ ../utils/recm -u A -m c ../data/matrix.txt
p(A, c) = 0.742
```
```
huanli@ThinkCentre$ ../utils/recm -u A -m e ../data/matrix.txt
p(A, e) = 0.742
```
```
huanli@ThinkCentre$ ../utils/recm -u B -m b ../data/matrix.txt
p(B, b) = 0.408
```
```
huanli@ThinkCentre$ ../utils/recm -v ../data/matrix.txt
====== 0 - 用户商品打分表 ======
{
    "A": {
        "a": 1,
        "b": 1,
        "c": 0,
        "d": 1,
        "e": 0
    },
    "B": {
        "a": 1,
        "b": 0,
        "c": 1,
        "d": 0,
        "e": 0
    },
    "C": {
        "a": 0,
        "b": 1,
        "c": 0,
        "d": 0,
        "e": 1
    },
    "D": {
        "a": 0,
        "b": 0,
        "c": 1,
        "d": 1,
        "e": 1
    }
}
====== 1 - 商品用户倒排表 ======
{
    "a": [
        "A",
        "B"
    ],
    "b": [
        "A",
        "C"
    ],
    "c": [
        "B",
        "D"
    ],
    "d": [
        "A",
        "D"
    ],
    "e": [
        "C",
        "D"
    ]
}
====== 2 - 用户交集表 ======
{
    "A": {
        "A": 0,
        "B": 1,
        "C": 1,
        "D": 1
    },
    "B": {
        "A": 1,
        "B": 0,
        "C": 0,
        "D": 1
    },
    "C": {
        "A": 1,
        "B": 0,
        "C": 0,
        "D": 1
    },
    "D": {
        "A": 1,
        "B": 1,
        "C": 1,
        "D": 0
    }
}
====== 3 - 用户相似度表 ======
{
    "A": {
        "A": 0.0,
        "B": 0.4082482904638631,
        "C": 0.4082482904638631,
        "D": 0.3333333333333333
    },
    "B": {
        "A": 0.4082482904638631,
        "B": 0.0,
        "C": 0.0,
        "D": 0.4082482904638631
    },
    "C": {
        "A": 0.4082482904638631,
        "B": 0.0,
        "C": 0.0,
        "D": 0.4082482904638631
    },
    "D": {
        "A": 0.3333333333333333,
        "B": 0.4082482904638631,
        "C": 0.4082482904638631,
        "D": 0.0
    }
}
p(A, a) = 0.408
p(A, b) = 0.408
p(A, c) = 0.742
p(A, d) = 0.333
p(A, e) = 0.742
p(B, a) = 0.408
p(B, b) = 0.408
p(B, c) = 0.408
p(B, d) = 0.816
p(B, e) = 0.408
p(C, a) = 0.408
p(C, b) = 0.408
p(C, c) = 0.408
p(C, d) = 0.816
p(C, e) = 0.408
p(D, a) = 0.742
p(D, b) = 0.742
p(D, c) = 0.408
p(D, d) = 0.333
p(D, e) = 0.408
```
