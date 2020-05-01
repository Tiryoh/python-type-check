# python-type-check

Python type checking sample

## test1

### `test1.py`

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def f1():
    return "Python"

def f2():
    return f1() + "3"

def f3():
    return f1() + 3

def foo() -> int:
  return 'string'  # whoops

if __name__ == "__main__":
    f1()
    f2()
    f3()
```

### result

```
$ ./run.sh >> README.md 2>&1
====== pytype ======
ninja: Entering directory `/.pytype'
[1/1] check est1
FAILED: /.pytype/pyi/est1.pyi 
/usr/local/bin/python -m pytype.single --imports_info /.pytype/imports/est1.imports --module-name est1 -V 3.6 -o /.pytype/pyi/est1.pyi --analyze-annotated --nofail --quick /test1.py
File "/test1.py", line 11, in f3: unsupported operand type(s) for +: 'str' and 'int' [unsupported-operands]
  Function __add__ on str expects str
File "/test1.py", line 14, in foo: bad option in return type [bad-return-type]
           Expected: int
  Actually returned: str

For more details, see https://google.github.io/pytype/errors.html.
ninja: build stopped: subcommand failed.
Computing dependencies
Analyzing 1 sources with 0 local dependencies
====== mypy ======
test1.py:14: error: Incompatible return value type (got "str", expected "int")
Found 1 error in 1 file (checked 1 source file)
====== pyright ======
typingsPath /typings is not a valid directory.
Searching for source files
Found 1 source file
/test1.py
  11:12 - error: Operator "+" not supported for types "Literal['Python']" and "Literal[3]" (reportGeneralTypeIssues)
  14:10 - error: Expression of type "Literal['string']" cannot be assigned to return type "int"
  "str" is incompatible with "int" (reportGeneralTypeIssues)
2 errors, 0 warnings 
Completed in 0.643sec
====== pyre ======
Setting up a `.pyre_configuration` with `pyre init` may reduce overhead.
2020-05-01 07:41:50,721 DEBUG Running `/usr/local/bin/pyre.bin check -logging-sections parser,-progress -project-root / -log-directory /.pyre -filter-directories /pyre -workers 4 -ignore-all-errors /.pyre -search-path /usr/local/lib/pyre_check/typeshed/stdlib/3.7,/usr/local/lib/pyre_check/typeshed/stdlib/3.6,/usr/local/lib/pyre_check/typeshed/stdlib/3,/usr/local/lib/pyre_check/typeshed/stdlib/2and3,/usr/local/lib/pyre_check/typeshed/third_party/3,/usr/local/lib/pyre_check/typeshed/third_party/2and3 /pyre`
2020-05-01 07:41:50,725 DEBUG Registering process with pid 6 in pid file `/.pyre/pid_files/check-6.pid`
2020-05-01 07:41:50,780 PERFORMANCE Module tracker built: 0.040543s
2020-05-01 07:41:50,781 INFO Parsing 925 stubs and sources...
2020-05-01 07:41:51,727 PERFORMANCE Sources parsed: 0.947001s
2020-05-01 07:41:51,727 INFO Building type environment...
2020-05-01 07:41:52,062 INFO Updating is from empty stub result Environment
2020-05-01 07:41:52,063 INFO Updating Alias Environment
2020-05-01 07:41:52,063 INFO Updating Edges Environment
2020-05-01 07:41:52,063 INFO Updating Undecorated functions Environment
2020-05-01 07:41:52,063 INFO Updating Class metadata Environment
2020-05-01 07:41:52,063 INFO Updating parse annotation Environment
2020-05-01 07:41:52,063 INFO Updating attributes Environment
2020-05-01 07:41:52,063 INFO Updating Global Environment
2020-05-01 07:41:52,063 INFO Updating Global Locations Environment
2020-05-01 07:41:52,064 PERFORMANCE Full environment built: 0.335519s
2020-05-01 07:41:52,165 INFO Checking 5 functions...
2020-05-01 07:41:52,182 PERFORMANCE Check_TypeCheck: 0.017821s
2020-05-01 07:41:52,183 MEMORY Shared memory size post-typecheck (size: 13)
2020-05-01 07:41:52,274 PERFORMANCE Check: 1.535846s
2020-05-01 07:41:52,278 DEBUG Removing pid file: `/.pyre/pid_files/check-6.pid`
2020-05-01 07:41:52,296 ERROR Found 1 type error!
pyre/test1.py:14:2 Incompatible return type [7]: Expected `int` but got `str`.
```
