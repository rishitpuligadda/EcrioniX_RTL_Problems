module top_module(
  input  [3:0] entry0,
  input  [3:0] entry1,
  input  [3:0] entry2,
  input  [3:0] entry3,
  input  [3:0] search_key,
  output [3:0] match,
  output found
);

  // Your code here — match[i] = (entry_i == search_key) for each of the 4 entries; found = |match.
	assign match = {(search_key == entry3), (search_key == entry2), (search_key == entry1), (search_key == entry0)};
	assign found = |match;
endmodule

