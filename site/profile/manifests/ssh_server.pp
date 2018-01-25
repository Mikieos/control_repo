class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC09CiNvdS5ZsQr/eJxJa2MMFcTDRtNQi3s4bXMppGTRUxq1cFOAZta/PH9Uf0IO9UBBxykEIvz0HUqool0ELqkx2EIti3Z7Jkm6McO9H0aCLLAycToUTJ5RVGkDa9kURbWhKgyUTRkxLoVhFnUK+BDt5deIhYKviuHpedEPOnG/PuToXZqKU579zjpbDv8KTJL+KBaaIhMq1N4GXiyiZdFAcpS9L12QhyZiCGcHWWTaZ300aHYFyj10IQOen7qyYht85D7kMB/JFnryRku9uPOJrBt4AWhSQj//r8En5nls30qiOgCmZbPQll2rM3EqddcjwsYfTPnQt2VPcCXkgsR',
	}  
}
