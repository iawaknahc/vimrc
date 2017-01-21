export VISUAL='vim'
export EDITOR="$VISUAL"

if [ -x "/usr/libexec/java_home" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

if [ -d "$HOME/android-sdk-macosx" ]; then
  export ANDROID_HOME="$HOME/android-sdk-macosx"
  export ANDROID_SDK="$ANDROID_HOME"
  export PATH="$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
fi

if [ -d "$HOME/android-ndk-r13" ]; then
  export ANDROID_NDK="$HOME/android-ndk-r13"
  export PATH="$ANDROID_NDK:$PATH"
fi

if [ -x "$(command -v ag)" ]; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

replace() {
  pattern=$(echo "$1" | perl -pe 's/\//\\\//g')
  replacement=$(echo "$2" | perl -pe 's/\//\\\//g')
  ag -0ls "$pattern" | xargs -0 perl -pi -e "s/$pattern/$replacement/g"
}
