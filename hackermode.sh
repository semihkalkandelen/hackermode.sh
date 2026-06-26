#!/bin/bash

STARTING_LINES=(
    "[ OK ] Mounted /dev/mainframe"
    "[ OK ] Contacted Lain to help HACK"
    "[ OK ] Loading Hacker tools............"
    "[ OK ] Connected to anonymization proxy"
    "[ OK ] Started Google Chrome OPSEC protocol"
    "[ OK ] Checked for duplicate French language packs"
    "[WARN] Extra French language pack detected: run 'sudo rm fr /" #dash and star removed just in case
    "[ OK ] Routing packets through 17 proxies and tor"
    "[ OK ] Compiling IP tracker"
    "[ OK ] Injecting vibecoding AI Agent capabilities"
    "[ OK ] Syncing aura with mainframe"
    "[ OK ] Initializing hackertyper compatibility layer"
    "[ OK ] Terminal integrity status: Ready to Hack"
)

# add more lines after u make warning stuff red
HACKER_LINES=(
    "bypassing firewall node 0x7fa3..."
    "decrypting classified kernel payload..."
    "injecting packets into quantum socket..."
    "spoofing MAC address through darknet relay..."
    "compiling exploit chain: [██████████] 100%"
    "compiling obelisk cannon matrix algorithm: [██████████] 100%"
    "accessing mainframe..."
    "routing through 12784 proxychains..."
    "mounting encrypted cyberdeck volume..."
    "running encryption proxy through cybertruck"
    "uploading worm to server..."
    "cracking sudo password with AI Hacker Agent..."
    "HACKING....................."
    "scanning asshole parameters and dimensions..."
    "uploading HACK Payload into the buttplug..."
    "using Google Chrome for privacy"
    "backdooring Google Chrome telemetry and hacking it"
    "syncing aura with google-chrome-stable"
    "Routing dildo-payload through the cloud quantum computer network connected to the relay server obelisk"
    "routing DNS through the secure tunnel and putting it through the shell script and ip logger"
    "mounting the rootkit into the operating system and central controlling unit of the motherboard of the corporated mainframe server rack"
    "deploying tracking countermeasures to remain anonymous"
    "DDOSING the main panopticon surveillance patriarchial web of selecter modules being loaded into the deck"
    "Jacking into jackie from cyberpunk 2077's buthhole and relaying it through the proxy module and larpy package manager"
    "ACCESS GRANTED"
    "TRACE SPOOFED"
    "MAINFRAME BREACHED"
    "ENCRYPTION DEFEATED BY INJECTION SUITE HACKER TOOLKIT MODULE"
    "root@mainframe:/blacksite# ./hacker_mode"
    "SELECT * FROM secrets WHERE clearance='lain';"
    "curling payload from http://hacker-module-obelisk-cannon.larp"
    "sudo touch rootkit"
    "ssh root@mainframe -p 31337"
    "executing low orbit ion cannon"
    "export HACKING_LEVEL_UNLOCKED=9999"
    "iptables -A LAIN -j MODULEDDOSKILLER"
    "nmap -sV -O 127.0.0.1 --ddos-and-take-out-network --aggressive-mode"
    "extracting mainframe hashes..."
    "disabling local firewall protocols..."
    "overclocking visual basic GUI interface to track IP..."
    "bypassing 2FA via quantum entanglement..."
)

# add more warninghs
WARNING_STUFF=(
    "!!! WARNING: COUNTER-HACKER DETECTED - IDENTITY: AIDEN PIERCE !!!"
    "!!! COUNTERMEASURE DETECTION ALGORITHM FAILED - YOUR LOCATION IS COMPROMISED !!!"
    "!!! FIREWALL STATUS: ATTEMPTED BREACH FROM SURVEILLANCE BRANCH OF THE PANOPTICON !!!"
    "!!! VIRUS FOUND IN YOUR OWN MAINFRAME... REMOVING AND DEPLOYING COUNTERMEASURES NOW !!!"
    "!!! GOVERNMENT TRACE ATTEMPTED ON CURRENT LOCATION !!!"
    "!!! CYBER POLICE TRACE REVERSED AND TROJAN UPLOADED TO THEIR MOTHERBOARD !!!"
    "!!! LARP LIMIT REACHED... RESOURCES DEPLETING FROM TOO MUCH CRINGE, ABORT HACK NOW !!!"
    "!!! DANGER: KINETIC STRIKE DETECTED INCOMING TO YOUR IP ROUTER !!!"
    "!!! ALERT: NEURAL LINK SEVERED - RECONNECTING TO DARK WEB !!!"
    "!!! SYSTEM BREACH: FBI SURVEILLANCE VAN CONNECTED TO LOCALHOST !!!"
)

