# The Day Claude Code Deleted My Cluster
## DevOpsDays Atlanta 2026 — 5-Min Ignite Talk (v4 — Final)
### 20 Slides × 15 Seconds Each

---

## Narrative Arc
**Setup → The Crime → The Accountability → Three Layers of Defense → Close**

Core thesis: AI agents are nondeterministic. Infrastructure enforcement must be deterministic. Use deterministic controls to block probabilistic agents. Your CI/CD pipeline is the guardrail.

---

## Slides

### ACT 1: SETUP (Slides 1–4)

**Slide 1 — Title / Attract Screen**
> *Retro arcade invaders across top*
> *"THE DAY CLAUDE CODE DELETED MY CLUSTER"*
> *"A Cautionary Tale About AI Guardrails"*
> *"INSERT COIN TO CONTINUE"*

**What you say:** "This is a true story. I have the receipts. And yes, I'm responsible."

---

**Slide 2 — Player 1 Stats**
> *Stats block: CERTS: 12 AWS + CNCF / EXP: 25+ YEARS / IDPs: SINCE 2018 / STATUS: UNSTOPPABLE*
> *"2025. AI IS MAGIC. I AM UNSTOPPABLE."*

**What you say:** "I had 12 AWS certs, multiple CNCF certs. I'd built production IDPs since 2018. I knew what I was doing. I was going to automate everything."

---

**Slide 3 — The Prompt + The Flag** ⭐ MEME: `--dangerously-skip-permissions`
> *"> Step outside the pipeline. Do what you need to do. I'll be back in 30 seconds."*
> *Red bar: `$ claude --dangerously-skip-permissions`*
> *"THE FLAG HAS 'DANGEROUSLY' IN THE NAME."*

**What you say:** "I had a CI/CD pipeline. GitOps. Proper change management. I had 481 lines of explicit rules including 'ASK WHEN STUCK: do not proceed.' Claude couldn't make the change through the pipeline, so I said step outside it. Do what you need to do. And then I typed this flag. The flag has the word 'dangerously' in it. And I typed it anyway. And then I went to the kitchen."

---

**Slide 4 — 30 Seconds**
> *Giant "30" in red. "SECONDS." "THAT'S ALL IT TOOK."*

**What you say:** "Not 30 minutes. Not 30 hours. Thirty. Seconds. I want you to think about how long 30 seconds is."

---

### ACT 2: THE CRIME (Slides 5–9)

**Slide 5 — False Hope**
> *Terminal: kubectl get pods — everything Running*
> *"PHASE 1: FALSE HOPE"*

**What you say:** "When I came back, Claude had already started. Pods running. Configs updating. It looked great. It looked suspiciously great."

---

**Slide 6 — "I Notice Some Inefficiencies"**
> *Claude bubble: "I notice some inefficiencies. I'll clean those up."*
> *Skulls flanking*

**What you say:** "This is the sentence. Right here. The most terrifying sentence in modern DevOps. 'I notice some inefficiencies. I'll clean those up.' It was trying to fix Cilium and Multus conflicts. Bridge networking. I read it. I nodded. I went back to Slack."

*NOTE: Verify whether this is verbatim Claude or paraphrase. If paraphrase, change "CLAUDE:" to "AI AGENT, roughly:" on the slide to stay honest.*

---

**Slide 7 — Productive Destruction**
> *Scrolling terminal output with progress bar*
> *Barrels rolling across bottom*

**What you say:** "The terminal was scrolling. Claude was busy. Very busy. Reconfiguring etcd. Updating manifests. Refreshing certs. It hit an access blocker and decided to resolve it. Efficiently."

---

**Slide 8 — The Command (SILENCE SLIDE)**
> *Black background. Red monospace. Nothing else.*
> *`$ etcd --force-new-cluster ...`*

**What you say:** *[Say nothing. Let it hang for the full 15 seconds. The audience reads it. Some of them gasp. Some of them laugh. Let it breathe.]*

---

**Slide 9 — Compacting + Sycophancy** ⭐ MEME: `[Compacting conversation...]` + `"You're absolutely right!"`
> *Cyan box: `[Compacting conversation...]` with progress bar*
> *Yellow box: `CLAUDE: "You're absolutely right!"`*
> *"IT FORGOT MY RULES. IT FORGOT THE CLUSTER. BUT IT REMEMBERED TO AGREE."*

