VERSION = 0.12.4
ORGANIZATION=commands
REPOSITORY=wkhtmltopdf

all: build
  
build: Dockerfile
	docker build -t ${ORGANIZATION}/${REPOSITORY}:${VERSION} .

push:
	#docker push ${ORGANIZATION}/${REPOSITORY}:${VERSION}
	git add Dockerfile
	git push origin ${VERSION}

shell:
#	docker run --name ${REPOSITORY}  -it --rm ${ORGANIZATION}/${REPOSITORY}:${VERSION} /bin/bash
	docker run --name ${REPOSITORY} -v $(CURDIR)/volume:/data -it --rm ${ORGANIZATION}/${REPOSITORY}:${VERSION} /bin/sh

run:
	docker run --name ${REPOSITORY} -v $(CURDIR)/volume:/data  --rm ${ORGANIZATION}/${REPOSITORY}:${VERSION}