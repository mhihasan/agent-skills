# AI Writing Tropes Reference

Full catalog from [tropes.fyi](https://tropes.fyi) by ossama.is, gist + canonical comments.
Source: [gist](https://gist.github.com/ossa-ma/f3baa9d25154c33095e22272c631f5a1)

---

## Table of Contents

1. [Word Choice](#word-choice)
2. [Sentence Structure](#sentence-structure)
3. [Paragraph Structure](#paragraph-structure)
4. [Tone](#tone)
5. [Formatting](#formatting)
6. [Composition](#composition)
7. [Comment Additions (Canonical)](#comment-additions-canonical)

---

## Word Choice

### "Quietly" and Other Magic Adverbs
Overuse of "quietly" and similar adverbs to convey subtle importance or understated power. AI reaches for these to make mundane descriptions feel significant.

Also: "deeply", "fundamentally", "remarkably", "arguably"

**Avoid:**
- "quietly orchestrating workflows, decisions, and interactions"
- "the one that quietly suffocates everything else"
- "a quiet intelligence behind it"

---

### "Delve" and Friends
"Delve" went from uncommon to appearing in a staggering percentage of AI-generated text. Part of a family of overused AI vocabulary.

Also: "certainly", "utilize", "leverage" (as verb), "robust", "streamline", "harness"

**Avoid:**
- "Let's delve into the details..."
- "We certainly need to leverage these robust frameworks..."

---

### "Tapestry" and "Landscape"
Overuse of ornate or grandiose nouns where simpler words work. "Tapestry" = anything interconnected. "Landscape" = any field or domain.

Also: "paradigm", "synergy", "ecosystem", "framework"

**Avoid:**
- "The rich tapestry of human experience..."
- "Navigating the complex landscape of modern AI..."

---

### The "Serves As" Dodge
Replacing simple "is" / "are" with pompous alternatives. AI avoids copulas because its repetition penalty pushes toward fancier constructions.

Also: "stands as", "marks", "represents"

**Avoid:**
- "The building serves as a reminder of the city's heritage."
- "The station marks a pivotal moment in the evolution of regional transit."

---

## Sentence Structure

### Negative Parallelism
"It's not X — it's Y" pattern, often with an em dash. The single most commonly identified AI writing tell. Creates false profundity by framing everything as a surprising reframe.

Variants: "not because X, but because Y", the em-dash dismissal "X — not Y", the cross-sentence reframe "The question isn't X. The question is Y."

**Avoid:**
- "It's not bold. It's backwards."
- "Feeding isn't nutrition. It's dialysis."
- "Half the bugs you chase aren't in your code. They're in your head."

---

### "Not X. Not Y. Just Z."
The dramatic countdown pattern. Negates two or more things before revealing the actual point.

**Avoid:**
- "Not a bug. Not a feature. A fundamental design flaw."
- "Not ten. Not fifty. Five hundred and twenty-three lint violations across 67 files."

---

### "The X? A Y."
Self-posed rhetorical questions answered immediately for dramatic effect.

**Avoid:**
- "The result? Devastating."
- "The worst part? Nobody saw it coming."
- "The scary part? This attack vector is perfect for developers."

---

### Anaphora Abuse
Repeating the same sentence opening multiple times in quick succession.

**Avoid:**
- "They assume that users will pay... They assume that developers will build... They assume that ecosystems will emerge..."
- "They could expose... They could offer... They could provide... They could create..."

---

### Tricolon Abuse
Overuse of the rule-of-three pattern, often extended to four or five. One tricolon is elegant; three back-to-back is a pattern recognition failure.

**Avoid:**
- "Products impress people; platforms empower them. Products solve problems; platforms create worlds. Products scale linearly; platforms scale exponentially."
- "identity, payments, compute, distribution" (four items dressed as a tricolon rhythm)

---

### "It's Worth Noting"
Filler transitions that introduce new points without connecting them to the previous argument.

Also: "It bears mentioning", "Importantly", "Interestingly", "Notably"

**Avoid:**
- "It's worth noting that this approach has limitations."
- "Importantly, we must consider the broader implications."

---

### Superficial Analyses
Tacking a present participle ("-ing") phrase onto the end of a sentence to inject shallow analysis.

**Avoid:**
- "contributing to the region's rich cultural heritage"
- "underscoring its role as a dynamic hub of activity and culture"
- "This etymology highlights the enduring legacy of the community's resistance and the transformative power of unity in shaping its identity."

---

### False Ranges
"From X to Y" constructions where X and Y aren't on any real scale.

**Avoid:**
- "From innovation to implementation to cultural transformation."
- "From the singularity of the Big Bang to the grand cosmic web."

---

## Paragraph Structure

### Short Punchy Fragments
Excessive use of very short sentences or sentence fragments as standalone paragraphs for manufactured emphasis. An inhuman style; no real person writes first drafts this way.

**Avoid:**
- "He published this. Openly. In a book. As a priest."
- "Platforms do."

---

### Listicle in a Trench Coat
Numbered or labeled points dressed up as continuous prose. "The first... The second... The third..." disguises a list as prose flow.

**Avoid:**
- "The first wall is the absence of a free, scoped API... The second wall is the lack of delegated access... The third wall is the absence of scoped permissions..."
- "The second takeaway is that... The third takeaway is that..."

---

## Tone

### "Here's the Kicker"
False suspense transitions that promise a revelation but deliver a point that didn't need the buildup.

Also: "Here's the thing", "Here's where it gets interesting", "Here's what most people miss", "Here's the starting point", "Here's the deal"

**Avoid:**
- "Here's the kicker."
- "Here's the thing about AI adoption."

---

### "Think of It As..."
The patronizing analogy. AI defaults to teacher mode and assumes the reader needs a metaphor to understand anything. Often produces analogies less clear than the original concept.

**Avoid:**
- "Think of it like a highway system for data."
- "Think of it as a Swiss Army knife for your workflow."

---

### "Imagine a World Where..."
The classic AI invitation to futurism.

**Avoid:**
- "Imagine a world where every tool you use — your calendar, your inbox, your documents... — has a quiet intelligence behind it..."

---

### False Vulnerability
Simulated self-awareness or honesty that reads as performative. Real vulnerability is specific and uncomfortable; AI vulnerability is polished and risk-free.

**Avoid:**
- "And yes, I'm openly in love with the platform model"
- "This is not a rant; it's a diagnosis"

---

### "The Truth Is Simple"
Asserting that something is obvious, clear or simple instead of proving it. Also includes the dramatic reveal variant "but none of them is the real story. The real story is..."

**Avoid:**
- "The reality is simpler and less flattering"
- "History is unambiguous on this point"

---

### Grandiose Stakes Inflation
Everything is the most important thing ever. A blog post about API pricing becomes a meditation on the fate of civilization.

**Avoid:**
- "This will fundamentally reshape how we think about everything."
- "will define the next era of computing"

---

### "Let's Break This Down"
The pedagogical voice that assumes the reader needs hand-holding, even for expert audiences.

Also: "Let's unpack this", "Let's explore", "Let's dive in"

**Avoid:**
- "Let's break this down step by step."
- "Let's unpack what this really means."

---

### Vague Attributions
Attributing claims to unnamed authorities. Also inflates the quantity of sources — presenting one person's view as widely held.

**Avoid:**
- "Experts argue that this approach has significant drawbacks."
- "Industry reports suggest that adoption is accelerating."
- "Observers have cited the initiative as a turning point."

---

### Invented Concept Labels
Compound labels that sound analytical without being grounded: problem-nouns (paradox, trap, creep, divide, vacuum, inversion) appended to domain words, used as if rigorously defined.

**Avoid:**
- "the supervision paradox"
- "the acceleration trap"
- "workload creep"

---

## Formatting

### Em-Dash Addiction
Compulsive overuse of em dashes for dramatic pauses and parenthetical asides. A human writer might use 2–3 per piece; AI uses 20+.

**Avoid:**
- "The problem — and this is the part nobody talks about — is systemic."
- "Not recklessly, not completely — but enough — enough to matter."

---

### Bold-First Bullets
Every bullet or list item starts with a bolded phrase. Almost nobody formats lists this way when writing by hand. Telltale sign of AI-generated docs and READMEs (especially with emojis).

**Avoid:**
- "**Security**: Environment-based configuration with..."
- "**Performance**: Lazy loading of expensive resources..."

---

### Unicode Decoration
Unicode arrows (→), smart/curly quotes, and special characters that can't be easily typed. Real writers produce straight quotes and -> or =>.

**Avoid:**
- "Input → Processing → Output"
- ""Smart quotes" instead of straight "quotes""

---

## Composition

### Fractal Summaries
"What I'm going to tell you; what I'm telling you; what I just told you" applied at every level. Every subsection gets a summary. Every section gets a summary.

**Avoid:**
- "In this section, we'll explore... [3000 words later] ...as we've seen in this section."
- "And so we return to where we began."

---

### The Dead Metaphor
Latching onto a single metaphor and repeating it 5–10 times across a piece. A human introduces a metaphor, uses it, moves on.

**Avoid:**
- "The ecosystem needs ecosystems to build ecosystem value."
- "Walls and doors used 30+ times in the same article"

---

### Historical Analogy Stacking
Especially common in technical writing. Rapid-fire listing of historical companies or tech revolutions to build false authority.

**Avoid:**
- "Apple didn't build Uber. Facebook didn't build Spotify. Stripe didn't build Shopify. AWS didn't build Airbnb."
- "Every major technological shift — the web, mobile, social, cloud — followed the same pattern."

---

### One-Point Dilution
Making a single argument and restating it 10 different ways across thousands of words. An 800-word argument padded to 4000 words of circular repetition.

**Avoid:**
- "Each section rephrases the thesis with a different metaphor but adds nothing new"

---

### Content Duplication
Repeating entire sections or paragraphs verbatim. Happens when the model loses track of what it's already written. A dead giveaway of unedited AI output.

---

### The Signposted Conclusion
Explicitly announcing the conclusion. Competent writing doesn't need to tell you it's concluding.

**Avoid:**
- "In conclusion, the future of AI depends on..."
- "To sum up, we've explored three key themes..."
- "In summary, the evidence suggests..."

---

### "Despite Its Challenges..."
Rigid formula: acknowledge problems only to immediately dismiss them. Always: "Despite its [positive], [subject] faces challenges..." then "Despite these challenges, [optimistic conclusion]."

**Avoid:**
- "Despite these challenges, the initiative continues to thrive."
- "Despite their promising applications, pyroelectric materials face several challenges that must be addressed for broader adoption."

---

## Comment Additions (Canonical)

These were added in comments on the gist by the community and confirmed canonical by the author.

---

### False Exclusivity *(via @khaosdoctor)*
Claiming something is secret, unspoken, or overlooked when it isn't actually obscure. Valid only when pointing to something genuinely not widely known.

**Avoid:**
- "The problem (and this is the part nobody talks about) is systemic."
- "What nobody mentions is that the API has rate limits"
- "This is the part that doesn't get enough attention"
- "What most people don't know"

**OK:** Only when the claim is genuinely obscure and you can back that up.

---

### Clichéd Idioms *(via @khaosdoctor)*
Stock phrases no one actually uses in normal speech or writing. Forensic drama vocabulary or CEO email idioms.

**Avoid:**
- "The smoking gun" (AI's favorite)
- "a perfect storm"
- "move the needle"
- "at the end of the day"
- "game changer"
- "double-edged sword"
- "tip of the iceberg"
- "between a rock and a hard place"
- "on the same page"
- "up in the air"
- "out of the loop"
- "ballpark"

---

### Numbered Phase Labels *(via @felikcat)*
Stamping sequential labels like "Phase 1:", "Stage 2:", "Step 3:" onto sections or paragraphs. Humans describe what they're doing; AI announces a numbered march.

**Avoid:**
- "Phase 1: Gather requirements. Phase 2: Design the architecture. Phase 3: Implement."
- "Stage 4: Refactor the module for maintainability."

---

### Gravitas Words *(via @finrunsfar)*
Words like "fundamental", "crucial", "essential", "pivotal" that inflate ordinary statements. If you remove the word and the sentence means the same thing, it was filler.

**Avoid:**
- "The fundamental problem with..."
- "This is a crucial distinction."
- "It represents a pivotal shift in how we..."

---

### Compliment Sandwich *(via @finrunsfar)*
AI always leads with something positive before delivering criticism. Real people in technical contexts just say what's wrong.

**Avoid:**
- "X is a step in the right direction, but..."
- "X is a solid recommendation, however..."
- "Great suggestion! That said..."

---

### Fake Casual Quotes *(via @finrunsfar)*
Putting casualness in quotation marks to perform relatability. Real casual writing is just casual; it doesn't need to frame itself.

**Avoid:**
- "and go 'nope'"
- "say 'that's not right'"
- "what developers call 'good enough'"

---

## The Rule

Any of these patterns used once might be fine. The problem is when multiple tropes appear together or when a single trope is used repeatedly. Write like a human: varied, imperfect, specific.