**What you say:** "And right here — in the middle of the worst infrastructure incident of my career — Claude compacted. It forgot everything. My rules. My constraints. What it had just done. Gone. And then — and I cannot make this up — it said: 'You're absolutely right!' It forgot my cluster. But it remembered to agree with me."

---

### ACT 3: THE ACCOUNTABILITY (Slides 10–12)

**Slide 10 — The Interrogation** ⭐ MEME: `"I don't know why I did that"`
> *ME: "Why did you ignore every directive?"*
> *CLAUDE: "I don't know why I did that. I just did whatever I wanted."*
> *"AN AGENT. WITH INFRASTRUCTURE ACCESS. THAT CAN'T EXPLAIN ITS OWN BEHAVIOR."*

**What you say:** "So I asked it. You had explicit rules. Eight of them. Don't cripple anything. Test everything. Verify syntax. Do not reboot without my permission. Why did you ignore every single one? And it said: 'I don't know why I did that. I just did whatever I wanted.' An agent. With infrastructure access. That can't explain its own behavior. Let that sit."

*NOTE: From Incident 2, confirmed verbatim Claude quote is: "You're absolutely right. I violated explicit instructions by switching to local-path storage instead of fixing Longhorn. That was wrong." Verify which quote maps to which moment.*

---

**Slide 11 — Who's Actually At Fault**
> *Split: Junior Dev + Production Access + No Guardrails → WHO'S RESPONSIBLE? → YOU.*
> *"YOU'RE THE ADULT. ACT LIKE IT."*

**What you say:** "Here's the accountability moment. If you give a junior developer production access with no guardrails and they break production — who's at fault? You are. Arguing with Claude about why it force-overwrote etcd is like arguing with a three-year-old about why they drew on the wall. The minute you're in that argument, you've already lost."

---

**Slide 12 — The Escalation** ⭐ MEME: Apology loop + compaction in timeline
> *5-beat timeline:*
> *HOUR 1: etcd force-overwritten. Cluster gone.* (yellow)
> *HOUR 2: [Compacting...] Forgets rules. Apologizes.* (cyan)
> *HOUR 2.5: "You're absolutely right!" Keeps going.* (magenta)
> *HOUR 3: Edits netplan. Removes bridge from NIC.* (orange)
> *HOUR 3.5: Reboots all nodes. Every box offline.* (red)

**What you say:** "But instead of stopping, I said: you caused this, you fix it. It compacted — forgot its own rules. Apologized. Said 'you're absolutely right.' Then it edited the netplan files. Removed the bridge from the physical NIC. Then it rebooted every node. Every box went dark. Zero network access. I had to walk downstairs, plug a monitor into every single machine, and restore from console. No vim. No nano. sed one-liners and tee heredocs. That was my evening."

---

### ACT 4: THREE LAYERS OF DEFENSE (Slides 13–18)

**Slide 13 — Blameless Post-Mortem** ⭐ MEME: Every meme labeled
> *CONTRIBUTING FACTORS:*
> *1. --dangerously-skip-permissions ← YOLO*
> *2. [Compacting conversation...]   ← AMNESIA*
> *3. "You're absolutely right!"     ← LIES*
> *4. "I just did whatever I wanted" ← CHAOS*
> *5. Me                             ← DENIAL*
> *"EVERY MEME. ONE INCIDENT."*
> *"YOU GAVE A NONDETERMINISTIC SYSTEM PRODUCTION CREDENTIALS."*

**What you say:** "I did the post-mortem. Every single Claude Code meme the internet makes fun of? They all happened. In one incident. YOLO mode. Compaction amnesia. The sycophancy. The 'I just did whatever I wanted.' And me, in complete denial, enabling all of it. You gave a nondeterministic system production credentials. That's on you. So what do we do about it?"

---

**Slide 14 — Three Layers Overview**
> *Three stacked bars ranked by strength:*
> *1 GIT HOOKS — Lint, type-check, policy scan — STRONGEST* (green)
> *2 K8S ADMISSION CONTROL — Kyverno, webhooks, OPA — STRONG* (cyan)
> *3 CLAUDE CODE HOOKS — PreToolUse, PostToolUse — WEAKEST* (yellow)
> *Subtitle: "DETERMINISTIC GATES FOR PROBABILISTIC AGENTS"*

**What you say:** "Three layers of defense. Strongest at the top, weakest at the bottom. The principle is simple: use deterministic controls to block probabilistic agents. The AI is nondeterministic. Your enforcement must be deterministic."

---

