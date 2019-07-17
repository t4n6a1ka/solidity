pragma experimental SMTChecker;

contract C {
	uint sum;
	uint count;

	function () external payable {
		require(msg.value > 0);
		require(sum + msg.value >= sum);
		sum += msg.value;
		++count;
	}

	function average() public view returns (uint) {
		require(count > 0);
		uint avg = sum / count;
		assert(avg > 0);
		return avg;
	}
}
// ----
// Warning: (186-193): Overflow (resulting value larger than 2**256 - 1) happens here
