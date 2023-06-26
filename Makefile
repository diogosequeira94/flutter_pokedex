format: ## Format the files to current code standard
	flutter format . -l 120

lint: ## Run the Linter / Dart Analyzer
	dart analyze --fatal-infos --fatal-warnings .

unit_test: ## Run all unit tests
	flutter test
