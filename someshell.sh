#!/bin/bash
someVar="SomE StrING Sample"

newVar="$(tr [A-Z] [a-z] <<< $someVar)"
newVar2="$(tr [a-z] [A-Z] <<< $someVar)"

echo $someVar | tr  a-z A-Z
echo $someVar | tr  A-Z a-z

echo $newVar
echo $newVar2