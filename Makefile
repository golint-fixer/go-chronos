build:
	go build ./...

test:
	golint ./...
	go vet ./...
	ginkgo -r -trace -failFast -v --cover --randomizeAllSpecs --randomizeSuites -p
	echo "" && for i in $$(ls **/*.coverprofile); do echo "$${i}" && go tool cover -func=$${i} && echo ""; done

clean:
	go clean -i -x
	$(RM) -f **/*.coverprofile
