---
name: osy-ruby
description: How to write Ruby code in preferred style. Refer when writing Ruby code and tests.
---

## General Preference

Apply these rules unless project convention disagree.

* Strongly prefer `if !cond` instead of `unless cond`.
* Prefer Data over Structs.

## RSpec

* Do not fear repeating yourself.
* When stating expectations, embed immediate values (e.g. string literals) instead of refering to variables.
  * Only use references when the value itself is unstable AND does not have high value in testing context (e.g. ActiveRecord `id` and `created_at`).
  
* Guidance to using `let`
  * Consider each `let` a source of complexity. Keep usage relatively modest.
  * Avoid declaring toplevel `let`s. They make finding declarations harder for the reader of examples.
    * Line-level colocation is much more important than eliminating duplication.
  * Keep `let`s in context-level (`context "#foo" { let(:bar) { ... } }`) when in doubt.

