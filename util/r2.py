#!/usr/bin/env python3

import r2pipe
import json
import re

class FunctionExam:
    def __init__ (self):
        self.r2 = r2pipe.open("./p5.bin")
        self.r2.cmd("aaaa")
        self.functions = self.r2.cmd("aflj")
        self.jsonfunctions = json.loads(self.functions)

    def find_functions(self):
        print("[~] - Finding dangerous functions...")
        for jsonfunc in self.jsonfunctions:
            if(re.search("^function\_8.+aa$", jsonfunc["name"]) != None):
                print("[~] - Call for {}".format(jsonfunc["name"]))
                    
        print("[~] - Done!")

f1 = FunctionExam()
f1.find_functions()
