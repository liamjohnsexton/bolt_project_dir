plan profile::delete_large_files (
  TargetSpec $nodes,
  String     $min_size = '5Mb',
  String     $folder   = '/tmp',
) {
  # Find large files
  $results = run_task('profile::find_files_larger_than', $nodes, {
    folder   => $folder,
    min_size => $min_size,
  })

  $results.each |$result| {
    # Pull out the node name
    $node = $result.target.name

    # Pull out the files
    $files = $result.value['files']

    # Loop over each of the files and delete them
    $files.each |$file| {
      # Ideally we would delete the file here, the file is stored in $file

    }
  }
}
