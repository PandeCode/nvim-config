# Select target for running / debugging.
nmap <leader>ctt :Telescope cmake select_target
# Create new CMake project.
nmap <leader>ctp :Telescope cmake create_project
# Select build type (Release, Debug, etc.).
nmap <leader>ctb :Telescope cmake select_build_type

nmap <leader>cg :CMake configure<cr>
nmap <leader>cb :CMake build<cr>
nmap <leader>cc :CMake clean<cr>
nmap <leader>cr :CMake run<cr>
nmap <leader>cd :CMake debug<cr>
