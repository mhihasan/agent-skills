---
name: de-slop
description: >
  Use when the user wants to strip AI writing patterns ("slop") from any text — posts, docs, READMEs,
  emails, reports — and rewrite it to sound like a specific human wrote it. Trigger on requests like
  "de-slop this", "make this sound human", "remove AI footprint", "this sounds too AI-written",
  or when pasted text contains obvious AI tropes and the user asks for a tone overhaul or human edit.
---

# De-Slop: AI Footprint Removal

Strip AI writing patterns from any text and rewrite it to read like a specific human wrote it.

Source of truth: [tropes.fyi](https://tropes.fyi) by ossama.is (gist + comments).
Full trope reference: `references/tropes.md`

---

## Workflow

### 1. Scan First, Rewrite Second

Before touching any text, do a silent mental pass and identify which trope categories are present. This prevents you from fixing one trope while unconsciously writing another.

Common high-frequency offenders to check immediately:
- Negative parallelism ("It's not X — it's Y")
- Bold-first bullets
- Em-dash overuse
- "Delve", "leverage", "robust", "streamline", "utilize", "harness"
- Rhetorical self-questions ("The result? Devastating.")
- Tricolon stacking
- Grandiose stakes inflation
- "Here's the thing / Here's the kicker"
- Signposted conclusions ("In conclusion…")
- Short punchy fragments as standalone paragraphs

### 2. Calibrate Before Rewriting

Ask yourself (or ask the user if ambiguous):
- **Voice**: Is there a specific human voice to match? If the user provides other writing samples, use those. If not, infer from context clues (technical vs. narrative, formal vs. casual, first-person vs. third).
- **Aggression level**: Default is **aggressive** — remove all identifiable tropes and rewrite sentences that feel machine-generated even if they don't match a named pattern. Conservative mode = fix named tropes only, preserve structure.
- **Format constraints**: Is this a blog post, README, email, doc, social post? Output format should match the original type.

### 3. Rewrite Rules

**Word choice**
- Replace magic adverbs ("quietly", "deeply", "fundamentally", "remarkably") with nothing, or with a concrete specific detail that earns the point
- Cut "delve", "certainly", "utilize" → use / use specifically, "leverage" → use or take advantage of, "robust" → name what makes it strong, "streamline" → name what gets faster, "harness" → use
- Cut "tapestry", "landscape", "paradigm", "ecosystem", "framework" unless used literally
- Replace "serves as", "stands as", "marks as" with "is" unless the longer form genuinely adds nuance
- Replace gravitas fillers ("fundamental", "crucial", "essential", "pivotal") — if the sentence means the same thing without them, cut them

**Sentence structure**
- Collapse "It's not X — it's Y" to a direct assertion
- Collapse "Not A. Not B. Just C." to a direct assertion
- Remove self-posed rhetorical questions answered in the next sentence — just make the statement
- Break up anaphora chains (3+ sentences starting with the same opener)
- Break up tricolon stacking — one tricolon is fine, two in a row is AI slop
- Remove "It's worth noting", "Notably", "Interestingly", "Importantly" — if the point matters, lead with it
- Cut "-ing" tack-on phrases at sentence ends that assert shallow significance: "highlighting its importance", "underscoring its role", "contributing to the region's rich cultural heritage"
- Fix "from X to Y" false ranges — either make the range real or use a list

**Paragraph / composition**
- Merge short punchy fragments that are just one idea spread thin
- Collapse "The first... The second... The third..." listicle-in-prose to actual prose or real bullets
- Cut fractal summaries — no "In this section we'll cover X" preambles, no "As we've seen" recaps
- Remove dead metaphors (one metaphor used 5+ times)
- Compress one-point dilution — if the same thesis is restated 8 ways, keep the best one and cut the rest
- Remove signposted conclusions ("In conclusion", "To sum up", "In summary")
- Rewrite "Despite its challenges... / Despite these challenges..." formula endings

**Tone**
- Cut "Here's the thing / Here's the kicker / Here's where it gets interesting / Here's what most people miss"
- Cut "Think of it as..." / "It's like a..." analogies unless the analogy is genuinely illuminating and can't be avoided
- Cut "Imagine a world where..." openings
- Remove false vulnerability ("And yes, I'm openly in love with...") — either commit to the opinion directly or cut it
- Replace "The truth is simple" / "History is unambiguous" — if it were simple and unambiguous you wouldn't need to say so
- Deflate grandiose stakes inflation — ground in specifics instead of "will fundamentally reshape how we think about everything"
- Cut "Let's break this down" / "Let's unpack this" / "Let's explore" / "Let's dive in"
- Remove vague attributions ("experts argue", "industry reports suggest", "observers have noted") — either name the source or cut the claim
- Remove invented compound concept labels ("supervision paradox", "acceleration trap", "workload creep") unless they're established terms in the field

**Formatting**
- Reduce em-dash density — 2-3 per piece is fine, 10+ is AI slop. Convert excess to commas, parentheses, or full stops
- Break bold-first bullet format — if bullets are appropriate, lead with the content, not a bold keyword label
- Replace unicode arrows (→) with prose or plain ASCII (->) in technical contexts

**From comments (also canonical):**
- Remove "False Exclusivity" asides: "and this is the part nobody talks about", "what most people miss", "this doesn't get enough attention" — cut unless the claim is genuinely obscure and you can prove it
- Replace clichéd idioms: "the smoking gun", "a perfect storm", "move the needle", "at the end of the day", "game changer", "double-edged sword", "tip of the iceberg", "between a rock and a hard place", "on the same page", "ballpark" — use plain language
- Cut numbered phase labels in prose: "Phase 1: ...", "Stage 2: ...", "Step 3: ..." — describe what's happening instead of announcing a march
- Replace gravitas words ("fundamental", "crucial", "essential", "pivotal") with specifics, or cut
- Break compliment sandwich: don't soften criticism with a positive opener. Just say what's wrong.
- Rewrite fake casual quotes ("and go 'nope'", "what developers call 'good enough'") — either be casual or be formal, don't perform casualness in quotes

### 4. Output Format

**For short text (< ~400 words):** Return the full rewritten text, with no commentary unless the user asks.

**For medium text (400–1500 words):** Return the full rewrite. Optionally append a one-paragraph note on the most significant structural changes made, but only if they were non-obvious (e.g., collapsed a major structural pattern, cut a whole section of dilution).

**For long text (> 1500 words):** Work in sections. Rewrite section by section and pause for feedback if the user seems to want iteration. Or, if the user says "just do it", produce the full rewrite in one pass and note any structural decisions at the end.

**Do not:**
- Add a preamble explaining what you're about to do
- Add a postamble listing every change you made
- Introduce new AI tropes while fixing the old ones (scan your own output before returning it)
- Over-explain why a pattern was bad — the user knows, that's why they asked
- Ask for permission before making a change that's clearly within scope

---

## Edge Cases

**User wants light touch only:** If the user says "just fix the obvious stuff" or "don't rewrite too much", switch to conservative mode: fix named tropes, don't restructure sentences or cut whole sections.

**Technical writing (README, docs, code comments):** Bold-first bullets and numbered steps are more acceptable here. Focus instead on: em-dash overuse, magic adverbs, gravitas inflation, "delve/leverage/robust/streamline", and fake casual quotes.

**Marketing / persuasive copy:** Some tropes (tricolon, rhetorical questions) are legitimate rhetorical devices. Use judgment — one intentional tricolon is fine, three stacked tricolons is AI slop. Flag the distinction when non-obvious.

**Non-English text:** The same patterns manifest in other languages. Apply the same logic; don't translate-then-fix.

---

## Quick Reference

Load `references/tropes.md` for the full trope list with examples when you need to verify edge cases or reference specific patterns. It contains all tropes from the original gist plus the comment additions.
