package example

import (
	"testing"
)

func TestHelloWorld(t *testing.T) {
	if Helloworld() != "Hello World!!" {
		t.Fatal("Test fail")
	}
}
