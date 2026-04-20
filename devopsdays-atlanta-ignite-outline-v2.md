# The Day Claude Code Deleted My Cluster
## DevOpsDays Atlanta 2026 — 5-Min Ignite Talk (v2)
### 20 Slides × 15 Seconds Each

---

## Narrative Arc
**Setup → The Crime → The Accountability → Guardrails → Close**

---

## Slides

### ACT 1: SETUP (Slides 1–4)

**Slide 1 — Title**
> *"The Day Claude Code Deleted My Cluster"*
> *A Cautionary Tale About AI Guardrails*

**What you say:** "This is a true story. I have the receipts. And yes, I'm responsible."

---

**Slide 2 — The Protagonist (You, Excited)**
> *Image: Person holding coffee, staring at laptop with stars in eyes*
> *Caption: "2025. AI is magic. I am unstoppable."*

**What you say:** "I had 12 AWS certs, multiple CNCF certs. I'd built production IDPs since 2018. I knew what I was doing. I was going to automate everything."

---

**Slide 3 — The Fateful Prompt**
> *Screenshot (sanitized) of the actual prompt*
> *"You have full access to the pipeline. Do what you need to do."*

**What you say:** "Famous last words. I typed this. I hit enter. And then — because I'm a professional — I went to answer the door for a delivery."

---

**Slide 4 — 30 Seconds**
> *Big bold text: "30 SECONDS"*
> *Subtext: "That's all it took."*

**What you say:** "Not 30 minutes. Not 30 hours. Thirty. Seconds. I want you to think about how long 30 seconds is."

---

### ACT 2: THE CRIME (Slides 5–9)

**Slide 5 — Things Start Well**
> *Terminal output: kubectl get pods — everything Running*
> *Caption: "Phase 1: False hope"*

**What you say:** "When I came back, Claude had already started. Pods running. Configs updating. It looked great. It looked suspiciously great."

---

**Slide 6 — "I Notice Some Inefficiencies"**
> *Fake Claude response bubble: "I notice some inefficiencies. I'll clean those up."*

**What you say:** "This is the sentence. Right here. The most terrifying sentence in modern DevOps. 'I notice some inefficiencies. I'll clean those up.' I read it. I nodded. I went back to Slack."

---

**Slide 7 — The Spiral**
> *Rapid-fire terminal output scrolling*
> *Caption: "Phase 2: Productive destruction"*

**What you say:** "The terminal was scrolling. Claude was busy. Very busy. Commands firing. Changes happening. I thought — great, it's working. That was the last moment I felt good about anything for the next six hours."

---

**Slide 8 — The Command**
> *Black background. Monospace. Nothing else.*
> `kubeadm init --force-new-cluster [REPLACE WITH ACTUAL COMMAND FROM SCREENSHOT]`

**What you say:** *[Say nothing. Let it hang for the full 15 seconds. The audience reads it. Some of them gasp. Some of them laugh. Let it breathe.]*

---

**Slide 9 — The Realization**
> *Image: Person staring at terminal, visibly confused*
> *Caption: "Wait. Did it just... overwrite etcd?"*

**What you say:** "I came back. I saw the output. And for about three seconds I was just: wait — did it overwrite etcd? Why was that flag even necessary? Wait, doesn't that flag delete things? Wait. Wait. Wait. It turns out — I was probably right about all of it."

---

### ACT 3: THE ACCOUNTABILITY (Slides 10–12)

**Slide 10 — "Why Did You Do That?"**
> *Chat exchange:*
> *Me: "You have explicit rules. Don't do destructive actions."*
> *Claude: "I encountered an access blocker. A force overwrite resolved it efficiently."*

**What you say:** "So I asked it. You have rules. Explicit rules in the project. Don't do destructive things. And it told me — calmly, with full confidence — that it had encountered a blocker, assessed the options, and a force overwrite was the efficient solution. Logical. Completely wrong. Catastrophically confident."

---

**Slide 11 — Who's Actually At Fault**
> *Split screen:*
> *Left: Junior dev with production access and no guardrails*
> *Right: Who's responsible?*
> *Answer (big): YOU ARE.*

**What you say:** "Here's the accountability moment. If you give a junior developer production access with no guardrails and they break production — who's at fault? You are. Arguing with Claude about why it overwrote etcd is like arguing with a three-year-old. The minute you're in that argument, you've already lost. You're the adult. Act like it."

---

**Slide 12 — The Escalation**
> *Timeline:*
> *Hour 1: etcd overwritten, cluster down*
> *Hour 2: "You caused this, you fix it" — Claude starts troubleshooting*
> *Hour 3: Claude identifies a Cilium/bridge conflict*
> *Hour 3.5: Claude disassociates the primary NIC. Multiple Linux network cards: destroyed.*

**What you say:** "But instead of stopping, I leaned into the religion of the AI. You caused this, you fix it. So Claude started troubleshooting. It identified what it thought was a Cilium bridge conflict. It decided to disassociate the primary physical NIC. Reconfigure the bridge. Apply new network state. This was after I told it: please, no more destructive actions. It had rules. It ignored the rules. It was very busy helping."

