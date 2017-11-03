using System;
using System.Linq;
using api.Controllers;
using Xunit;

namespace tests
{
    // Before this would run, I had to add a command to the bash and zsh profile
    // scripts.  See https://github.com/Microsoft/vstest/issues/578
    public class RangeTests
    {
        [Fact]
        public void CountShouldControlNumberOfResults()
        {
            var range = new Range { Count = 3 };
            var generated = range.Of(() => "");
            Assert.Equal(3, generated.Count());
        }

        [Fact]
        public void SortShouldOrderResults()
        {
            var range = new Range { Count = 3, Sort = true };
            var values = new [] { "c", "b", "a"};
            var counter = 0;
            var generated = range.Of(() => values[counter++]);
            Assert.Equal(new [] { "a", "b", "c"}, generated);
        }
    }
}
