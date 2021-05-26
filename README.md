# RB109 Assessment

Review material and notes to prepare for the RB109 Assessment.

## Table of Contents

1. [Variable Scope](./variable_scope.md)
    - [Variables](./variable_scope.md#variables)
    - [Scope](./variable_scope.md#scope)
      - [Global vs Local Scope](./variable_scope.md#global-vs-local-scope)
      - [Inner vs Outer Scope](./variable_scope.md#inner-vs-outer-scope)
    - [Scopes with a Block](./variable_scope.md#scopes-with-a-block)
      - [Variable Shadowing](./variable_scope.md#variable-shadowing)
    - [Scopes with Methods](./variable_scope.md#scopes-with-methods)

2. [Mutating Methods and Object Passing](./mutating_methods_object_passing.md)
    - [Mutating and Non-Mutating Methods](./mutating_methods_object_passing.md#mutating-and-non-mutating-methods)
      - [Non-Mutating Methods](./mutating_methods_object_passing.md#non-mutating-methods)
        - [Variable Assignment](./mutating_methods_object_passing.md#variable-assignment)
      - [Mutating Methods](./mutating_methods_object_passing.md#mutating-methods)
        - [Indexed Assignment](./mutating_methods_object_passing.md#indexed-assignment)
        - [Concatenation](./mutating_methods_object_passing.md#concatenation)
    - [Object Passing](./mutating_methods_object_passing.md#object-passing)
      - [What is Object Passing?](./mutating_methods_object_passing.md#what-is-object-passing)
      - [What happens in Ruby?](./mutating_methods_object_passing.md#what-happens-in-ruby)

3. [Ruby Collections](./working_with_collections.md)
    - [What is a collection?](./working_with_collections.md#what-is-a-collection?)
    - [Element Reference](./working_with_collections.md#element-reference)
        - [String Element Reference](./working_with_collections.md#string-element-reference)
        - [Array Element Reference](./working_with_collections.md#array-element-reference)
        - [Hash Element Reference](./working_with_collections.md#hash-element-reference)
        - [Element Reference Tricks](./working_with_collections.md#element-reference-tricks)
    - [Conversion](./working_with_collections.md#conversion)
    - [Element Assignment](./working_with_collections.md#element-assignment)
        - see also: [Indexed Assignment](mutating_methods_object_passing.md#indexed-assignment)
    - [Iteration](./working_with_collections.md#iteration)
        - [Basic Looping](./working_with_collections.md#basic-looping)
        - [Iterating over Hashes](./working_with_collections.md#iterating-over-hashes)
    - [Selection and Transformation](./working_with_collections.md#selection-and-transformation)
        - [Selection](./working_with_collections.md#selection)
        - [Transformation](./working_with_collections.md#transformation)
        - [Extracting to Methods](./working_with_collections.md#extracting-to-methods)
    - [Sorting](./working_with_collections.md#sorting)
        - [Comparison](./working_with_collections.md#comparison)
    - [Nested Data Structures](./working_with_collections.md#nested-data-structures)
        - [Referencing Collection Elements](./working_with_collections.md#referencing-collection-elements)
        - [Updating Collection Elements](./working_with_collections.md#updating-collection-elements)
        - [Variable Reference in Nested Collections](./working_with_collections.md#variable-reference-in-nested-collections)
        - [Shallow Copy](./working_with_collections.md#shallow-copy)
        - [Freezing Objects](./working_with_collections.md#freezing-objects)

4. [Ruby Collection Methods](./collection_methods.md)
    - [Each, Select, and Map](./collection_methods.md#each-select-and-map)
      - [Each](./collection_methods.md#each)
      - [Select](./collection_methods.md#select)
      - [Map](./collection_methods.md#map)
    - [Enumerable Methods](./collection_methods.md#enumerable-methods)
      - [any?](./collection_methods.md#any)
      - [all?](./collection_methods.md#all)
      - [each_with_index](./collection_methods.md#each_with_index)
      - [each_with_object](./collection_methods.md#each_with_object)
      - [first](./collection_methods.md#first)
      - [include?](./collection_methods.md#include)
      - [partition](./collection_methods.md#partition)
    - [Sorting Methods](./collection_methods.md#sorting-methods)
      - [sort](./collection_methods.md#sort)
      - [sort_by](./collection_methods.md#sort_by)
    - [Comparison Methods](./collection_methods.md#comparison-methods)
      - [min](./collection_methods.md#min)
      - [min_by](./collection_methods.md#min_by)
      - [max](./collection_methods.md#max)
      - [max_by](./collection_methods.md#max_by)
      - [minmax](./collection_methods.md#minmax)
      - [minmax_by](./collection_methods.md#minmax_by)

5. [Variables as Pointers](./variables_pointers.md)
    - [Assignment](./variables_pointers.md#assignment)
    - [Reassignment](./variables_pointers.md#reassignment)
    - [Immutable Objects](./variables_pointers.md#immutable-objects)
    - [Mutable Objects](./variables_pointers.md#mutable-objects)
      - [Setter Methods](./variables_pointers.md#setter-methods)
      - [Mutating Methods](./variables_pointers.md#mutating-methods)
    - [Pointer Arguments](./variables_pointers.md#pointer-arguments)
    - [Equal Values](./variables_pointers.md#equal-values)

6. [Return Values](./return_values.md)
    - [What is a Return Value?](./return_values.md#what-is-a-return-value)
    - [Ruby's Implied Return](./return_values.md#implied-return)
    - [Chaining Methods](./return_values.md#chaining-methods)
    - [Methods as Arguments](./return_values.md#methods-as-arguments)
    - [Output vs. Return](./return_values.md#output-vs-return)
    - [Return Values with Blocks](./return_values.md#return-values-with-blocks)

7. [Truthiness](./truthiness.md)
    - [Booleans](./truthiness.md#booleans)
    - [Truthiness and Falsiness](./truthiness.md#truthiness-and-falsiness)
    - [nil](./truthiness.md#nil)
    - [Truthiness in the Wild](./truthiness.md#truthiness-in-the-wild)

8. [Ruby Methods](./methods.md)
    - [What is a method?](./methods.md#what-is-a-method)
    - [Method Definitions](./methods.md#method-definitions)
    - [Method Invocation](./methods.md#method-invocation)
    - [Arguments vs Parameters](./methods.md#arguments-vs-parameters)

9. Interview Practice Problems
    - Watch Others Code Series Problems
      - [Part 4: Substring Test](./practice_problems/woc_substring_test.rb)
    - Codewars Problem Solutions
    - SPOT & Study Group Problems
      - [Count the number of duplicates](./practice_problems/spot_count_dups.rb)
      - [Odd Integer Substrings](./practice_problems/spot_odd_int_strings.rb)
      - [Substrings Hash](./practice_problems/substrings_hash.rb)
      - [Forward/Backward Strings](./practice_problems/forward_backward_strings.rb)
      - [Min Subarray Sum](./practice_problems/min_subarr_sum.rb)

## To-Do

- [x] Flashcards for "key concepts" behind every point in Table of Contents
- [x] Create collection space for explanation of "useful methods", generate my own examples for each.
- [x] Create local variable scope document
- [x] Create mutating vs non-mutating methods document
- [x] Create pass-by-reference vs pass-by-value document (within mutating vs non-mutating methods)
- [x] Create document for working with collections
  - [x] Element reference
  - [x] Conversion
  - [x] Element assignment
  - [x] Iteration
  - [x] Transformation and Selection
  - [x] Sorting
  - [x] Nested Data Structures
- [x] Create document for popular collection methods
- [x] Create document for variables as pointers
- [x] Create document for puts vs return
- [x] Create document for false vs nil and "truthiness"
- [x] Create document for method definition and method invocation
- [x] Create document for implicit return value of method invocation and blocks
- [x] Link documents together by creating links in interrelated sections
- [x] Create a Table of Contents, here, so all aspects of the study guide can be easily accessed.
- [x] Collect number of code snippets and write out my own explanation of what is happening within each (single document)
- [x] Create some "practice tests" that I can use for timed practice
- [x] Take timed practice test
