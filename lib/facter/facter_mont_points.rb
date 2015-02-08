mounts = []
mntpoints=`mount -t ext2,ext3,ext4,reiserfs,xfs,tmpfs`
mntpoints.split(/\n/).each do |m|
	mount = m.split(/ /)[2]
	mounts << mount
end

Facter.add("mounts") do
	confine :kernel => :linux

	setcode do
		mounts.join(',')
	end
end

mounts.each do |mount|
	output = %x{df -P #{mount}}
	output.each do |str|
		dsk_size = nil
		dsk_used = nil
		dsk_avail = nil
		if str =~ /^\S+\s+([0-9]+)\s+([0-9]+)\s+([0-9]+)\s+/
			dsk_size = $1
			dsk_used = $2
			dsk_avail = $3
			Facter.add("mount_#{mount}_size") do
				setcode do
					dsk_size
				end
			end
			Facter.add("mount_#{mount}_used") do
				setcode do
					dsk_used
				end
			end
			Facter.add("mount_#{mount}_avail") do
				setcode do
					dsk_avail
				end
			end
		end
	end
end
