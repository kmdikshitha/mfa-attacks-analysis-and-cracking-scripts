# MFA Attacks: Backup Code Cracking & MFA Fatigue Simulation

This repository contains all source code used for analyzing the security of MFA backup codes and simulating MFA fatigue attacks. The project includes:

- Shell scripts to generate numeric and alphanumeric MFA backup codes  
- MD5 hashing pipelines  
- John the Ripper cracking commands  
- A Python Monte-Carlo simulation evaluating MFA push-fatigue compromise rates  

These files were originally executed in a client VM terminal and compiled here for submission.

---

## Repository Contents

### 1. numeric_code_gen.sh
Generates 8-digit random numeric backup codes and produces raw MD5 hashes.

**Outputs:**
- `backup_codes.txt`
- `backup_hashes.txt`

### 2. alphanumeric_code_gen.sh
Generates 10-character alphanumeric (A-Z, a-z, 0-9) backup codes and their MD5 hashes.

**Outputs:**
- `backup_codes_alnum10.txt`
- `backup_hashes_alnum10.txt`

### 3. cracking_commands.sh
Collection of John the Ripper commands used to attempt cracking:

- Mask mode for numeric PINs  
- Prince mode with custom dictionary  
- Markov mode  
- Incremental (Alnum)

Run these commands only after installing John the Ripper.

### 4. mfa_fatigue_simulation.py
Python script that runs a Monte-Carlo simulation to estimate the probability a user accidentally approves MFA requests under fatigue.

You can modify:
- accidental approval probability `p`
- number of push attempts `pushes`
- number of trials `trials`

---

## Running the Scripts

### 1. Generate numeric codes

### 2. Generate alphanumeric codes

### 3. Run cracking attempts

### 4. Run MFA fatigue simulation


---

## Purpose of the Project

These scripts support a security analysis covering:

- Strength of different MFA backup code formats  
- Feasibility of cracking based on hash type and code complexity  
- Impact of brute-force heuristics (mask, prince, markov, incremental)  
- Human-factor vulnerabilities in MFA fatigue scenarios  

---

## Notes

- All hashing uses raw MD5, as required by John the Ripper.
- The repository is for educational use only.
- Do not execute cracking scripts on systems you do not own or control.


