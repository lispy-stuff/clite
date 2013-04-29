Welcome to **clite**, a lite weight testing framework for Common Lisp.

Start by defininig your tests using the *TEST*-macro:

```lisp
(test (:blog)
      (let ((blog (make-blog ...)))
           (test (:make-blog)
                 ...
                 (testp blog "make-blog returns valid object"))
           (test (:add :post)
                  ...
                  (test= (post-count blog) 1
                         "post-count is increased when adding")
                  ...)
           (test (:remove :post)
                  ...
                  (test= (post-count blog) 0
                         "post-count is decreased when removing")
                  ...)))
```

The first parameter to *TEST* is a list of tags that is used to address specific tests when running.

Besides *TESTP* for simple conditions and *TEST=* for numbers, the library provides *TEST-STRING=* for strings, *TEST-EQ*, *TEST-EQL*, *TEST-EQUAL*, *TEST-EQUALP*, *TEST-PASS* to signal a passed test and *TEST-FAIL* to signal failure. The test description is optional, in addition to serving as documentation it's used for signalling conditions on test failure.

If you don't specify any tags when calling *RUN-TESTS* it runs all tests defined since clite was loaded:

```
> (run-tests)
Testing NIL...Done!
3
```

*RUN-TESTS* returns the number of test forms (*TESTP*, *TEST=* etc.) processed.

Nested *TEST* forms allows for an easy way to share data between tests and greater precision when controlling which tests should run:

```
> (run-tests :blog :add :post)
Testing (:BLOG :ADD :POST).Done!
1
```

Separating the :add, :remove and :post tags allows for easy running of all tests having something to do with blog posts:

```
> (run-tests :blog :post)
Testing (:BLOG :POST)..Done!
2
```

Peace,
Andreas