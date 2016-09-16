#!/bin/bash
gdb -p $1 << END
bt
END
