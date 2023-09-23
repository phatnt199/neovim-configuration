local mod = require('telescope')

mod.load_extension('media_files')
mod.setup {
  extensions = {
    media_files = {
      file_types = { 
        'png', 
        'jpg', 
        'jpeg', 
        'webp', 
        'pdf',
      },
      find_cmd = 'rg'
    }
  }
}