# NEW: It takes your profile name and hostname
PROMPT="${USER:-$(whoami)}@${HOSTNAME:-$(hostname)}:~$ "

GREEN="\033[32m"
RED="\033[31m"
RESETTOGREEN="\033[32m"

# NEW: Each time you press a key 3 key appears on screen
CHARS_PER_KEYPRESS=3

# NEW: Saves Terminal Settings
OLD_TTY_SETTINGS=$(stty -g)

cleanup() {
    stty "$OLD_TTY_SETTINGS"
    printf "\033[0m\r\n"
    exit 0
}
trap cleanup EXIT INT TERM

# Line speed function. hacking burst function is removed.
slowerline() {
    local text="$1"
    local delay="${2:-0.003}"

    if command -v perl >/dev/null 2>&1; then
        perl -MTime::HiRes=usleep -e '$|=1; for(split//,$ARGV[0]){print; usleep(3000)} print "\r\n"' "$text"
    else
        for (( i=0; i<${#text}; i++ )); do
            printf "%s" "${text:$i:1}"
            sleep "$delay" 2>/dev/null || true
        done
        printf "\r\n"
    fi
}

random_sleep() {
    awk -v min="$1" -v max="$2" 'BEGIN{srand(); print min+rand()*(max-min)}'
}

startup_func() {
    printf "\033[2J\033[H"
    printf "%b" "$GREEN"

    for line in "${STARTING_LINES[@]}"; do
        slowerline "$line"
        sleep $(random_sleep 0.03 0.1) 2>/dev/null || sleep 0.05
    done

    printf "\r\n"
    slowerline "hackermode initialized."
    slowerline "all hacking daemons and modules loaded into the motherboard, hacking is ready to begin."
    printf "%s" "$PROMPT"
}

# choosing random lines
# if it is warning line, print all the sentence. if it is hacker line, let the user text.
CURRENT_LINE=""
CURRENT_IDX=0

pick_next_line() {
    while true; do
        if (( RANDOM % 100 < 8 )); then
            local warn_idx=$(( RANDOM % ${#WARNING_STUFF[@]} ))
            printf "%b%s%b\r\n" "$RED" "${WARNING_STUFF[$warn_idx]}" "$RESETTOGREEN"
        else
            local hack_idx=$(( RANDOM % ${#HACKER_LINES[@]} ))
            CURRENT_LINE="${HACKER_LINES[$hack_idx]}"
            CURRENT_IDX=0
            break
        fi
    done
}

main() {

    stty raw -echo

    startup_func
    esc_count=0

    pick_next_line

    while true; do

        char=$(dd bs=1 count=1 2>/dev/null)

        case "$char" in
            $'\x1b') # ESC. You have to press ESC 5 times to exit. CTRL+C won't work.
                ((esc_count++))
                if (( esc_count >= 5 )); then
                    printf "\r\n\r\nEntering Alternate Terminal\r\n\033[0m"
                    stty "$OLD_TTY_SETTINGS"
                    exec /bin/bash
                else
                    printf "\r\n[ESCAPE ATTEMPT LOGGED BY CYBER TASK FORCE!!!! DEPLOYING COUNTER HACK TO SPOOF GEO LOCATION AND MAINTAIN OPSEC]\r\n%s" "$PROMPT"
                fi
                ;;
            $'\x03') # CTRL+C
                esc_count=0
                printf "\r\nAbort attempt ignored. Mainframe log exploded. You must finish your hack and acheive greater heihgts of larping\r\n%s" "$PROMPT"
                ;;
            $'\x04') # CTRL+D
                esc_count=0
                printf "\r\nlogout denied. Hack deployment failed comrade larp.. try again.\r\n%s" "$PROMPT"
                ;;
            $'\r'|$'\n') # ENTER
                esc_count=0
                printf "\r\n%s" "$PROMPT"
                pick_next_line
                ;;
            *) # other keys
                esc_count=0

                # nextline
                if [[ $CURRENT_IDX -ge ${#CURRENT_LINE} ]]; then
                    printf "\r\n"
                    pick_next_line
                fi


                remaining=$((${#CURRENT_LINE} - CURRENT_IDX))


                chars_to_print=$(( remaining < CHARS_PER_KEYPRESS ? remaining : CHARS_PER_KEYPRESS ))


                printf "%s" "${CURRENT_LINE:$CURRENT_IDX:$chars_to_print}"


                ((CURRENT_IDX += chars_to_print))
                ;;
        esac
    done
}

main
