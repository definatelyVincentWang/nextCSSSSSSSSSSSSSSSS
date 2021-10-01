public boolean scoresIncreasing(int[] scores) {
  for (int i = 1; i < scores.length; i++) {
    if (scores[i-1] > scores[i]) {
      return false;
    }
  }
  return true;
}
