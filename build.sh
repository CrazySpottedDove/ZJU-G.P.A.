#!/bin/bash
cd ./main || exit
compile_time=11

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=./build -interaction=nonstopmode \
  -file-line-error ./main.tex
done
mv ./build/main.pdf ./build/ZJU-GPA.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=./build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{dark}{Physics_H_Notes}\input{./main.tex}"
done
mv ./build/main.pdf ./build/ZJU-GPA-dark.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=./build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{dark,stable}{Physics_H_Notes}\input{./main.tex}"
done
mv ./build/main.pdf ./build/ZJU-GPA-dark-stable.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=./build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{stable}{Physics_H_Notes}\input{./main.tex}"
done
mv ./build/main.pdf ./build/ZJU-GPA-stable.pdf