#MFA fatigue Monte Carlo Simulation
import random

def simulate_user(p, pushes, trials=10000):
    """
    Simulates MFA fatigue for a single user using Monte Carlo simulation.

    Parameters:
        p       = probability that a user accidentally approves a fraudulent MFA request
        pushes  = number of MFA push attempts sent by attacker
        trials  = number of simulated users (more trials => more accuracy)

    Returns:
        Estimated probability that the attacker successfully compromises the account.
    """

    successes = 0

    for _ in range(trials):

        # Each trial simulates a real user's behavior after receiving 'pushes' attempts
        approved = False

        for _ in range(pushes):

            # random.random() returns a number in [0,1)
            # if it is < p, the user accidentally approves this fraudulent push
            if random.random() < p:
                approved = True
                break

        # if at least one fraudulent approval happened, attacker wins
        if approved:
            successes += 1

    return successes / trials



# -------------------------------
# Run simulation for different scenarios
# -------------------------------

accidental_rates = [0.01, 0.03, 0.05, 0.10]   # probability of accidental approval
push_counts      = [5, 10, 20, 50]            # number of attacker push attempts

print("MFA Fatigue Attack Simulation Results:\n")

for p in accidental_rates:
    print(f"Accidental approval probability p = {p} (user tired/distracted):")
    for pushes in push_counts:
        compromise_prob = simulate_user(p, pushes)
        print(f"  Pushes: {pushes:2d}  ->  Compromise Probability: {compromise_prob:.3f}")
    print()
