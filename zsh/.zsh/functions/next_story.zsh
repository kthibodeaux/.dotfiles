function next_story() {
  pivotal_stories_script=`which unstarted_pivotal_stories.rb`
  command_prefix='feature'
  print -z $(echo $command_prefix && ruby $pivotal_stories_script | fzf-tmux | awk '{print $1;}')
}
