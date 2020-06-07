
name = StudyBar
viewer = chrome.exe

.PHONY: afterinstall
afterinstall:
	rm -rf TPL *.tpl main.py *.tar drawboxes.lua
	echo '\\documentclass{peterlitsdoc}' > $(name).tex
	echo '' >> $(name).tex
	echo '\\begin{document}' >> $(name).tex
	echo '\\end{document}' >> $(name).tex

.PHONY: pomo
pomo:
	@./pomo l
	@echo "Enter the task number"
	@bash -c "read choice; ./pomo b \$${choice}"

.PHONY: pomonew
	@echo "Enter the task name"
	@bash -c "read name; ./pomo c \$${name}"

.PHONY: clean
clean:
	-rm *.aux
	-rm *.log
	-rm *.toc
	-rm *.out

.PHONY: run
run:
	lualatex $(name).tex

.PHONY: run2
run2:
	lualatex $(name).tex
	lualatex $(name).tex

.PHONY: look
look:
	$(viewer) $(name).pdf

.PHONY: funk
fuck: run look

.PHONY: fuck2
fuck2: run2 look

