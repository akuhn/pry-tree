# pry-tree

Show the tree of classes and methods in a module.

```
[1] pry(main)> tree Pry::Helpers
Helpers
  .new  .tablify  .tablify_or_one_line  .tablify_to_screen_width
  BaseHelpers
    .colorize_code              .heading    .jruby_19?  .mri_20?  .new               .safe_send         .use_ansi_codes?  safe_send
    .command_dependencies_met?  .highlight  .mri?       .mri_21?  .not_a_real_file?  .silence_warnings  .windows?
    .find_command               .jruby?     .mri_19?    .mri_2?   .rbx?              .stagger_output    .windows_ansi?
  CommandHelpers
    .absolute_index_number  .get_method_or_raise  .one_index_number           .restrict_to_lines        .unindent
    .absolute_index_range   .internal_binding?    .one_index_range            .set_file_and_dir_locals
    .command_error          .new                  .one_index_range_or_number  .temp_file
  DocumentationHelpers
    .get_comment_content  .process_comment_markup  .process_yardoc      .strip_comments_from_c_code
    .new                  .process_rdoc            .process_yardoc_tag  .strip_leading_whitespace
  OptionsHelpers
    .method_object  .method_options  .new
  Table
    .new  ==  column_count  column_count=  columns  fits_on_line?  items  items=  rows_to_s  to_a  to_s
  Text
    .black  .bright_black  .bright_default  .bright_purple  .bright_yellow  .green    .new       .purple       .white
    .blue   .bright_blue   .bright_green    .bright_red     .cyan           .indent   .no_color  .red          .with_line_numbers
    .bold   .bright_cyan   .bright_magenta  .bright_white   .default        .magenta  .no_pager  .strip_color  .yellow
[2] pry(main)>
```

## Installation

Install the gem globally or inside the :development group of your gemfile:

```
gem install 'pry-tree'
```

Pry will automagically load the plugin.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akuhn/pry-sql.