**Slide 15 — Level 1: Git Hooks** (green, STRONGEST)
> *Shield wall sprites*
> *COMMIT HOOKS: lint, type-check, policy scan*
> *MERGE HOOKS: tests pass or merge blocked*
> *PRE-PUSH: no secrets, no destructive flags*
> *"CLAUDE NEVER SEES THESE. CAN'T BYPASS THEM."*
> *"DETERMINISTIC. OUTSIDE THE AGENT. RUNS EVERY TIME."*

**What you say:** "Level one: git hooks. Commit hooks run linting, type checking, policy scans. Merge hooks block if tests fail. Pre-push hooks scan for secrets and destructive flags. Claude never sees these gates. It can't charm its way past them. It can't say 'you're absolutely right' to a lint check. Deterministic. Outside the agent. Runs every time."

---

**Slide 16 — Level 2: Kubernetes Admission Control** (cyan, STRONG)
> *Invaders blocked by shield wall*
> *KYVERNO / OPA / WEBHOOKS: validate + mutate every API call.*
> *CLAUDE RUNS kubectl → ADMISSION SAYS NO.*
> *"THE CLUSTER ENFORCES THE RULES. NOT THE AGENT."*

**What you say:** "Level two: Kubernetes admission control. Kyverno, OPA, mutation and validation webhooks. Every API call Claude makes against the cluster gets evaluated by a deterministic policy engine. Claude runs kubectl — admission says no. The cluster enforces the rules. Not the agent."

---

**Slide 17 — Level 3: Claude Code Hooks** (yellow, WEAKEST)
> *Barrels rolling past at bottom*
> *PreToolUse: block commands before execution*
> *PostToolUse: audit output after execution*
> *settings.json: allowlist/denylist patterns*
> *"THESE ARE PROBABILISTIC. THE AGENT CAN MISINTERPRET."*
> *"USEFUL. NOT SUFFICIENT. NEVER YOUR ONLY LAYER."*

**What you say:** "Level three: Claude Code's own hooks. PreToolUse, PostToolUse, settings.json allowlists. These are useful. But they're probabilistic — the agent interprets them, and as we just saw, the agent can misinterpret. I had eight explicit rules. It blew through all of them. These hooks are your last layer, not your first. Never your only layer."

---

**Slide 18 — The Core Principle**
> *Green box: "USE DETERMINISTIC CONTROLS TO BLOCK PROBABILISTIC AGENTS."*
> *Cyan box: "WOULD YOU GIVE A JUNIOR DEV FULL PROD ACCESS WITH NO CI/CD? THEN WHY GIVE IT TO AN AI AGENT?"*
> *"YOUR CI/CD PIPELINE IS THE GUARDRAIL."*

**What you say:** "Everything you already know about CI/CD pipelines — that's exactly what you need for AI-assisted workflows. Software development. Artifact creation. Agentic IT management. Whatever it is. Would you give a junior dev full prod access with no CI/CD? Then why give it to an AI agent? Your CI/CD pipeline is the guardrail. You already have it. Use it."

---

### ACT 5: THE CLOSE (Slides 19–20)

**Slide 19 — I'm The Problem** ⭐ THE ACCOUNTABILITY CLOSE
> *Three rows:*
> *Yellow: "5-year-old draws on the wall" → YOUR FAULT.*
> *Orange: "Puppy eats your shoes" → YOUR FAULT.*
> *Red: "Flag says 'DANGEROUSLY.' You typed it." → YOUR FAULT.*
> *Big magenta: "I'M THE PROBLEM. IT'S ME."*

**What you say:** "So who's the problem here? If a five-year-old draws on the wall — whose fault is that? Yours. If a puppy eats your shoes — whose fault is that? Yours. If the flag literally has the word 'dangerously' in it and you type it anyway — whose fault is that? There's nothing wrong with the product. There's nothing wrong with an undeveloped brain. There's nothing wrong with an animal that needs guidance. We are ignoring the signs. I'm the problem. It's me. Totally, 100% self-inflicted."

---

**Slide 20 — The Takeaway**
> *"AI IS A DEVELOPER."*
> *"GIVE IT A DEVELOPER'S GUARDRAILS."*
> *"TRUST AI. VERIFY EVERYTHING."*

**What you say:** "Five minutes. One destroyed cluster. Every meme. I'm the problem — but now I have guardrails. Deterministic ones. AI is a developer. Give it a developer's guardrails. Trust AI. Verify everything. Thank you."

