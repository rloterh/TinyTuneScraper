class Display
  $choice_input = ''
  $sub_path = ''

  def display_intro_screen
    puts ''
    puts "                                               T I N Y T U N E S    S C R A P E R\n"
    puts '                                                                 . . .'
    puts '                                                               . - - :'
    puts '                                                            . - - :'
    puts '                                                  . : : : : . : : : : : : : .'
    puts '                                              : - - - - - - - - - - - - - : : .'
    puts '                                             . - - - - - - - - - - - - - -:'
    puts '                                             : - - - - - - - - - - - - - -:'
    puts '                                             : - - - - - - - - - - - - - -:'
    puts '                                             : - - - - - - - - - - - - - -:'
    puts '                                              . - - - - - - - - - - - - - - - .'
    puts '                                               . - - - - - - - - - - - - - - .'
    puts '                                                 . - - - - - - - - - - - - .'
    puts '                                                  . : : : . . . : : : : .'
    puts "                                                     .  .  .     . . .\n\n"
    puts '                                                           V..1.0 '
    puts "                                          An iTunes App Store games Mini Scraping Tool\n\n\n"
    puts '   HOW TO:-'
    puts '   ========'
    puts '     [Type  \'pop\', and press Enter/ Return key] -> To list POPULAR iTunes Appstore games'
    puts '     [Type a letter, |A-Z|, and press Enter/ Return] -> To list the corresponding Alphabetical game index'
    puts '     [Type  \'more\', and press Enter/ Return key] -> To list MORE iTunes Appstore games'
  end

  def check_choice
    $choice_input = gets.strip.upcase
    if $choice_input.match(/^[[:alpha:]]$/)
      $sub_path = "?letter=#{$choice_input}"
    elsif $choice_input == 'POP'
      $sub_path = ''
    elsif $choice_input == 'MORE'
      $sub_path = '?letter=*'
    else
      puts "          PLEASE INPUT A CORRECT OPTION TO CONTINUE..\n"
      check_choice
    end
  end
end
