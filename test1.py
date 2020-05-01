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

