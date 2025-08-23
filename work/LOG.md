unshare: unshare failed: Operation not permitted
it looks like wine32 is missing, you should install it.
strace: Process 4689 attached
[pid  4689] +++ exited with 0 +++
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4689, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
strace: Process 4690 attached
strace: Process 4691 attached
[pid  4690] +++ exited with 0 +++
[pid  4688] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4690, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
[pid  4691] +++ exited with 1 +++
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4691, si_uid=1000, si_status=1, si_utime=0, si_stime=0} ---
multiarch needs to be enabled first.  as root, please
execute "dpkg --add-architecture i386 && apt-get update &&
apt-get install wine32:i386"
wine: created the configuration directory '/home/ubuntu/.wine'
strace: Process 4692 attached
[pid  4692] socketpair(AF_UNIX, SOCK_STREAM, 0, [3, 4]) = 0
[pid  4692] shutdown(3, SHUT_WR)        = 0
strace: Process 4693 attached
[pid  4693] socket(AF_UNIX, SOCK_STREAM, 0) = 8
[pid  4693] bind(8, {sa_family=AF_UNIX, sun_path="socket"}, 9) = 0
[pid  4693] listen(8, 5)                = 0
[pid  4692] +++ exited with 0 +++
[pid  4688] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4692, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
[pid  4688] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4688] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[pid  4688] connect(4, {sa_family=AF_UNIX, sun_path="socket"}, 9) = 0
[pid  4688] recvmsg(4,  <unfinished ...>
[pid  4693] accept(8, {sa_family=AF_UNIX, sun_path=@"95f98"}, [110 => 8]) = 20
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\22\3\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[22]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] <... recvmsg resumed>{msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\22\3\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=28, cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, cmsg_data={pid=4693, uid=1000, gid=1000}}, {cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=56, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4688] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [0], 4) = 0
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\7\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20,  <unfinished ...>
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\t\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] <... recvmsg resumed>{msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\7\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[22]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\t\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[23]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\4\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[19]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\4\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\2\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[2]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\2\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[24]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[25]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4688] socketpair(AF_UNIX, SOCK_STREAM, 0, [7, 11]) = 0
[pid  4688] setsockopt(7, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\v\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[11]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\v\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[25]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\22\3\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[27]}], msg_controllen=20, msg_flags=0}, 0) = 4
strace: Process 4694 attached
strace: Process 4695 attached
[pid  4694] +++ exited with 0 +++
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\22\3\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=28, cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, cmsg_data={pid=4693, uid=1000, gid=1000}}, {cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[3]}], msg_controllen=56, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4695] setsockopt(7, SOL_SOCKET, SO_PASSCRED, [0], 4) = 0
[pid  4695] sendmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\5\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\5\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[27]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4695] sendmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\10\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[8]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\0\0\10\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[28]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\4\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[19]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\4\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"C:\\windows\\system32\\wineboot.exe"
002c:trace:module:get_load_order got hardcoded default for L"wineboot.exe"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[30]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\C:\\windows\\system32\\wineboot.exe" at 0x140000000-0x140078000
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .text at 0x140001000 off 1000 size 8000 virt 75a0 flags 60000060
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .data at 0x140009000 off 9000 size 1000 virt 170 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .rdata at 0x14000a000 off a000 size c000 virt ba00 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .pdata at 0x140016000 off 16000 size 1000 virt 2dc flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .xdata at 0x140017000 off 17000 size 1000 virt 3bc flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .bss at 0x140018000 off 0 size 0 virt 5a0 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .idata at 0x140019000 off 18000 size 2000 virt 19c8 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .rsrc at 0x14001b000 off 1a000 size 8000 virt 7ef0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section .reloc at 0x140023000 off 22000 size 1000 virt 74 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /4 at 0x140024000 off 23000 size 1000 virt 150 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /19 at 0x140025000 off 24000 size 37000 virt 36800 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /31 at 0x14005c000 off 5b000 size 2000 virt 1ce4 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /45 at 0x14005e000 off 5d000 size 7000 virt 626d flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /57 at 0x140065000 off 64000 size 1000 virt f18 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /70 at 0x140066000 off 65000 size 1000 virt 4fd flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /81 at 0x140067000 off 66000 size e000 virt dcf2 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\wineboot.exe" section /92 at 0x140075000 off 74000 size 3000 virt 24f0 flags 42000040
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[31]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\C:\\windows\\system32\\ntdll.dll" at 0x6fffffc50000-0x6ffffffeb000
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .text at 0x6fffffc51000 off 1000 size 6c000 virt 6b0e0 flags 60000020
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .data at 0x6fffffcbd000 off 6d000 size 1000 virt d20 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rodata at 0x6fffffcbe000 off 6e000 size 3000 virt 2054 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rdata at 0x6fffffcc1000 off 71000 size 13000 virt 129d0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /4 at 0x6fffffcd4000 off 84000 size 1000 virt 8f0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .pdata at 0x6fffffcd5000 off 85000 size 9000 virt 8070 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .xdata at 0x6fffffcde000 off 8e000 size 6000 virt 5eb0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .bss at 0x6fffffce4000 off 0 size 0 virt 3510 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .edata at 0x6fffffce8000 off 94000 size b000 virt a02c flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .idata at 0x6fffffcf3000 off 9f000 size 1000 virt 18 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rsrc at 0x6fffffcf4000 off a0000 size 1000 virt 3b0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .reloc at 0x6fffffcf5000 off a1000 size 1000 virt 13c flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /14 at 0x6fffffcf6000 off a2000 size 1000 virt ac0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /29 at 0x6fffffcf7000 off a3000 size 140000 virt 13f134 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /41 at 0x6fffffe37000 off 1e3000 size 11000 virt 10101 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /55 at 0x6fffffe48000 off 1f4000 size 5e000 virt 5d988 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /67 at 0x6fffffea6000 off 252000 size 14000 virt 139c8 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /80 at 0x6fffffeba000 off 266000 size 6000 virt 5f73 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /91 at 0x6fffffec0000 off 26c000 size 107000 virt 106b15 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /102 at 0x6ffffffc7000 off 373000 size 24000 virt 23160 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\C:\\windows\\system32\\ntdll.dll" dynamic base 170000000 -> 6fffffc50000 mapped at 0x6fffffc50000
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[32]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:load_apiset_dll loaded L"\\??\\C:\\windows\\system32\\apisetschema.dll" apiset at 0x7ffffe301000
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[24]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[5]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\wineboot.exe" 00007FFFFE322080 0000000140000000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\wineboot.exe" at 0000000140000000: builtin
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[33]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" at 0x6fffffa80000-0x6fffffc38000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .text at 0x6fffffa81000 off 1000 size 30000 virt 2ffe0 flags 60000020
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .data at 0x6fffffab1000 off 31000 size 1000 virt 200 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .rodata at 0x6fffffab2000 off 32000 size 2000 virt 1d6c flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .rdata at 0x6fffffab4000 off 34000 size 4000 virt 31c0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /4 at 0x6fffffab8000 off 38000 size 1000 virt 710 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .pdata at 0x6fffffab9000 off 39000 size 6000 virt 5118 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .xdata at 0x6fffffabf000 off 3f000 size 4000 virt 328c flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .bss at 0x6fffffac3000 off 0 size 0 virt 240 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .edata at 0x6fffffac4000 off 43000 size b000 virt a458 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .idata at 0x6fffffacf000 off 4e000 size a000 virt 96e4 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .rsrc at 0x6fffffad9000 off 58000 size 9000 virt 8190 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section .reloc at 0x6fffffae2000 off 61000 size 1000 virt 1c flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /14 at 0x6fffffae3000 off 62000 size 1000 virt 510 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /29 at 0x6fffffae4000 off 63000 size bd000 virt bca66 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /41 at 0x6fffffba1000 off 120000 size b000 virt a6d8 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /55 at 0x6fffffbac000 off 12b000 size 20000 virt 1fb6a flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /67 at 0x6fffffbcc000 off 14b000 size 9000 virt 8108 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /80 at 0x6fffffbd5000 off 154000 size 3000 virt 20fd flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /91 at 0x6fffffbd8000 off 157000 size 55000 virt 54ae0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" section /102 at 0x6fffffc2d000 off 1ac000 size b000 virt a870 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernel32.dll" dynamic base 178000000 -> 6fffffa80000 mapped at 0x6fffffa80000
002c:trace:module:load_dll looking for L"kernelbase.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[34]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" at 0x6fffff470000-0x6fffffa6c000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .text at 0x6fffff471000 off 1000 size 84000 virt 83800 flags 60000020
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .data at 0x6fffff4f5000 off 85000 size 2000 virt 1e90 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .rodata at 0x6fffff4f7000 off 87000 size 2000 virt 1dd4 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .rdata at 0x6fffff4f9000 off 89000 size 17000 virt 16ba0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /4 at 0x6fffff510000 off a0000 size 1000 virt 5a8 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .pdata at 0x6fffff511000 off a1000 size 9000 virt 8004 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .xdata at 0x6fffff51a000 off aa000 size 7000 virt 6fe8 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .bss at 0x6fffff521000 off 0 size 0 virt 28c0 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .edata at 0x6fffff524000 off b1000 size b000 virt a950 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .idata at 0x6fffff52f000 off bc000 size 5000 virt 473c flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .rsrc at 0x6fffff534000 off c1000 size 1cc000 virt 1cbc90 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section .reloc at 0x6fffff700000 off 28d000 size 1000 virt 194 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /14 at 0x6fffff701000 off 28e000 size 1000 virt 3c0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /29 at 0x6fffff702000 off 28f000 size 16d000 virt 16c51b flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /41 at 0x6fffff86f000 off 3fc000 size a000 virt 9742 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /55 at 0x6fffff879000 off 406000 size 71000 virt 70cb7 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /67 at 0x6fffff8ea000 off 477000 size 19000 virt 18770 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /80 at 0x6fffff903000 off 490000 size 4000 virt 39dc flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /91 at 0x6fffff907000 off 494000 size 13e000 virt 13df26 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" section /102 at 0x6fffffa45000 off 5d2000 size 27000 virt 26680 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\kernelbase.dll" dynamic base 174000000 -> 6fffff470000 mapped at 0x6fffff470000
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=2
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\kernelbase.dll" 00007FFFFE3226C0 00006FFFFF470000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernelbase.dll" at 00006FFFFF470000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\kernelbase.dll" at 00006FFFFF470000
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=3
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\kernel32.dll" 00007FFFFE322470 00006FFFFFA80000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernel32.dll" at 00006FFFFFA80000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\kernel32.dll" at 00006FFFFFA80000
002c:fixme:actctx:parse_depend_manifests Could not find dependent assembly L"Microsoft.Windows.Common-Controls" (6.0.0.0)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[35]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[18]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[36]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[38]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\20\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:load_dll looking for L"advapi32.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[39]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" at 0x6fffff330000-0x6fffff45c000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .text at 0x6fffff331000 off 1000 size 24000 virt 23f90 flags 60000060
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .data at 0x6fffff355000 off 25000 size 1000 virt 1f0 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .rodata at 0x6fffff356000 off 26000 size 1000 virt e30 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .rdata at 0x6fffff357000 off 27000 size 7000 virt 61c0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /4 at 0x6fffff35e000 off 2e000 size 1000 virt 360 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .pdata at 0x6fffff35f000 off 2f000 size 3000 virt 2cc4 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .xdata at 0x6fffff362000 off 32000 size 3000 virt 2478 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .bss at 0x6fffff365000 off 0 size 0 virt 19a0 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .edata at 0x6fffff367000 off 35000 size 5000 virt 46cc flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .idata at 0x6fffff36c000 off 3a000 size 4000 virt 3190 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .rsrc at 0x6fffff370000 off 3e000 size 1000 virt 3c8 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section .reloc at 0x6fffff371000 off 3f000 size 1000 virt 15c flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /14 at 0x6fffff372000 off 40000 size 1000 virt 3c0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /29 at 0x6fffff373000 off 41000 size 6b000 virt 6a4b1 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /41 at 0x6fffff3de000 off ac000 size 6000 virt 5705 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /55 at 0x6fffff3e4000 off b2000 size 1b000 virt 1a167 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /67 at 0x6fffff3ff000 off cd000 size 8000 virt 72a0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /80 at 0x6fffff407000 off d5000 size 2000 virt 174a flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /91 at 0x6fffff409000 off d7000 size 4c000 virt 4bca7 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" section /102 at 0x6fffff455000 off 123000 size 7000 virt 6e20 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\advapi32.dll" dynamic base 180000000 -> 6fffff330000 mapped at 0x6fffff330000
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernel32.dll" for L"kernel32.dll" at 00006FFFFFA80000, count=2
002c:trace:module:load_dll looking for L"kernelbase.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernelbase.dll" for L"kernelbase.dll" at 00006FFFFF470000, count=2
002c:trace:module:load_dll looking for L"msvcrt.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[40]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" at 0x6ffffefc0000-0x6fffff317000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .text at 0x6ffffefc1000 off 1000 size 70000 virt 6f0a0 flags 60000060
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .data at 0x6fffff031000 off 71000 size 2000 virt 1840 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .rodata at 0x6fffff033000 off 73000 size 2000 virt 146c flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .rdata at 0x6fffff035000 off 75000 size d000 virt c020 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /4 at 0x6fffff042000 off 82000 size 1000 virt 148 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .pdata at 0x6fffff043000 off 83000 size 8000 virt 79bc flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .xdata at 0x6fffff04b000 off 8b000 size 7000 virt 646c flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .bss at 0x6fffff052000 off 0 size 0 virt 1c60 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .edata at 0x6fffff054000 off 92000 size 7000 virt 62f8 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .idata at 0x6fffff05b000 off 99000 size 2000 virt 195c flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .rsrc at 0x6fffff05d000 off 9b000 size 1000 virt 398 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section .reloc at 0x6fffff05e000 off 9c000 size 1000 virt 220 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /14 at 0x6fffff05f000 off 9d000 size 2000 virt 1460 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /29 at 0x6fffff061000 off 9f000 size e8000 virt e72ca flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /41 at 0x6fffff149000 off 187000 size 11000 virt 10ea9 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /55 at 0x6fffff15a000 off 198000 size 61000 virt 60d1e flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /67 at 0x6fffff1bb000 off 1f9000 size 17000 virt 16c10 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /80 at 0x6fffff1d2000 off 210000 size 2000 virt 18ed flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /91 at 0x6fffff1d4000 off 212000 size 125000 virt 1248ba flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" section /102 at 0x6fffff2f9000 off 337000 size 1e000 virt 1dbf0 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\msvcrt.dll" dynamic base 180000000 -> 6ffffefc0000 mapped at 0x6ffffefc0000
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernel32.dll" for L"kernel32.dll" at 00006FFFFFA80000, count=3
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=4
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\msvcrt.dll" 00007FFFFE322AF0 00006FFFFEFC0000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\msvcrt.dll" at 00006FFFFEFC0000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\msvcrt.dll" at 00006FFFFEFC0000
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=5
002c:trace:module:load_dll looking for L"sechost.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[41]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" at 0x6ffffeef0000-0x6ffffefad000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .text at 0x6ffffeef1000 off 1000 size 17000 virt 16f10 flags 60000060
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .data at 0x6ffffef08000 off 18000 size 1000 virt 190 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .rodata at 0x6ffffef09000 off 19000 size 1000 virt ef0 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .rdata at 0x6ffffef0a000 off 1a000 size 4000 virt 38e0 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /4 at 0x6ffffef0e000 off 1e000 size 1000 virt 978 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .pdata at 0x6ffffef0f000 off 1f000 size 2000 virt 1404 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .xdata at 0x6ffffef11000 off 21000 size 2000 virt 1354 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .bss at 0x6ffffef13000 off 0 size 0 virt 1a0 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .edata at 0x6ffffef14000 off 23000 size 2000 virt 1e58 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .idata at 0x6ffffef16000 off 25000 size 2000 virt 13a8 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section .reloc at 0x6ffffef18000 off 27000 size 1000 virt f0 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /14 at 0x6ffffef19000 off 28000 size 1000 virt 230 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /29 at 0x6ffffef1a000 off 29000 size 47000 virt 46bce flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /41 at 0x6ffffef61000 off 70000 size 4000 virt 32e2 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /55 at 0x6ffffef65000 off 74000 size 13000 virt 12536 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /67 at 0x6ffffef78000 off 87000 size 4000 virt 3eb8 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /80 at 0x6ffffef7c000 off 8b000 size 1000 virt f93 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /91 at 0x6ffffef7d000 off 8c000 size 29000 virt 28045 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" section /102 at 0x6ffffefa6000 off b5000 size 7000 virt 62b0 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\sechost.dll" dynamic base 180000000 -> 6ffffeef0000 mapped at 0x6ffffeef0000
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernel32.dll" for L"kernel32.dll" at 00006FFFFFA80000, count=4
002c:trace:module:load_dll looking for L"kernelbase.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernelbase.dll" for L"kernelbase.dll" at 00006FFFFF470000, count=3
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=6
002c:trace:module:load_dll looking for L"ucrtbase.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll"
002c:trace:module:get_load_order got hardcoded default for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll"
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\34\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[42]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\34\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" at 0x6ffffeae0000-0x6ffffeed6000
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .text at 0x6ffffeae1000 off 1000 size 89000 virt 88f40 flags 60000060
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .data at 0x6ffffeb6a000 off 8a000 size 2000 virt 1b50 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .rodata at 0x6ffffeb6c000 off 8c000 size 4000 virt 3510 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .rdata at 0x6ffffeb70000 off 90000 size 10000 virt f030 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /4 at 0x6ffffeb80000 off a0000 size 2000 virt 1638 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .pdata at 0x6ffffeb82000 off a2000 size d000 virt c774 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .xdata at 0x6ffffeb8f000 off af000 size 9000 virt 8d40 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .bss at 0x6ffffeb98000 off 0 size 0 virt 20f0 flags c0000080
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .edata at 0x6ffffeb9b000 off b8000 size e000 virt d5e4 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .idata at 0x6ffffeba9000 off c6000 size 2000 virt 1b94 flags c0000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .rsrc at 0x6ffffebab000 off c8000 size 1000 virt 3c8 flags 40000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section .reloc at 0x6ffffebac000 off c9000 size 1000 virt 260 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /14 at 0x6ffffebad000 off ca000 size 2000 virt 1d70 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /29 at 0x6ffffebaf000 off cc000 size 114000 virt 11329a flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /41 at 0x6ffffecc3000 off 1e0000 size 16000 virt 155d5 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /55 at 0x6ffffecd9000 off 1f6000 size 6f000 virt 6e52d flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /67 at 0x6ffffed48000 off 265000 size 1b000 virt 1aae8 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /80 at 0x6ffffed63000 off 280000 size 2000 virt 1dc1 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /91 at 0x6ffffed65000 off 282000 size 150000 virt 14f155 flags 42000040
002c:trace:module:map_image_into_view mapping L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" section /102 at 0x6ffffeeb5000 off 3d2000 size 21000 virt 20660 flags 42000040
002c:trace:module:map_image_into_view relocating L"\\??\\Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ucrtbase.dll" dynamic base 180000000 -> 6ffffeae0000 mapped at 0x6ffffeae0000
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernel32.dll" for L"kernel32.dll" at 00006FFFFFA80000, count=5
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=7
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\ucrtbase.dll" 00007FFFFE322FB0 00006FFFFEAE0000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\ucrtbase.dll" at 00006FFFFEAE0000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\ucrtbase.dll" at 00006FFFFEAE0000
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\sechost.dll" 00007FFFFE322D30 00006FFFFEEF0000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\sechost.dll" at 00006FFFFEEF0000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\sechost.dll" at 00006FFFFEEF0000
002c:trace:module:build_module loaded L"\\??\\C:\\windows\\system32\\advapi32.dll" 00007FFFFE3228B0 00006FFFFF330000
002c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\advapi32.dll" at 00006FFFFF330000: builtin
002c:trace:module:load_dll Loaded module L"\\??\\C:\\windows\\system32\\advapi32.dll" at 00006FFFFF330000
002c:trace:module:load_dll looking for L"kernel32.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernel32.dll" for L"kernel32.dll" at 00006FFFFFA80000, count=6
002c:trace:module:load_dll looking for L"kernelbase.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\kernelbase.dll" for L"kernelbase.dll" at 00006FFFFF470000, count=4
002c:trace:module:load_dll looking for L"ntdll.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ntdll.dll" for L"ntdll.dll" at 00006FFFFFC50000, count=8
002c:trace:module:load_dll looking for L"ucrtbase.dll" in (null)
002c:trace:module:load_dll Found L"C:\\windows\\system32\\ucrtbase.dll" for L"ucrtbase.dll" at 00006FFFFEAE0000, count=2
002c:trace:module:load_dll looking for L"ws2_32.dll" in (null)
[pid  4693] sendmsg(25, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4695] recvmsg(7, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\f\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[9]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
002c:trace:module:get_load_order looking for L"Z:\\usr\\lib\\x86_64-linux-gnu\\wine\\x86_64-windows\\ws2_32.dll"
002c:trace:module:get_load_order_value got environment  for L"ws2_32"
002c:warn:module:load_dll Failed to load module L"ws2_32.dll"; status=c0000135
002c:err:module:import_dll Library ws2_32.dll (which is needed by L"C:\\windows\\system32\\wineboot.exe") not found
002c:err:module:loader_init Importing dlls for L"C:\\windows\\system32\\wineboot.exe" failed, status c0000135
[pid  4695] +++ exited with 53 +++
0024:trace:module:get_load_order looking for L"Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe"
0024:trace:module:get_load_order got main exe default n,b for L"Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe"
0024:trace:module:get_load_order looking for L"Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe"
0024:trace:module:get_load_order got main exe default n,b for L"Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe"
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[25]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\10\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
0024:trace:module:map_image_into_view mapping PE file L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" at 0x140000000-0x14019a000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .text at 0x140001000 off 600 size e3800 virt e4000 flags 60000020
0024:trace:module:map_image_into_view clearing 0x1400e4800 - 0x1400e5000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .rdata at 0x1400e5000 off e3e00 size 14200 virt 15000 flags 40000040
0024:trace:module:map_image_into_view clearing 0x1400f9200 - 0x1400fa000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .data at 0x1400fa000 off f8000 size 1600 virt 4000 flags c0000040
0024:trace:module:map_image_into_view clearing 0x1400fb600 - 0x1400fc000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .pdata at 0x1400fe000 off f9600 size 3400 virt 4000 flags 40000040
0024:trace:module:map_image_into_view clearing 0x140101400 - 0x140102000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .fptable at 0x140102000 off fca00 size 200 virt 4000 flags c0000040
0024:trace:module:map_image_into_view clearing 0x140102200 - 0x140103000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .reloc at 0x140106000 off fcc00 size c00 virt a54 flags 42000040
0024:trace:module:map_image_into_view clearing 0x140106c00 - 0x140107000
0024:trace:module:map_image_into_view mapping L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" section .oep at 0x140107000 off fd800 size 92c00 virt 92c00 flags c0000040
0024:trace:module:map_image_into_view clearing 0x140199c00 - 0x14019a000
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\0\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[0]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\0\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[24]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\1\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[1]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\1\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[26]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4688] sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\2\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[2]}], msg_controllen=20, msg_flags=0}, 0) = 8
[pid  4693] recvmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="$\0\0\0\2\0\0\0", iov_len=8}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[27]}], msg_controllen=24, msg_flags=0}, 0) = 8
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[29]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
0024:trace:module:map_image_into_view mapping PE file L"\\??\\C:\\windows\\system32\\ntdll.dll" at 0x6fffffc50000-0x6ffffffeb000
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .text at 0x6fffffc51000 off 1000 size 6c000 virt 6b0e0 flags 60000020
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .data at 0x6fffffcbd000 off 6d000 size 1000 virt d20 flags c0000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rodata at 0x6fffffcbe000 off 6e000 size 3000 virt 2054 flags c0000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rdata at 0x6fffffcc1000 off 71000 size 13000 virt 129d0 flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /4 at 0x6fffffcd4000 off 84000 size 1000 virt 8f0 flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .pdata at 0x6fffffcd5000 off 85000 size 9000 virt 8070 flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .xdata at 0x6fffffcde000 off 8e000 size 6000 virt 5eb0 flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .bss at 0x6fffffce4000 off 0 size 0 virt 3510 flags c0000080
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .edata at 0x6fffffce8000 off 94000 size b000 virt a02c flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .idata at 0x6fffffcf3000 off 9f000 size 1000 virt 18 flags c0000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .rsrc at 0x6fffffcf4000 off a0000 size 1000 virt 3b0 flags 40000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section .reloc at 0x6fffffcf5000 off a1000 size 1000 virt 13c flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /14 at 0x6fffffcf6000 off a2000 size 1000 virt ac0 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /29 at 0x6fffffcf7000 off a3000 size 140000 virt 13f134 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /41 at 0x6fffffe37000 off 1e3000 size 11000 virt 10101 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /55 at 0x6fffffe48000 off 1f4000 size 5e000 virt 5d988 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /67 at 0x6fffffea6000 off 252000 size 14000 virt 139c8 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /80 at 0x6fffffeba000 off 266000 size 6000 virt 5f73 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /91 at 0x6fffffec0000 off 26c000 size 107000 virt 106b15 flags 42000040
0024:trace:module:map_image_into_view mapping L"\\??\\C:\\windows\\system32\\ntdll.dll" section /102 at 0x6ffffffc7000 off 373000 size 24000 virt 23160 flags 42000040
0024:trace:module:map_image_into_view relocating L"\\??\\C:\\windows\\system32\\ntdll.dll" dynamic base 170000000 -> 6fffffc50000 mapped at 0x6fffffc50000
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[30]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\30\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[7]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
0024:trace:module:load_apiset_dll loaded L"\\??\\C:\\windows\\system32\\apisetschema.dll" apiset at 0x7ffffe201000
[pid  4688] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4694, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
[pid  4693] sendmsg(20, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[28]}], msg_controllen=20, msg_flags=0}, 0) = 4
[pid  4688] recvmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\24\0\0\0", iov_len=4}], msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, cmsg_data=[3]}], msg_controllen=24, msg_flags=MSG_CMSG_CLOEXEC}, MSG_CMSG_CLOEXEC) = 4
0024:trace:module:set_security_cookie initializing security cookie 00000001400FA3C0
0024:trace:module:build_module loaded L"\\??\\Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" 00007FFFFE2220A0 0000000140000000
0024:trace:loaddll:build_module Loaded L"Z:\\workspace\\work\\artifacts\\Arly\\Arly.exe" at 0000000140000000: native
0024:trace:module:load_dll looking for L"kernel32.dll" in (null)
0024:warn:module:load_dll Failed to load module L"kernel32.dll"; status=c0000135
wine: could not load kernel32.dll, status c0000135
[pid  4688] +++ exited with 53 +++
+++ exited with 0 +++
/workspace/work/artifacts/libnetblock.so
strace: Process 4879 attached
[pid  4879] socketpair(AF_UNIX, SOCK_STREAM, 0, [3, 4]) = 0
[pid  4879] shutdown(3, SHUT_WR)        = 0
strace: Process 4880 attached
[pid  4880] socket(AF_UNIX, SOCK_STREAM, 0) = 8
[pid  4880] bind(8, {sa_family=AF_UNIX, sun_path="socket"}, 9) = 0
[pid  4880] listen(8, 5)                = 0
[pid  4879] +++ exited with 0 +++
[pid  4878] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4879, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
[pid  4878] socket(AF_UNIX, SOCK_STREAM, 0) = 4
[pid  4878] setsockopt(4, SOL_SOCKET, SO_PASSCRED, [1], 4) = 0
[NET-BLOCK] connect blocked
wine: a wine server seems to be running, but I cannot connect to it.
   You probably need to kill that process (it might be pid 4880).
[pid  4878] +++ exited with 1 +++
