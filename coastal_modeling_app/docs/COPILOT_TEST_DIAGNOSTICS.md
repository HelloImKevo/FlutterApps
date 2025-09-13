# Copilot Test Diagnostics Instructions

## How to Detect and Debug Flutter Test Failures

### 1. **Always Check Terminal Output First**
When tests fail, the terminal output contains the actual error details. Look for:
```
══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
```

### 2. **Common Test Failure Patterns**

#### Widget Not Found Errors:
```
Expected: exactly one matching candidate
Actual: _TextWidgetFinder:<Found 0 widgets with text "SomeText": []>
```
**Cause**: The widget/text doesn't exist in the widget tree
**Solution**: Check actual widget structure with `debugDumpApp()` or verify widget rendering

#### Element Not Found for Interaction:
```
The finder "Found 0 widgets with type "ElevatedButton"..." could not find any matching widgets
```
**Cause**: Trying to tap/interact with non-existent widgets
**Solution**: Use correct finder patterns or verify widget exists before interaction

#### Semantic Label Mismatches:
```
Expected: findsOneWidget
Actual: _ElementPredicateWidgetFinder:<Found 0 widgets...>
```
**Cause**: Semantic labels don't match actual implementation
**Solution**: Check actual semantic labels in widget code

### 3. **Debugging Strategy**
1. **Read the full terminal output** - don't just look at summary
2. **Check the actual widget implementation** before writing tests
3. **Use `find.byType()` before `find.byText()` to verify widget existence**
4. **Test widget rendering first, then interactions**
5. **Use `tester.pumpAndSettle()` after interactions that trigger async operations**

### 4. **Test Writing Best Practices**
- Start with simple existence tests: `expect(find.byType(MyWidget), findsOneWidget)`
- Verify text content exists before testing interactions
- Use descriptive test names that match what you're actually testing
- Always check widget tree structure matches expectations

### 5. **When Tests Fail**
1. Run individual tests to isolate issues
2. Check if widgets are actually being rendered
3. Verify the widget tree contains expected elements
4. Match test expectations to actual implementation, not assumed behavior
