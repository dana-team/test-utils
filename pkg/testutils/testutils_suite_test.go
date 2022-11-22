package testutils_test

import (
	"testing"

	"github.com/dana-team/testutils/pkg/testutils"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestTestutils(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Testutils Suite")
}

func TestMustRun(t *testing.T) {
	g := NewWithT(t)

	testutils.MustRun("echo 'a' > file.txt")
	testutils.MustRun("cat file.txt")
	testutils.FieldShouldContain('a')
}
