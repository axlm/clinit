function chcl --argument-names color --description="Change output color"
  function __process_modifier --argument-names modifier
    switch $modifier
      case 'b' 'B' 'bold' 'BOLD'
        set_color --bold
        #case 'i' 'I' 'italic' 'ITALIC'
      case 'n' 'N' 'normal' 'NORMAL'
        set_color normal
      case '*'
        set_color normal
    end
  end

  switch $color
    case 'bk' 'black' 'BLACK' 'Black'       \
      'be' 'blue' 'BLUE' 'Blue'          \
      'bn' 'brown' 'BROWN' 'Brown'       \
      'cn' 'cyan' 'CYAN' 'Cyan'          \
      'gn' 'green' 'GREEN' 'Green'       \
      'ma' 'magenta' 'MAGENTA' 'Magenta' \
      'nl' 'normal' 'NORMAL' 'Normal'    \
      'oe' 'orange' 'ORANGE' 'Orange'    \
      'pe' 'purple' 'PURPLE' 'Purple'    \
      'rd' 'red' 'RED' 'Red'             \
      'we' 'white' 'WHITE' 'White'       \
      'yw' 'yellow' 'YELLOW' 'Yellow'
      set_color $color
    case '*'
      echo 'normal'
  end

  if count $argv > 1
    __process_modifier $argv[2]
  end
end

function bk
  chcl 'black'
  echo $argv
end

function be
  chcl 'blue'
  echo $argv
end

function bn
  chcl 'brown'
  echo $argv
end

function cn
  chcl 'cyan'
  echo $argv
end

function gn
  chcl 'green'
  echo $argv
end

function ma
  chcl 'magenta'
  echo $argv
end

function nl
  chcl 'normal'
  echo $argv
end

function oe
  chcl 'orange'
  echo $argv
end

function pe
  chcl 'purple'
  echo $argv
end

function rd
  chcl 'red'
  echo $argv
end

function we
  chcl 'white'
  echo $argv
end

function yw
  chcl 'yellow'
  echo $argv
end
