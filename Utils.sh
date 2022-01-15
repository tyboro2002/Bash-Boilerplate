#######################
## ERRORS & CHECKING
#######################

## Deze versie van panic functie dient gebruikt te worden wanneer 
## er meerdere (minstens 3) verschillende foutboodschappen met hun respectievelijke
## exit status moeten uitgeprint worden
## @param (1): de exit status
function panic() {
  case $1 in
    (1) echo "ERR MSG 1" >&2
        ;;
    (2) echo "ERR MSG 2" >&2
        ;;
    (3) echo "ERR MSG 3" >&2
        ;;
  esac	
  exit $1
}

## deze versie van panic dient gebruikt te worden wanneer
## er een algemene foutboodschap moet uitgeprint worden met
## variabele exit status
## @param (1): de exit status
function panic() {
  echo "ERR MSG" >&2
  exit $1
}

## check of het bestand ongewoon of onleesbaar is
## @param (1): de naam van het bestand
if [[ ! -f $1 ]] || [[ ! -r $1 ]]; then
    # panic 1
fi

## check of het nummer een strikt positief natuurlijk getal is zonder leading zero
[[ "01" =~ ^[1-9][0-9]*$ ]] || echo "NaN"

## check of het nummer een natuurlijk getal is (eventueel met leading zero)
[[ "01" =~ ^[0-9]+$ ]] || echo "NaN"



#######################
## OPTIES
#######################

## hieronder de boilerplate voor optie-afhandeling
a_var="niks"
b_var="niks"
c_flag=0
d_flag=0

while getopts ":a:b:cd" opt; do
  case $opt in
    (a) a_var=$OPTARG
        ;;
    (b) b_var=$OPTARG
        ;;
    (c) c_flag=1
        ;;
    (d) d_flag=1
	;;
    \?) # panic 1
        ;;
  esac
done
shift $((OPTIND - 1))



#######################
## RANDOM
#######################

## download "URL" "file"
wget -qO- "URL" >"my_file.txt"