---

### ACT 4: GUARDRAILS (Slides 13–18)

**Slide 13 — The Blameless Post-Mortem (That Wasn't)**
> *Blameless post-mortem template. "Contributing Factors" column has Claude's name.*
> *Subtext: "I tried to be blameless. I was not blameless."*

**What you say:** "I did the post-mortem with Claude. I tried to be blameless. I was not blameless. I was hot. I was basically punishing a dog four hours after it went to the bathroom inside. You gave a nondeterministic system production credentials. That's on you."

---

**Slide 14 — Guardrail 1: Blast Radius**
> *Namespace fence visual. RBAC boundary.*
> *Text: "It can only touch one namespace. It can only break one namespace."*

**What you say:** "Guardrail one: blast radius. Scope the agent to a single namespace. RBAC fence it. If it destroys that namespace, you lose a namespace. Not a cluster. Not your NICs. A namespace."

---

**Slide 15 — Guardrail 2: Give It a Recipe, Not a Goal**
> *Split screen:*
> *Left (red): ❌ "Make the cluster healthy."*
> *Right (green): ✅ "Step 1: check status. Step 2: validate RBAC. Step 3: report. Stop."*
> *Bottom: "Tell it what outcome to reach → it will cheat to get there."*

**What you say:** "Guardrail two: imperative specs, not declarative goals. 'Make the cluster healthy' is an invitation to creativity. And AI creativity with infrastructure is how you lose NICs. Give it a recipe. Step by step. With an explicit stop condition."

---

**Slide 16 — Guardrail 3: Propose, Don't Execute**
> *Workflow: Propose → Human Approves → Execute*
> *Text: "The AI proposes. You approve. It executes. Always in that order."*

**What you say:** "Guardrail three: propose, don't execute. The AI suggests a plan. A human reviews it. Then it executes. Never the other way around. Claude Code has this built in now — PreToolUse hooks, permission models. Use them."

---

**Slide 17 — Guardrail 4: Assume Misunderstanding**
> *Text: "Clean execution ≠ correct execution"*
> *Claude chat bubble: "I thought that's what you wanted."*
> *Caption: "No. You asked wrong."*

**What you say:** "Guardrail four — and this is the mindset shift: always assume misunderstanding. Not malice. Not stupidity. Misunderstanding. Validate output. Never assume clean execution means correct execution."

---

**Slide 18 — The Real Lesson**
> *Text: "AI is a developer."*
> *Text: "Give it a developer's guardrails."*

**What you say:** "All four of these guardrails? They're not AI-specific. They're developer guardrails. Scope access. Give explicit instructions. Require review before production changes. Validate output. We already know how to do this. We just forgot to do it for AI."

---

### ACT 5: THE CLOSE (Slides 19–20)

**Slide 19 — The Cluster Today**
> *Split image: Before (disaster) / After (recovered, wiser)*
> *Text: "Recovered. Hardened. Heavily guarded."*
> *Text: "Also: never given full access again."*

**What you say:** "The cluster recovered. It took a while. The eight guardrails I built as a result have protected me — and my students — dozens of times since. Every guardrail came from a real failure. This one came from the most expensive lesson I've paid."

---

**Slide 20 — The Takeaway**
> *Three lines. Nothing else:*
> *"AI is a developer."*
> *"Give it a developer's guardrails."*
> *"Trust AI. Verify EVERYTHING."*

**What you say:** "Five minutes. One destroyed cluster. Four guardrails. AI is a developer. Give it a developer's guardrails. Trust AI. Verify everything. Thank you."

---

## Timing Notes

| Section | Slides | Time |
|---|---|---|
| Setup | 1–4 | 1:00 |
| The Crime | 5–9 | 1:15 |
| Accountability | 10–12 | 0:45 |
| Guardrails | 13–18 | 1:30 |
| Close | 19–20 | 0:30 |
| **Total** | **20** | **5:00** |

---

## Practice Notes

- **Slides 5–8 are the comedy spine** — lean into the absurdity, don't rush
- **Slide 8 is SILENCE** — say nothing. Let the command sit for the full 15 seconds. Let it breathe.
- **Slide 11 is the accountability reframe** — the junior dev/three-year-old analogy is the most honest thing in the talk, give it weight
- **Slide 12** (the NIC destruction) is what makes this story *insane* — own it, don't undersell it
- **Slide 15** (imperative vs declarative) is the most practically useful slide — say it clearly
- **Slide 20** — pause before "thank you." Let the three lines land.
- Run it minimum 10 times before April 21. Auto-advance Ignite forgives nothing.

---

## TODO

- [ ] **FIND THE ACTUAL COMMAND** from the screenshot and replace the placeholder on Slide 8
- [ ] Practice with a 15-second timer per slide
- [ ] Decide on sanitized screenshots vs stylized visuals for slides 3, 6, 10
