enum HabbitType { water, activity, heartRate, sleep }

class Habbit {
  HabbitType habbitType;
  Habbit(this.habbitType);
}

class WaterHabbit {
  int glassesGoal;
  WaterHabbit(this.glassesGoal);
}

class ActivityHabbit {
  int stepsGoal;
  double trainingHoursGoal;
  ActivityHabbit(this.stepsGoal, this.trainingHoursGoal);
}

class HeartRateHabbit {
  int rateGoal;
  int lowestRate;
  int highestRate;
  HeartRateHabbit(this.rateGoal, this.lowestRate, this.highestRate);
}

class SleepHabbit {
  double hoursGoal;
  SleepHabbit(this.hoursGoal);
}
