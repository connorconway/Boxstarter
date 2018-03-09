. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

Install-BoxstarterPackage -PackgeName https://gist.githubusercontent.com/connorconway/2d06d1d17275bca5ce0f4ce8461c7b8a/raw/5388e8e866a520ba155113558d0c74b854e58964/developer_machine.txt -DisableReboots