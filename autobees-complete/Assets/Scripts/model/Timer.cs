using UnityEngine;
using System;

public class Timer : MonoBehaviour {
    private float timeLeft = 5.0f;
    private bool running = true;
    private bool done = false;

    private float lastFullNumber;

    // Initializes the count down timer to the passed value.
    public void SetTimer(float time) {
        timeLeft = time;
        done = time <= 1.0f;
        lastFullNumber = GetTimeLeft();
    }

    // Returns time left in seconds rounded to the lower value.
    public float GetTimeLeft() {
        return (float)Math.Floor(timeLeft);
    }

    // Starts the countdown timer
    public void StartTimer() {
        running = true;
    }

    // Stops the countdown timer
    public void StopTimer() {
        running = false;
    }

    // Get the timer running state
    public bool GetIsRunning() {
        return running;
    }

    // Initialize the countdown timer.
    void Start() {
        // Get the countdown initial value from the gameObject.
        // SetTimer(number);
    }

    // Update the countdown timer per frame.
    void Update() {
        // Avoid updating state when done.
        if (done) {
            return;
        }

        // Update the countdown timer if it's set to run, and not done yet.
        if (running) {
            timeLeft -= Time.deltaTime;

            float currentTick = GetTimeLeft();
            if (lastFullNumber != currentTick) {
                lastFullNumber = currentTick;
                Tick();
            }

            if (timeLeft <= 1.0f) {
                done = true;
                running = false;
                TimerEnded();
            }
        }
    }

    // Method gets called once per tick (full second counted).
    void Tick() {
        Debug.Log($"tick tock {GetTimeLeft()}");
    }

    // Method gets called once when the count down is done.
    void TimerEnded() {
        // Let the watchers know that the timer is done.
        Debug.Log("Timer is Done!");
    }
}