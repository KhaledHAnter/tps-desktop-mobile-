class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    List<int> sortedList = quickSort(nums);
    Map<int, int> map = {};
    List<int> result = [];
    for (var i = 0; i < nums.length; i++) {
      for (var j = 0; j < sortedList.length; j++) {
        if (sortedList[j] > nums[i]) {
          result.add(j + 1);
          break;
        }
      }
    }
    return result;
  }

  // for sort list with quick sort O(n * log n).
  List<int> quickSort(List<int> list) {
    if (list.length <= 1) return list;

    final pivot = list[list.length ~/ 2];
    final less = <int>[];
    final equal = <int>[];
    final greater = <int>[];

    for (var num in list) {
      if (num < pivot) {
        less.add(num);
      } else if (num == pivot) {
        equal.add(num);
      } else {
        greater.add(num);
      }
    }

    return [...quickSort(less), ...equal, ...quickSort(greater)];
  }
}
