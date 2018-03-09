. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

Install-BoxstarterPackage -PackgeName https://gist.githubusercontent.com/connorconway/9714bda351705663174fd24fa96aad34/raw/ee150c1cc73ebf700e5934cb1c1ccd7c9ac98ec6/user_machine.txt -DisableReboots