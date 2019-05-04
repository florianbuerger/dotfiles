if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Better Touch Tool
export BTT_WEBSERVER_URL=http://127.0.0.1:64875
export BTT_WEBSERVER_SHAREDSECRET=foobar
# export BTT_EVENTKIT_CALENDAR_NAMES=Personal,Work,florian@flightyapp.com,Calendar
export BTT_EVENTKIT_MAXLENGTH=160
export BTT_USR_ROOT=~/bettertouchtool
export BTT_GIT_WORKING_DIR=~/Code/Flighty_LLC/flighty-ios