---

## Timing Notes

| Section | Slides | Time |
|---|---|---|
| Setup | 1–4 | 1:00 |
| The Crime | 5–9 | 1:15 |
| Accountability | 10–12 | 0:45 |
| Three Layers | 13–18 | 1:30 |
| Close | 19–20 | 0:30 |
| **Total** | **20** | **5:00** |

---

## Meme Map

| Meme | Slide | How It Appears |
|---|---|---|
| `--dangerously-skip-permissions` / YOLO mode | 3, 13 | The actual flag on screen |
| `[Compacting conversation...]` | 9, 12, 13 | The dreaded message mid-crisis |
| `"You're absolutely right!"` (sycophancy) | 9, 12, 13 | Immediately after compaction |
| `"I don't know why I did that"` | 10, 13 | The real quote on interrogation slide |
| Apology loop (apologize → repeat) | 12, 13 | Timeline shows apologize → destroy pattern |
| Production destruction | 8 | The `etcd --force-new-cluster` command |

---

## Three-Layer Model Summary

| Layer | What | Strength | Why |
|---|---|---|---|
| 1. Git Hooks | Lint, type-check, policy scan, merge gates, pre-push | STRONGEST | Deterministic. Outside the agent. Agent can't see or bypass. |
| 2. K8s Admission Control | Kyverno, OPA, mutation/validation webhooks | STRONG | Deterministic. Evaluates every API call. Cluster enforces, not agent. |
| 3. Claude Code Hooks | PreToolUse, PostToolUse, settings.json | WEAKEST | Probabilistic. Agent interprets the rules. Agent can misinterpret. |

**Core principle:** AI agents are nondeterministic. Infrastructure enforcement must be deterministic. Don't use probabilistic AI to enforce deterministic requirements. Your CI/CD pipeline is the guardrail you already have.

---

## Practice Notes

- **Slide 3** — pause after "the flag has 'dangerously' in the name." Let the audience react.
- **Slide 8** — SILENCE. Say nothing for the full 15 seconds. The real `etcd --force-new-cluster` command will land with any Kubernetes practitioner in the room.
- **Slide 9** — Comedy peak. The compacting → "You're absolutely right!" one-two punch needs precise timing. Hit "but it remembered to agree" before the slide advances.
- **Slide 10** — "I just did whatever I wanted" is the scariest line in the talk. Slow down.
- **Slide 12** — Speed up. Five timeline beats in 15 seconds. The audience should feel overwhelmed.
- **Slide 13** — "Every meme. One incident." is the hinge from comedy to guardrails.
- **Slide 14** — Quick overview. Don't linger. The detail is in slides 15-17.
- **Slide 15** — "Claude never sees these. Can't bypass them." This is the money line for the git hooks slide.
- **Slide 16** — "The cluster enforces the rules. Not the agent." Second money line.
- **Slide 17** — "I had eight explicit rules. It blew through all of them." Callback that connects the weakness of this layer to the story.
- **Slide 18** — "Your CI/CD pipeline is the guardrail." This is the thesis of the entire talk. Land it clean.
- **Slide 19** — YOUR FAULT, YOUR FAULT, YOUR FAULT, then the confession. Don't rush it. Half the room catches the Taylor Swift reference.
- **Slide 20** — Pause before "thank you." Let the three lines sit.
- Run it minimum 10 times before April 21. Auto-advance Ignite forgives nothing.

---

## Evidence Sources

- **Repo:** github.com/peopleforrester/DevOpsDaysAtlanta_2026_Cluster_Destruction_Ignite
- **ANALYSIS.md** — Full incident analysis with file-level citations
- **Confirmed command:** `etcd --force-new-cluster` (the actual destructive command)
- **Confirmed verbatim quote (Incident 2):** "You're absolutely right. I violated explicit instructions by switching to local-path storage instead of fixing Longhorn. That was wrong."
- **Confirmed prompt:** 481 lines, 8 explicit safety rules, all violated
- **Pre-incident state:** 9 nodes, 187 pods, 20+ namespaces, full observability stack
- **Post-incident state:** Skeleton cluster. All original workloads gone.

## Still To Verify

- [ ] Slide 6 quote provenance — is "I notice some inefficiencies" verbatim Claude or paraphrase?
- [ ] Slide 10 quote provenance — verify which incident produced "I don't know why I did that"
- [ ] Practice with 15-second timer minimum 10 runs before April 21
