.PHONY: init clean
all: gpull

BRANCH := master

DATA_SUF = $(shell date +"%Y.%m.%d.%H.%M.%S")
GUP_MSG  = "Auto Commited at $(DATA_SUF)"
DEPLOY_ENV =

SUB_LIST = yh-os-init yh-user

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
gpom:
	git add .
	git commit -am $(GUP_MSG) || >/dev/null
	git push origin master
	git status
gs:
	git status
ga:
	git add .

init:
yh-os-init:
	$(call doSubInit,yh-os-init)
yh-user:
	$(call doSubInit,yh-user)

gpull:  gpull-self gpull-yh-os-init
gpull-self:
	git pull
gpull-yh-os-init: yh-os-init
	$(call doSubPull,$<)
gpull-yh-user: yh-user
	$(call doSubPull,$<)

# grep "$$x" .git/config >/dev/null || git remote add -f $$x git@github.com:yh7x24/$$x.git; \
# [ ! -d "roles/$$x" ] && git subtree add --prefix=roles/$$x $$x $(BRANCH) --squash || >/dev/null; \
		
gpull-sub:
	for x in $(SUB_LIST); do \
		$(call doSubInit,$$x); \
		$(call doSubPull,$$x); \
	done;

gpush: gpush-self gpush-yh-os-init 
gpush-self: gpom
gpush-yh-os-init: yh-os-init
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

define doSubInit
        grep "$(1)" .git/config >/dev/null || git remote add -f $(1) git@github.com:yh7x24/$(1).git
        [ ! -d "roles/$(1)" ] && git subtree add --prefix=roles/$(1) $(1) $(BRANCH) --squash || >/dev/null
endef

define doSubPull
	git subtree pull --prefix=roles/$(1) $(1) $(BRANCH) --squash
endef

define doSubPush
	git subtree push --prefix=roles/$(1) $(1) $(BRANCH) || >/dev/null
endef

