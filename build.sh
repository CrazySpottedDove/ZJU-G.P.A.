#!/bin/bash
compile_time=11

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=build -interaction=nonstopmode \
  -file-line-error ./main/main.tex
done
mv ./main/build/main.pdf ./main/build/ZJU-GPA.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{dark}{Physics_H_Notes}\input{./main/main.tex}"
done
mv ./main/build/main.pdf ./main/build/ZJU-GPA-dark.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{dark,stable}{Physics_H_Notes}\input{./main/main.tex}"
done
mv ./main/build/main.pdf ./main/build/ZJU-GPA-dark-stable.pdf

for i in $(seq 1 $compile_time)
do
    xelatex -output-directory=build -interaction=nonstopmode \
  -file-line-error "\PassOptionsToClass{stable}{Physics_H_Notes}\input{./main/main.tex}"
done
mv ./main/build/main.pdf ./main/build/ZJU-GPA-stable.pdf