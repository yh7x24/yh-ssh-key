.PHONY: init clean
all: gpull

BRANCH := master

DATA_SUF = $(shell date +"%Y.%m.%d.%H.%M.%S")
GUP_MSG  = "Auto Commited at $(DATA_SUF)"
DEPLOY_ENV =

ifdef MSG
	GUP_MSG = "$(MSG)"
endif

ifdef HOST
	DEPLOY_ENV = THIS_HOST_NAME=$(HOST)
endif


# ####################################
# Dashboard AREA
# ####################################
status:
	@echo "GUP_MSG=$(GUP_MSG)"
	@echo "DEPLOY_ENV=$(DEPLOY_ENV)"
	git status

list:


# ####################################
# git
# ####################################
init:
yh-os-init:
	grep "yh-os-init" .git/config >/dev/null || git remote add -f $@ git@github.com:yh7x24/$@.git
	[ ! -d $@ ] && git subtree add  --prefix=roles/$@ $@ $(BRANCH) --squash || >/dev/null
gpom:
	git add .
	git commit -am $(GUP_MSG) || >/dev/null
	git push origin master
	git status
gs:
	git status
ga:
	git add .

gpull:  gpull-self gpull-yh-os-init
gpull-self:
	git pull
gpull-yh: yh-os-init
	git subtree pull --prefix=roles/$< $< $(BRANCH) --squash

gpush: gpush-self gpush-yh-os-init 
gpush-self: gpom
gpush-yh-os-init: yh
	git subtree push --prefix=roles/$< $< $(BRANCH) || >/dev/null


# ####################################
# Spec Utils AREA
# ####################################


# ####################################
# Fini and Utils AREA
# ####################################
clean:
	-rm -rvf *.log *.bak
	-rm *.retry

