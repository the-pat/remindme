# Remindme

> Reddit's [RemindMeBot](https://github.com/Watchful1/RemindMeBot) in Discord

## Commands

- [x] `!remindme 30`: send a reminder in **30 seconds**.
- [ ] `!remindme 45 seconds`: send a reminder in **45 seconds**.
- [ ] `!remindme 5 minutes`: send a reminder in **5 minutes**.
- [ ] `!remindme 8 hours`: send a reminder in **8 hours**.
- [ ] `!remindme 1 day`: send a reminder in **1 day**.
- [ ] `!remindme 2 weeks`: send a reminder in **2 weeks**.
- [ ] `!remindme one year`: send a reminder in **1 year**.

More commands will be added as requested.

## Message Commands

Customize your interaction with the bot. Will likely include:

- [ ] Set timezone (`!timezone America/New_York`),
- [ ] Get reminders (`!reminders`),
- [ ] Cancel reminder (`!cancel 123`)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `remindme` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:remindme, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/remindme](https://hexdocs.pm/remindme).
