Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Kcbvj54f"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438TFR4Lt3zDqX0
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 04:22:18 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g9so8633889plo.3
 for <openbmc@lists.ozlabs.org>; Tue, 04 Dec 2018 09:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CirGYL4IWhYgI0CcFPz6Oq/eptI2SiTTuVG6jFRbWMU=;
 b=Kcbvj54ffMknHq96cvNKGjLVOGdULBxXNvRv1ovyJZEjNkwhvexXDZZ1dCjYMMqGuI
 AEN/4+PkADT3TJAvKNKjff3rmoZEVBMGWGZrcS94x3U1AAT6MtGFifuEw3RAfZpGW33e
 /Fg8bCHLbfz6VIPojGwFOhBldnN6EO+3OHvQ1Ug8VDsHtidjaI3u8gsdlmWWfuwb+NRZ
 oYg+24L1VAraXx1w8K49GvQ98PLYk2plUeW75ZsVWjTjZ9V0FOE5ER0SS3mcrHgNBgAJ
 0YO4Y69WdjfWMqnV80tka2Zbfn/CHzKOjHhyYrg8Po6PZi41/xOECMJtD6T+0sVb3gt0
 Uf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CirGYL4IWhYgI0CcFPz6Oq/eptI2SiTTuVG6jFRbWMU=;
 b=DRMAQQkxKdNEPEJYfWy2wScqFiBWYLm0Ubzw9FIHqws51bQUVBq0YafHVP7y0kqrGY
 O1G7ny+0j+5i2v2Hvm2iBEIu/n3G1hTga4GDb7V0t2wuYJUQ0M+jG/kGyo+1e2ZtG2y4
 h7MuUS+AF+b43oD67p06Ki35JuBVsbzg4EWW7V3ozgB9sUDPXqdyG3WzCs/vcoBgYL7Y
 ti540a23EGA9hagPB9SLkkMP3bW7dVinJHAb4spelppDHqF5ZuD7mJDFS8joZ68goJ5L
 2bYG1/cezjvJAZVH/MNH0m72BP6qvzGJtBN+P0sDFGqz+2o8FqVCyCdqGvFvbfxJ2tan
 itFw==
X-Gm-Message-State: AA+aEWYz1doH7pALyay9nnmA/3PmBXFJapn1rwtM8AM696zh9CzfrsqQ
 DdwSZ+drzpSN90MFULkKJLP19rdgiO3IdKC2w09N61HuZxTHyw==
X-Google-Smtp-Source: AFSGD/UOjvSjdX7qAk18LbJObAneJaQ2D2o7xGmEmJWZNg6498jEbjWRd3tA5E38ZLGdOCGTjBIze3ESkYWP7sQfv7Y=
X-Received: by 2002:a17:902:968d:: with SMTP id
 n13mr21266753plp.109.1543944135380; 
 Tue, 04 Dec 2018 09:22:15 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 4 Dec 2018 09:22:02 -0800
Message-ID: <CAO=notzzBw=0pPwu4fDCWba7kyWLD3SqLqzYiK8dcB_B4E6SXw@mail.gmail.com>
Subject: CI Builds that include phosphor-host-ipmid now flaky
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 tomjoseph@in.ibm.com, Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2018 17:22:21 -0000

Running the openbmc upstream CI locally now is flaky.  The
phosphor-host-ipmid repository sometimes builds and sometimes doesn't.
Building from HEAD, with no changes to the CI source, it will work one
build, and fail another.  I'm trying to build it to run tests while
developing phosphor-ipmi-flash and it's pretty unhappy.

Does anyone have any thoughts on the luserlayer change?  Below is the log:

+ UNIT_TEST=/usr/local/google/git/workspaces/ci_test_area/unit-test.py,-w,/usr/local/google/git/workspaces/ci_test_area,-p,phosphor-ipmi-flash,-v
+ echo 'Executing docker image'
Executing docker image
+ docker run --cap-add=sys_admin --rm=true --network host
--privileged=true -w /usr/local/google/git/workspaces/ci_test_area -v
/usr/local/google/git/workspaces/ci_test_area:/usr/local/google/git/workspaces/ci_test_area
-e MAKEFLAGS= -t openbmc/ubuntu-unit-test
/usr/local/google/git/workspaces/ci_test_area/dbus-unit-test.py -u
/usr/local/google/git/workspaces/ci_test_area/unit-test.py,-w,/usr/local/google/git/workspaces/ci_test_area,-p,phosphor-ipmi-flash,-v
-f /usr/share/dbus-1/system.conf
/usr/local/google/git/workspaces/ci_test_area > ./format-code.sh
/usr/local/google/git/workspaces/ci_test_area/phosphor-ipmi-flash
Formatting code under
/usr/local/google/git/workspaces/ci_test_area/phosphor-ipmi-flash/
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid >
git clone https://gerrit.openbmc-project.xyz/openbmc/phosphor-host-ipmid
./
phosphor-ipmi-flash
    phosphor-ipmi-blobs
        phosphor-host-ipmid
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid >
./bootstrap.sh
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
libtoolize: and rerunning libtoolize and aclocal.
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
configure.ac:12: installing './ar-lib'
configure.ac:11: installing './compile'
configure.ac:50: installing './config.guess'
configure.ac:50: installing './config.sub'
configure.ac:5: installing './install-sh'
configure.ac:5: installing './missing'
Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'
Run "./configure ${CONFIGURE_FLAGS} && make"
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid >
./configure --disable-silent-rules --enable-tests
--enable-code-coverage --enable-valgrind
configure: WARNING: unrecognized options: --enable-tests, --enable-valgrind
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether make supports nested variables... (cached) yes
checking for g++... g++
checking whether the C++ compiler works... yes
checking for C++ compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking for style of include used by make... GNU
checking dependency style of g++... gcc3
checking for gcc... gcc
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking whether gcc understands -c and -o together... yes
checking dependency style of gcc... gcc3
checking for ar... ar
checking the archiver (ar) interface... ar
checking whether make sets $(MAKE)... (cached) yes
checking for dirname... dirname
checking for mapper_get_service in -lmapper... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for SYSTEMD... yes
checking for CRYPTO... yes
checking for PHOSPHOR_LOGGING... yes
checking for PHOSPHOR_DBUS_INTERFACES... yes
checking for SDBUSPLUS... yes
./configure: line 5338: SDEVENTPLUS_CFLAGS: command not found
./configure: line 5339: C: command not found
./configure: line 5340: SDEVENTPLUS_LIBS: command not found
./configure: line 5341: linker: command not found
checking for SDEVENTPLUS... yes
checking for sdbus++... /usr/local/bin/sdbus++
checking whether g++ supports C++17 features by default... no
checking whether g++ supports C++17 features with -std=c++17... yes
configure: WARNING: C++17 is not yet standardized, so the checks may
change in incompatible ways anytime
checking whether C++ compiler accepts -Wall... yes
checking whether C++ compiler accepts -Werror... yes
checking whether C++ compiler accepts -Wall... (cached) yes
checking whether C++ compiler accepts -Werror... (cached) yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to
x86_64-pc-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain
format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for sysroot... no
checking for a working dd... /bin/dd
checking how to truncate binary pipes... /bin/dd bs=4096 count=1
checking for mt... no
checking if : is a manifest tool... no
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... no
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld -m elf_x86_64) supports
shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... yes
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... g++ -std=c++17 -E
checking for ld used by g++ -std=c++17... /usr/bin/ld -m elf_x86_64
checking if the linker (/usr/bin/ld -m elf_x86_64) is GNU ld... yes
checking whether the g++ -std=c++17 linker (/usr/bin/ld -m elf_x86_64)
supports shared libraries... yes
checking for g++ -std=c++17 option to produce PIC... -fPIC -DPIC
checking if g++ -std=c++17 PIC flag -fPIC -DPIC works... yes
checking if g++ -std=c++17 static flag -static works... no
checking if g++ -std=c++17 supports -c -o file.o... yes
checking if g++ -std=c++17 supports -c -o file.o... (cached) yes
checking whether the g++ -std=c++17 linker (/usr/bin/ld -m elf_x86_64)
supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for library containing dlopen... -ldl
checking for dlerror... yes
checking for shl_load... (cached) no
checking for shl_load in -ldld... (cached) no
checking for dld_link in -ldld... no
checking for GTEST... yes
checking for GTEST_MAIN... yes
checking whether to build with code coverage support... yes
checking for gcov... gcov
checking for lcov... lcov
checking for genhtml... genhtml
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating test/Makefile
config.status: creating softoff/Makefile
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --enable-tests, --enable-valgrind
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid >
make -j 12 -l 12 -O
/bin/bash generate_whitelist.sh host-ipmid-whitelist.conf > ipmiwhitelist.cpp
./scripts/channel_gen.py -i channel-example.yaml -o . generate-cpp
./scripts/fru_gen.py -i fru-read-example.yaml -o . generate-cpp
./scripts/inventory-sensor.py -i inventory-sensor-example.yaml -o . generate-cpp
./scripts/sensor_gen.py -i sensor-example.yaml -o . generate-cpp
make  all-recursive
Making all in .
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-net.lo -MD -MP -MF .deps/libipmi20_la-net.Tpo -c -o
libipmi20_la-net.lo `test -f 'net.cpp' || echo './'`net.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-net.lo -MD -MP -MF
.deps/libipmi20_la-net.Tpo -c net.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-net.o
mv -f .deps/libipmi20_la-net.Tpo .deps/libipmi20_la-net.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-transporthandler.lo -MD -MP -MF
.deps/libipmi20_la-transporthandler.Tpo -c -o
libipmi20_la-transporthandler.lo `test -f 'transporthandler.cpp' ||
echo './'`transporthandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-transporthandler.lo -MD -MP -MF
.deps/libipmi20_la-transporthandler.Tpo -c transporthandler.cpp  -fPIC
-DPIC -o .libs/libipmi20_la-transporthandler.o
mv -f .deps/libipmi20_la-transporthandler.Tpo
.deps/libipmi20_la-transporthandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-globalhandler.lo -MD -MP -MF
.deps/libipmi20_la-globalhandler.Tpo -c -o
libipmi20_la-globalhandler.lo `test -f 'globalhandler.cpp' || echo
'./'`globalhandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-globalhandler.lo -MD -MP -MF
.deps/libipmi20_la-globalhandler.Tpo -c globalhandler.cpp  -fPIC -DPIC
-o .libs/libipmi20_la-globalhandler.o
mv -f .deps/libipmi20_la-globalhandler.Tpo .deps/libipmi20_la-globalhandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-groupext.lo -MD -MP -MF .deps/libipmi20_la-groupext.Tpo
-c -o libipmi20_la-groupext.lo `test -f 'groupext.cpp' || echo
'./'`groupext.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-groupext.lo -MD -MP -MF
.deps/libipmi20_la-groupext.Tpo -c groupext.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-groupext.o
mv -f .deps/libipmi20_la-groupext.Tpo .deps/libipmi20_la-groupext.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-utils.lo -MD -MP -MF .deps/libipmi20_la-utils.Tpo -c -o
libipmi20_la-utils.lo `test -f 'utils.cpp' || echo './'`utils.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-utils.lo -MD -MP -MF
.deps/libipmi20_la-utils.Tpo -c utils.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-utils.o
mv -f .deps/libipmi20_la-utils.Tpo .deps/libipmi20_la-utils.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-selutility.lo -MD -MP -MF
.deps/libipmi20_la-selutility.Tpo -c -o libipmi20_la-selutility.lo
`test -f 'selutility.cpp' || echo './'`selutility.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-selutility.lo -MD -MP -MF
.deps/libipmi20_la-selutility.Tpo -c selutility.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-selutility.o
mv -f .deps/libipmi20_la-selutility.Tpo .deps/libipmi20_la-selutility.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-ipmi_fru_info_area.lo -MD -MP -MF
.deps/libipmi20_la-ipmi_fru_info_area.Tpo -c -o
libipmi20_la-ipmi_fru_info_area.lo `test -f 'ipmi_fru_info_area.cpp'
|| echo './'`ipmi_fru_info_area.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-ipmi_fru_info_area.lo -MD -MP -MF
.deps/libipmi20_la-ipmi_fru_info_area.Tpo -c ipmi_fru_info_area.cpp
-fPIC -DPIC -o .libs/libipmi20_la-ipmi_fru_info_area.o
mv -f .deps/libipmi20_la-ipmi_fru_info_area.Tpo
.deps/libipmi20_la-ipmi_fru_info_area.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-read_fru_data.lo -MD -MP -MF
.deps/libipmi20_la-read_fru_data.Tpo -c -o
libipmi20_la-read_fru_data.lo `test -f 'read_fru_data.cpp' || echo
'./'`read_fru_data.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-read_fru_data.lo -MD -MP -MF
.deps/libipmi20_la-read_fru_data.Tpo -c read_fru_data.cpp  -fPIC -DPIC
-o .libs/libipmi20_la-read_fru_data.o
mv -f .deps/libipmi20_la-read_fru_data.Tpo .deps/libipmi20_la-read_fru_data.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-sensordatahandler.lo -MD -MP -MF
.deps/libipmi20_la-sensordatahandler.Tpo -c -o
libipmi20_la-sensordatahandler.lo `test -f 'sensordatahandler.cpp' ||
echo './'`sensordatahandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-sensordatahandler.lo -MD -MP -MF
.deps/libipmi20_la-sensordatahandler.Tpo -c sensordatahandler.cpp
-fPIC -DPIC -o .libs/libipmi20_la-sensordatahandler.o
mv -f .deps/libipmi20_la-sensordatahandler.Tpo
.deps/libipmi20_la-sensordatahandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-sensor-gen.lo -MD -MP -MF
.deps/libipmi20_la-sensor-gen.Tpo -c -o libipmi20_la-sensor-gen.lo
`test -f 'sensor-gen.cpp' || echo './'`sensor-gen.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-sensor-gen.lo -MD -MP -MF
.deps/libipmi20_la-sensor-gen.Tpo -c sensor-gen.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-sensor-gen.o
mv -f .deps/libipmi20_la-sensor-gen.Tpo .deps/libipmi20_la-sensor-gen.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-inventory-sensor-gen.lo -MD -MP -MF
.deps/libipmi20_la-inventory-sensor-gen.Tpo -c -o
libipmi20_la-inventory-sensor-gen.lo `test -f
'inventory-sensor-gen.cpp' || echo './'`inventory-sensor-gen.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-inventory-sensor-gen.lo -MD -MP -MF
.deps/libipmi20_la-inventory-sensor-gen.Tpo -c
inventory-sensor-gen.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-inventory-sensor-gen.o
mv -f .deps/libipmi20_la-inventory-sensor-gen.Tpo
.deps/libipmi20_la-inventory-sensor-gen.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-fru-read-gen.lo -MD -MP -MF
.deps/libipmi20_la-fru-read-gen.Tpo -c -o libipmi20_la-fru-read-gen.lo
`test -f 'fru-read-gen.cpp' || echo './'`fru-read-gen.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-fru-read-gen.lo -MD -MP -MF
.deps/libipmi20_la-fru-read-gen.Tpo -c fru-read-gen.cpp  -fPIC -DPIC
-o .libs/libipmi20_la-fru-read-gen.o
mv -f .deps/libipmi20_la-fru-read-gen.Tpo .deps/libipmi20_la-fru-read-gen.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-channel-gen.lo -MD -MP -MF
.deps/libipmi20_la-channel-gen.Tpo -c -o libipmi20_la-channel-gen.lo
`test -f 'channel-gen.cpp' || echo './'`channel-gen.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-channel-gen.lo -MD -MP -MF
.deps/libipmi20_la-channel-gen.Tpo -c channel-gen.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-channel-gen.o
mv -f .deps/libipmi20_la-channel-gen.Tpo .deps/libipmi20_la-channel-gen.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -I/usr/local/include -I/usr/local/include -g
-O2 -Wall -Werror -MT user_channel/libuserlayer_la-user_layer.lo -MD
-MP -MF user_channel/.deps/libuserlayer_la-user_layer.Tpo -c -o
user_channel/libuserlayer_la-user_layer.lo `test -f
'user_channel/user_layer.cpp' || echo './'`user_channel/user_layer.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror -MT
user_channel/libuserlayer_la-user_layer.lo -MD -MP -MF
user_channel/.deps/libuserlayer_la-user_layer.Tpo -c
user_channel/user_layer.cpp  -fPIC -DPIC -o
user_channel/.libs/libuserlayer_la-user_layer.o
mv -f user_channel/.deps/libuserlayer_la-user_layer.Tpo
user_channel/.deps/libuserlayer_la-user_layer.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -I/usr/local/include -I/usr/local/include -g
-O2 -Wall -Werror -MT user_channel/libuserlayer_la-user_mgmt.lo -MD
-MP -MF user_channel/.deps/libuserlayer_la-user_mgmt.Tpo -c -o
user_channel/libuserlayer_la-user_mgmt.lo `test -f
'user_channel/user_mgmt.cpp' || echo './'`user_channel/user_mgmt.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror -MT
user_channel/libuserlayer_la-user_mgmt.lo -MD -MP -MF
user_channel/.deps/libuserlayer_la-user_mgmt.Tpo -c
user_channel/user_mgmt.cpp  -fPIC -DPIC -o
user_channel/.libs/libuserlayer_la-user_mgmt.o
mv -f user_channel/.deps/libuserlayer_la-user_mgmt.Tpo
user_channel/.deps/libuserlayer_la-user_mgmt.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -I/usr/local/include -I/usr/local/include -g
-O2 -Wall -Werror -MT user_channel/libuserlayer_la-passwd_mgr.lo -MD
-MP -MF user_channel/.deps/libuserlayer_la-passwd_mgr.Tpo -c -o
user_channel/libuserlayer_la-passwd_mgr.lo `test -f
'user_channel/passwd_mgr.cpp' || echo './'`user_channel/passwd_mgr.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror -MT
user_channel/libuserlayer_la-passwd_mgr.lo -MD -MP -MF
user_channel/.deps/libuserlayer_la-passwd_mgr.Tpo -c
user_channel/passwd_mgr.cpp  -fPIC -DPIC -o
user_channel/.libs/libuserlayer_la-passwd_mgr.o
mv -f user_channel/.deps/libuserlayer_la-passwd_mgr.Tpo
user_channel/.deps/libuserlayer_la-passwd_mgr.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -I/usr/local/include -I/usr/local/include -g
-O2 -Wall -Werror -MT user_channel/libuserlayer_la-channel_mgmt.lo -MD
-MP -MF user_channel/.deps/libuserlayer_la-channel_mgmt.Tpo -c -o
user_channel/libuserlayer_la-channel_mgmt.lo `test -f
'user_channel/channel_mgmt.cpp' || echo
'./'`user_channel/channel_mgmt.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror -MT
user_channel/libuserlayer_la-channel_mgmt.lo -MD -MP -MF
user_channel/.deps/libuserlayer_la-channel_mgmt.Tpo -c
user_channel/channel_mgmt.cpp  -fPIC -DPIC -o
user_channel/.libs/libuserlayer_la-channel_mgmt.o
mv -f user_channel/.deps/libuserlayer_la-channel_mgmt.Tpo
user_channel/.deps/libuserlayer_la-channel_mgmt.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -I/usr/local/include -I/usr/local/include -g
-O2 -Wall -Werror -MT user_channel/libuserlayer_la-channel_layer.lo
-MD -MP -MF user_channel/.deps/libuserlayer_la-channel_layer.Tpo -c -o
user_channel/libuserlayer_la-channel_layer.lo `test -f
'user_channel/channel_layer.cpp' || echo
'./'`user_channel/channel_layer.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror -MT
user_channel/libuserlayer_la-channel_layer.lo -MD -MP -MF
user_channel/.deps/libuserlayer_la-channel_layer.Tpo -c
user_channel/channel_layer.cpp  -fPIC -DPIC -o
user_channel/.libs/libuserlayer_la-channel_layer.o
mv -f user_channel/.deps/libuserlayer_la-channel_layer.Tpo
user_channel/.deps/libuserlayer_la-channel_layer.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.     -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB  -I/usr/local/include
-I/usr/local/include -I/usr/local/include -flto -g -O2 -Wall -Werror
-MT libsysintfcmds_la-systemintfcmds.lo -MD -MP -MF
.deps/libsysintfcmds_la-systemintfcmds.Tpo -c -o
libsysintfcmds_la-systemintfcmds.lo `test -f 'systemintfcmds.cpp' ||
echo './'`systemintfcmds.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libsysintfcmds_la-systemintfcmds.lo -MD -MP -MF
.deps/libsysintfcmds_la-systemintfcmds.Tpo -c systemintfcmds.cpp
-fPIC -DPIC -o .libs/libsysintfcmds_la-systemintfcmds.o
mv -f .deps/libsysintfcmds_la-systemintfcmds.Tpo
.deps/libsysintfcmds_la-systemintfcmds.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.     -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB  -I/usr/local/include
-I/usr/local/include -I/usr/local/include -flto -g -O2 -Wall -Werror
-MT libsysintfcmds_la-host-interface.lo -MD -MP -MF
.deps/libsysintfcmds_la-host-interface.Tpo -c -o
libsysintfcmds_la-host-interface.lo `test -f 'host-interface.cpp' ||
echo './'`host-interface.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libsysintfcmds_la-host-interface.lo -MD -MP -MF
.deps/libsysintfcmds_la-host-interface.Tpo -c host-interface.cpp
-fPIC -DPIC -o .libs/libsysintfcmds_la-host-interface.o
mv -f .deps/libsysintfcmds_la-host-interface.Tpo
.deps/libsysintfcmds_la-host-interface.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT ipmid-ipmid.o -MD
-MP -MF .deps/ipmid-ipmid.Tpo -c -o ipmid-ipmid.o `test -f 'ipmid.cpp'
|| echo './'`ipmid.cpp
mv -f .deps/ipmid-ipmid.Tpo .deps/ipmid-ipmid.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT ipmid-settings.o
-MD -MP -MF .deps/ipmid-settings.Tpo -c -o ipmid-settings.o `test -f
'settings.cpp' || echo './'`settings.cpp
mv -f .deps/ipmid-settings.Tpo .deps/ipmid-settings.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
ipmid-host-cmd-manager.o -MD -MP -MF .deps/ipmid-host-cmd-manager.Tpo
-c -o ipmid-host-cmd-manager.o `test -f 'host-cmd-manager.cpp' || echo
'./'`host-cmd-manager.cpp
mv -f .deps/ipmid-host-cmd-manager.Tpo .deps/ipmid-host-cmd-manager.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT ipmid-utils.o -MD
-MP -MF .deps/ipmid-utils.Tpo -c -o ipmid-utils.o `test -f 'utils.cpp'
|| echo './'`utils.cpp
mv -f .deps/ipmid-utils.Tpo .deps/ipmid-utils.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT ipmid-oemrouter.o
-MD -MP -MF .deps/ipmid-oemrouter.Tpo -c -o ipmid-oemrouter.o `test -f
'oemrouter.cpp' || echo './'`oemrouter.cpp
mv -f .deps/ipmid-oemrouter.Tpo .deps/ipmid-oemrouter.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
g++ -std=c++17 -DHAVE_CONFIG_H -I.    -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
ipmid-ipmiwhitelist.o -MD -MP -MF .deps/ipmid-ipmiwhitelist.Tpo -c -o
ipmid-ipmiwhitelist.o `test -f 'ipmiwhitelist.cpp' || echo
'./'`ipmiwhitelist.cpp
mv -f .deps/ipmid-ipmiwhitelist.Tpo .deps/ipmid-ipmiwhitelist.Po
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
user_channel/libipmi20_la-usercommands.lo -MD -MP -MF
user_channel/.deps/libipmi20_la-usercommands.Tpo -c -o
user_channel/libipmi20_la-usercommands.lo `test -f
'user_channel/usercommands.cpp' || echo
'./'`user_channel/usercommands.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT user_channel/libipmi20_la-usercommands.lo -MD
-MP -MF user_channel/.deps/libipmi20_la-usercommands.Tpo -c
user_channel/usercommands.cpp  -fPIC -DPIC -o
user_channel/.libs/libipmi20_la-usercommands.o
mv -f user_channel/.deps/libipmi20_la-usercommands.Tpo
user_channel/.deps/libipmi20_la-usercommands.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
user_channel/libipmi20_la-channelcommands.lo -MD -MP -MF
user_channel/.deps/libipmi20_la-channelcommands.Tpo -c -o
user_channel/libipmi20_la-channelcommands.lo `test -f
'user_channel/channelcommands.cpp' || echo
'./'`user_channel/channelcommands.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT user_channel/libipmi20_la-channelcommands.lo -MD
-MP -MF user_channel/.deps/libipmi20_la-channelcommands.Tpo -c
user_channel/channelcommands.cpp  -fPIC -DPIC -o
user_channel/.libs/libipmi20_la-channelcommands.o
mv -f user_channel/.deps/libipmi20_la-channelcommands.Tpo
user_channel/.deps/libipmi20_la-channelcommands.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=link g++ -std=c++17
-I/usr/local/include -I/usr/local/include -g -O2 -Wall -Werror
-lsystemd  -L/usr/local/lib -lphosphor_logging -lsdbusplus -lsystemd
-L/usr/local/lib -lphosphor_dbus -lstdc++fs   -lpam_misc -lssl
-version-info 0:0:0 -shared  -o libuserlayer.la -rpath /usr/local/lib
user_channel/libuserlayer_la-user_layer.lo
user_channel/libuserlayer_la-user_mgmt.lo
user_channel/libuserlayer_la-passwd_mgr.lo
user_channel/libuserlayer_la-channel_mgmt.lo
user_channel/libuserlayer_la-channel_layer.lo  -lmapper
libtool: link: g++ -std=c++17  -fPIC -DPIC -shared -nostdlib
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crti.o
/usr/lib/gcc/x86_64-linux-gnu/7/crtbeginS.o
user_channel/.libs/libuserlayer_la-user_layer.o
user_channel/.libs/libuserlayer_la-user_mgmt.o
user_channel/.libs/libuserlayer_la-passwd_mgr.o
user_channel/.libs/libuserlayer_la-channel_mgmt.o
user_channel/.libs/libuserlayer_la-channel_layer.o   -L/usr/local/lib
/usr/local/lib/libphosphor_logging.so /usr/local/lib/libsdbusplus.so
-lsystemd /usr/local/lib/libphosphor_dbus.so -lstdc++fs -lpam_misc
-lssl /usr/local/lib/libmapper.so -L/usr/lib/gcc/x86_64-linux-gnu/7
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib
-L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu
-L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/7/../../.. -lstdc++
-lm -lc -lgcc_s /usr/lib/gcc/x86_64-linux-gnu/7/crtendS.o
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crtn.o  -g
-O2   -Wl,-soname -Wl,libuserlayer.so.0 -o .libs/libuserlayer.so.0.0.0
libtool: link: (cd ".libs" && rm -f "libuserlayer.so.0" && ln -s
"libuserlayer.so.0.0.0" "libuserlayer.so.0")
libtool: link: (cd ".libs" && rm -f "libuserlayer.so" && ln -s
"libuserlayer.so.0.0.0" "libuserlayer.so")
libtool: link: ( cd ".libs" && rm -f "libuserlayer.la" && ln -s
"../libuserlayer.la" "libuserlayer.la" )
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=link g++ -std=c++17
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB  -I/usr/local/include -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -lsystemd
-L/usr/local/lib -lphosphor_dbus -L/usr/local/lib -lphosphor_logging
-lsdbusplus -lsystemd -L/usr/local/lib -lsdbusplus -lsystemd
-version-info 0:0:0 -shared  -o libsysintfcmds.la -rpath
/usr/local/lib/ipmid-providers libsysintfcmds_la-systemintfcmds.lo
libsysintfcmds_la-host-interface.lo  -lmapper
libtool: link: g++ -std=c++17  -fPIC -DPIC -shared -nostdlib
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crti.o
/usr/lib/gcc/x86_64-linux-gnu/7/crtbeginS.o
.libs/libsysintfcmds_la-systemintfcmds.o
.libs/libsysintfcmds_la-host-interface.o   -L/usr/local/lib
/usr/local/lib/libphosphor_dbus.so
/usr/local/lib/libphosphor_logging.so /usr/local/lib/libsdbusplus.so
-lsystemd /usr/local/lib/libmapper.so
-L/usr/lib/gcc/x86_64-linux-gnu/7
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib
-L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu
-L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/7/../../.. -lstdc++
-lm -lc -lgcc_s /usr/lib/gcc/x86_64-linux-gnu/7/crtendS.o
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crtn.o
-flto -g -O2   -Wl,-soname -Wl,libsysintfcmds.so.0 -o
.libs/libsysintfcmds.so.0.0.0
libtool: link: (cd ".libs" && rm -f "libsysintfcmds.so.0" && ln -s
"libsysintfcmds.so.0.0.0" "libsysintfcmds.so.0")
libtool: link: (cd ".libs" && rm -f "libsysintfcmds.so" && ln -s
"libsysintfcmds.so.0.0.0" "libsysintfcmds.so")
libtool: link: ( cd ".libs" && rm -f "libsysintfcmds.la" && ln -s
"../libsysintfcmds.la" "libsysintfcmds.la" )
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=link g++ -std=c++17
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -lsystemd  -ldl -L/usr/local/lib -lphosphor_logging
-lsdbusplus -lsystemd -L/usr/local/lib -lphosphor_dbus -lcrypto
-lstdc++fs -pthread -export-dynamic  -o ipmid ipmid-ipmid.o
ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
ipmid-oemrouter.o ipmid-ipmiwhitelist.o  -lmapper
libtool: link: g++ -std=c++17 -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -pthread -o ipmid
ipmid-ipmid.o ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
ipmid-oemrouter.o ipmid-ipmiwhitelist.o -Wl,--export-dynamic  -ldl
-L/usr/local/lib /usr/local/lib/libphosphor_logging.so
/usr/local/lib/libsdbusplus.so -lsystemd
/usr/local/lib/libphosphor_dbus.so -lcrypto -lstdc++fs
/usr/local/lib/libmapper.so -pthread
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-storageaddsel.lo -MD -MP -MF
.deps/libipmi20_la-storageaddsel.Tpo -c -o
libipmi20_la-storageaddsel.lo `test -f 'storageaddsel.cpp' || echo
'./'`storageaddsel.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-storageaddsel.lo -MD -MP -MF
.deps/libipmi20_la-storageaddsel.Tpo -c storageaddsel.cpp  -fPIC -DPIC
-o .libs/libipmi20_la-storageaddsel.o
mv -f .deps/libipmi20_la-storageaddsel.Tpo .deps/libipmi20_la-storageaddsel.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-ipmisensor.lo -MD -MP -MF
.deps/libipmi20_la-ipmisensor.Tpo -c -o libipmi20_la-ipmisensor.lo
`test -f 'ipmisensor.cpp' || echo './'`ipmisensor.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-ipmisensor.lo -MD -MP -MF
.deps/libipmi20_la-ipmisensor.Tpo -c ipmisensor.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-ipmisensor.o
mv -f .deps/libipmi20_la-ipmisensor.Tpo .deps/libipmi20_la-ipmisensor.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-dcmihandler.lo -MD -MP -MF
.deps/libipmi20_la-dcmihandler.Tpo -c -o libipmi20_la-dcmihandler.lo
`test -f 'dcmihandler.cpp' || echo './'`dcmihandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-dcmihandler.lo -MD -MP -MF
.deps/libipmi20_la-dcmihandler.Tpo -c dcmihandler.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-dcmihandler.o
mv -f .deps/libipmi20_la-dcmihandler.Tpo .deps/libipmi20_la-dcmihandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-chassishandler.lo -MD -MP -MF
.deps/libipmi20_la-chassishandler.Tpo -c -o
libipmi20_la-chassishandler.lo `test -f 'chassishandler.cpp' || echo
'./'`chassishandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-chassishandler.lo -MD -MP -MF
.deps/libipmi20_la-chassishandler.Tpo -c chassishandler.cpp  -fPIC
-DPIC -o .libs/libipmi20_la-chassishandler.o
mv -f .deps/libipmi20_la-chassishandler.Tpo
.deps/libipmi20_la-chassishandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-storagehandler.lo -MD -MP -MF
.deps/libipmi20_la-storagehandler.Tpo -c -o
libipmi20_la-storagehandler.lo `test -f 'storagehandler.cpp' || echo
'./'`storagehandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-storagehandler.lo -MD -MP -MF
.deps/libipmi20_la-storagehandler.Tpo -c storagehandler.cpp  -fPIC
-DPIC -o .libs/libipmi20_la-storagehandler.o
mv -f .deps/libipmi20_la-storagehandler.Tpo
.deps/libipmi20_la-storagehandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-sensorhandler.lo -MD -MP -MF
.deps/libipmi20_la-sensorhandler.Tpo -c -o
libipmi20_la-sensorhandler.lo `test -f 'sensorhandler.cpp' || echo
'./'`sensorhandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-sensorhandler.lo -MD -MP -MF
.deps/libipmi20_la-sensorhandler.Tpo -c sensorhandler.cpp  -fPIC -DPIC
-o .libs/libipmi20_la-sensorhandler.o
mv -f .deps/libipmi20_la-sensorhandler.Tpo .deps/libipmi20_la-sensorhandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-sys_info_param.lo -MD -MP -MF
.deps/libipmi20_la-sys_info_param.Tpo -c -o
libipmi20_la-sys_info_param.lo `test -f 'sys_info_param.cpp' || echo
'./'`sys_info_param.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-sys_info_param.lo -MD -MP -MF
.deps/libipmi20_la-sys_info_param.Tpo -c sys_info_param.cpp  -fPIC
-DPIC -o .libs/libipmi20_la-sys_info_param.o
mv -f .deps/libipmi20_la-sys_info_param.Tpo
.deps/libipmi20_la-sys_info_param.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
libipmi20_la-apphandler.lo -MD -MP -MF
.deps/libipmi20_la-apphandler.Tpo -c -o libipmi20_la-apphandler.lo
`test -f 'apphandler.cpp' || echo './'`apphandler.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT libipmi20_la-apphandler.lo -MD -MP -MF
.deps/libipmi20_la-apphandler.Tpo -c apphandler.cpp  -fPIC -DPIC -o
.libs/libipmi20_la-apphandler.o
mv -f .deps/libipmi20_la-apphandler.Tpo .deps/libipmi20_la-apphandler.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
app/libipmi20_la-channel.lo -MD -MP -MF
app/.deps/libipmi20_la-channel.Tpo -c -o app/libipmi20_la-channel.lo
`test -f 'app/channel.cpp' || echo './'`app/channel.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT app/libipmi20_la-channel.lo -MD -MP -MF
app/.deps/libipmi20_la-channel.Tpo -c app/channel.cpp  -fPIC -DPIC -o
app/.libs/libipmi20_la-channel.o
mv -f app/.deps/libipmi20_la-channel.Tpo app/.deps/libipmi20_la-channel.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
app/libipmi20_la-watchdog_service.lo -MD -MP -MF
app/.deps/libipmi20_la-watchdog_service.Tpo -c -o
app/libipmi20_la-watchdog_service.lo `test -f
'app/watchdog_service.cpp' || echo './'`app/watchdog_service.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT app/libipmi20_la-watchdog_service.lo -MD -MP -MF
app/.deps/libipmi20_la-watchdog_service.Tpo -c
app/watchdog_service.cpp  -fPIC -DPIC -o
app/.libs/libipmi20_la-watchdog_service.o
mv -f app/.deps/libipmi20_la-watchdog_service.Tpo
app/.deps/libipmi20_la-watchdog_service.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=compile g++ -std=c++17
-DHAVE_CONFIG_H -I.      -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -MT
app/libipmi20_la-watchdog.lo -MD -MP -MF
app/.deps/libipmi20_la-watchdog.Tpo -c -o app/libipmi20_la-watchdog.lo
`test -f 'app/watchdog.cpp' || echo './'`app/watchdog.cpp
libtool: compile:  g++ -std=c++17 -DHAVE_CONFIG_H -I.
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -MT app/libipmi20_la-watchdog.lo -MD -MP -MF
app/.deps/libipmi20_la-watchdog.Tpo -c app/watchdog.cpp  -fPIC -DPIC
-o app/.libs/libipmi20_la-watchdog.o
mv -f app/.deps/libipmi20_la-watchdog.Tpo app/.deps/libipmi20_la-watchdog.Plo
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
/bin/bash ./libtool  --tag=CXX   --mode=link g++ -std=c++17
-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
-DBOOST_ALL_NO_LIB -I/usr/local/include -I/usr/local/include -flto -g
-O2 -Wall -Werror -lsystemd  -L/usr/local/lib -lphosphor_logging
-lsdbusplus -lsystemd -L/usr/local/lib -lphosphor_dbus -lstdc++fs
-luserlayer -version-info 0:0:0 -shared  -o libipmi20.la -rpath
/usr/local/lib/ipmid-providers libipmi20_la-net.lo
app/libipmi20_la-channel.lo app/libipmi20_la-watchdog.lo
app/libipmi20_la-watchdog_service.lo libipmi20_la-apphandler.lo
libipmi20_la-sys_info_param.lo libipmi20_la-sensorhandler.lo
libipmi20_la-storagehandler.lo libipmi20_la-chassishandler.lo
libipmi20_la-dcmihandler.lo libipmi20_la-ipmisensor.lo
libipmi20_la-storageaddsel.lo libipmi20_la-transporthandler.lo
libipmi20_la-globalhandler.lo libipmi20_la-groupext.lo
libipmi20_la-utils.lo libipmi20_la-selutility.lo
libipmi20_la-ipmi_fru_info_area.lo libipmi20_la-read_fru_data.lo
libipmi20_la-sensordatahandler.lo
user_channel/libipmi20_la-usercommands.lo
user_channel/libipmi20_la-channelcommands.lo
libipmi20_la-sensor-gen.lo libipmi20_la-inventory-sensor-gen.lo
libipmi20_la-fru-read-gen.lo libipmi20_la-channel-gen.lo  -lmapper
libtool: link: g++ -std=c++17  -fPIC -DPIC -shared -nostdlib
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crti.o
/usr/lib/gcc/x86_64-linux-gnu/7/crtbeginS.o  .libs/libipmi20_la-net.o
app/.libs/libipmi20_la-channel.o app/.libs/libipmi20_la-watchdog.o
app/.libs/libipmi20_la-watchdog_service.o
.libs/libipmi20_la-apphandler.o .libs/libipmi20_la-sys_info_param.o
.libs/libipmi20_la-sensorhandler.o .libs/libipmi20_la-storagehandler.o
.libs/libipmi20_la-chassishandler.o .libs/libipmi20_la-dcmihandler.o
.libs/libipmi20_la-ipmisensor.o .libs/libipmi20_la-storageaddsel.o
.libs/libipmi20_la-transporthandler.o
.libs/libipmi20_la-globalhandler.o .libs/libipmi20_la-groupext.o
.libs/libipmi20_la-utils.o .libs/libipmi20_la-selutility.o
.libs/libipmi20_la-ipmi_fru_info_area.o
.libs/libipmi20_la-read_fru_data.o
.libs/libipmi20_la-sensordatahandler.o
user_channel/.libs/libipmi20_la-usercommands.o
user_channel/.libs/libipmi20_la-channelcommands.o
.libs/libipmi20_la-sensor-gen.o
.libs/libipmi20_la-inventory-sensor-gen.o
.libs/libipmi20_la-fru-read-gen.o .libs/libipmi20_la-channel-gen.o
-Wl,-rpath -Wl,/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/.libs
-L/usr/local/lib /usr/local/lib/libphosphor_logging.so
/usr/local/lib/libsdbusplus.so -lsystemd
/usr/local/lib/libphosphor_dbus.so -lstdc++fs
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/.libs/libuserlayer.so
/usr/local/lib/libmapper.so -L/usr/lib/gcc/x86_64-linux-gnu/7
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib
-L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu
-L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/7/../../.. -lstdc++
-lm -lc -lgcc_s /usr/lib/gcc/x86_64-linux-gnu/7/crtendS.o
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crtn.o
-flto -g -O2   -Wl,-soname -Wl,libipmi20.so.0 -o
.libs/libipmi20.so.0.0.0
libtool: link: (cd ".libs" && rm -f "libipmi20.so.0" && ln -s
"libipmi20.so.0.0.0" "libipmi20.so.0")
libtool: link: (cd ".libs" && rm -f "libipmi20.so" && ln -s
"libipmi20.so.0.0.0" "libipmi20.so")
libtool: link: ( cd ".libs" && rm -f "libipmi20.la" && ln -s
"../libipmi20.la" "libipmi20.la" )
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
Making all in test
make[2]: Nothing to be done for 'all'.
Making all in softoff
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
/usr/local/bin/sdbus++ -r .. interface server-cpp
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff >
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make[2]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
/usr/local/bin/sdbus++ -r .. interface server-header
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff >
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.hpp
make[2]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make  all-am
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
g++ -std=c++17 -DHAVE_CONFIG_H -I. -I..  -I..   -I/usr/local/include
-I/usr/local/include -I/usr/local/include -I/usr/local/include -g -O2
-Wall -Werror -MT phosphor_softpoweroff-softoff.o -MD -MP -MF
.deps/phosphor_softpoweroff-softoff.Tpo -c -o
phosphor_softpoweroff-softoff.o `test -f 'softoff.cpp' || echo
'./'`softoff.cpp
mv -f .deps/phosphor_softpoweroff-softoff.Tpo
.deps/phosphor_softpoweroff-softoff.Po
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
g++ -std=c++17 -DHAVE_CONFIG_H -I. -I..  -I..   -I/usr/local/include
-I/usr/local/include -I/usr/local/include -I/usr/local/include -g -O2
-Wall -Werror -MT ../phosphor_softpoweroff-utils.o -MD -MP -MF
../.deps/phosphor_softpoweroff-utils.Tpo -c -o
../phosphor_softpoweroff-utils.o `test -f '../utils.cpp' || echo
'./'`../utils.cpp
mv -f ../.deps/phosphor_softpoweroff-utils.Tpo
../.deps/phosphor_softpoweroff-utils.Po
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
g++ -std=c++17 -DHAVE_CONFIG_H -I. -I..  -I..   -I/usr/local/include
-I/usr/local/include -I/usr/local/include -I/usr/local/include -g -O2
-Wall -Werror -MT phosphor_softpoweroff-mainapp.o -MD -MP -MF
.deps/phosphor_softpoweroff-mainapp.Tpo -c -o
phosphor_softpoweroff-mainapp.o `test -f 'mainapp.cpp' || echo
'./'`mainapp.cpp
mv -f .deps/phosphor_softpoweroff-mainapp.Tpo
.deps/phosphor_softpoweroff-mainapp.Po
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
g++ -std=c++17 -DHAVE_CONFIG_H -I. -I..  -I..   -I/usr/local/include
-I/usr/local/include -I/usr/local/include -I/usr/local/include -g -O2
-Wall -Werror -MT
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
-MD -MP -MF xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/.deps/phosphor_softpoweroff-server.Tpo
-c -o xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
`test -f 'xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp'
|| echo './'`xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
mv -f xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/.deps/phosphor_softpoweroff-server.Tpo
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/.deps/phosphor_softpoweroff-server.Po
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
/bin/bash ../libtool  --tag=CXX   --mode=link g++ -std=c++17
-I/usr/local/include -I/usr/local/include -I/usr/local/include
-I/usr/local/include -g -O2 -Wall -Werror -lsystemd -L/usr/local/lib
-lsdbusplus -lsystemd -L/usr/local/lib -lsdeventplus -lsystemd
-L/usr/local/lib -lphosphor_logging -lsdbusplus -lsystemd
-L/usr/local/lib -lphosphor_dbus  -o phosphor-softpoweroff
phosphor_softpoweroff-softoff.o phosphor_softpoweroff-mainapp.o
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
../phosphor_softpoweroff-utils.o  -lmapper
libtool: link: g++ -std=c++17 -I/usr/local/include
-I/usr/local/include -I/usr/local/include -I/usr/local/include -g -O2
-Wall -Werror -o phosphor-softpoweroff phosphor_softpoweroff-softoff.o
phosphor_softpoweroff-mainapp.o
xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
../phosphor_softpoweroff-utils.o  -L/usr/local/lib
/usr/local/lib/libsdeventplus.so /usr/local/lib/libphosphor_logging.so
/usr/local/lib/libsdbusplus.so -lsystemd
/usr/local/lib/libphosphor_dbus.so /usr/local/lib/libmapper.so
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/softoff'
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid >
make -j 12 -l 12 -O install
make  install-recursive
Making install in .
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
 /bin/mkdir -p '/usr/local/include'
 /bin/mkdir -p '/usr/local/include/user_channel'
 /usr/bin/install -c -m 644  user_channel/user_layer.hpp
user_channel/channel_layer.hpp '/usr/local/include/user_channel'
 /bin/mkdir -p '/usr/local/include/host-ipmid'
 /usr/bin/install -c -m 644  host-ipmid/iana.hpp
host-ipmid/ipmid-api.h host-ipmid/ipmid-host-cmd.hpp
host-ipmid/ipmid-host-cmd-utils.hpp host-ipmid/oemopenbmc.hpp
host-ipmid/oemrouter.hpp '/usr/local/include/host-ipmid'
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
 /bin/mkdir -p '/usr/local/lib/ipmid-providers'
 /bin/bash ./libtool   --mode=install /usr/bin/install -c
libsysintfcmds.la '/usr/local/lib/ipmid-providers'
libtool: install: /usr/bin/install -c .libs/libsysintfcmds.so.0.0.0
/usr/local/lib/ipmid-providers/libsysintfcmds.so.0.0.0
libtool: install: (cd /usr/local/lib/ipmid-providers && { ln -s -f
libsysintfcmds.so.0.0.0 libsysintfcmds.so.0 || { rm -f
libsysintfcmds.so.0 && ln -s libsysintfcmds.so.0.0.0
libsysintfcmds.so.0; }; })
libtool: install: (cd /usr/local/lib/ipmid-providers && { ln -s -f
libsysintfcmds.so.0.0.0 libsysintfcmds.so || { rm -f libsysintfcmds.so
&& ln -s libsysintfcmds.so.0.0.0 libsysintfcmds.so; }; })
libtool: install: /usr/bin/install -c .libs/libsysintfcmds.lai
/usr/local/lib/ipmid-providers/libsysintfcmds.la
libtool: finish:
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin"
ldconfig -n /usr/local/lib/ipmid-providers
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/local/lib/ipmid-providers

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
make[3]: Entering directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
 /bin/mkdir -p '/usr/local/lib/ipmid-providers'
 /bin/bash ./libtool   --mode=install /usr/bin/install -c
libipmi20.la '/usr/local/lib/ipmid-providers'
libtool: warning: relinking 'libipmi20.la'
libtool: install: (cd
/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid;
/bin/bash "/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid/libtool"
 --tag CXX --mode=relink g++ -std=c++17 -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB -I/usr/local/include
-I/usr/local/include -flto -g -O2 -Wall -Werror -lsystemd
-L/usr/local/lib -lphosphor_logging -lsdbusplus -lsystemd
-L/usr/local/lib -lphosphor_dbus -lstdc++fs -luserlayer -version-info
0:0:0 -shared -o libipmi20.la -rpath /usr/local/lib/ipmid-providers
libipmi20_la-net.lo app/libipmi20_la-channel.lo
app/libipmi20_la-watchdog.lo app/libipmi20_la-watchdog_service.lo
libipmi20_la-apphandler.lo libipmi20_la-sys_info_param.lo
libipmi20_la-sensorhandler.lo libipmi20_la-storagehandler.lo
libipmi20_la-chassishandler.lo libipmi20_la-dcmihandler.lo
libipmi20_la-ipmisensor.lo libipmi20_la-storageaddsel.lo
libipmi20_la-transporthandler.lo libipmi20_la-globalhandler.lo
libipmi20_la-groupext.lo libipmi20_la-utils.lo
libipmi20_la-selutility.lo libipmi20_la-ipmi_fru_info_area.lo
libipmi20_la-read_fru_data.lo libipmi20_la-sensordatahandler.lo
user_channel/libipmi20_la-usercommands.lo
user_channel/libipmi20_la-channelcommands.lo
libipmi20_la-sensor-gen.lo libipmi20_la-inventory-sensor-gen.lo
libipmi20_la-fru-read-gen.lo libipmi20_la-channel-gen.lo -lmapper )
libtool: relink: g++ -std=c++17  -fPIC -DPIC -shared -nostdlib
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crti.o
/usr/lib/gcc/x86_64-linux-gnu/7/crtbeginS.o  .libs/libipmi20_la-net.o
app/.libs/libipmi20_la-channel.o app/.libs/libipmi20_la-watchdog.o
app/.libs/libipmi20_la-watchdog_service.o
.libs/libipmi20_la-apphandler.o .libs/libipmi20_la-sys_info_param.o
.libs/libipmi20_la-sensorhandler.o .libs/libipmi20_la-storagehandler.o
.libs/libipmi20_la-chassishandler.o .libs/libipmi20_la-dcmihandler.o
.libs/libipmi20_la-ipmisensor.o .libs/libipmi20_la-storageaddsel.o
.libs/libipmi20_la-transporthandler.o
.libs/libipmi20_la-globalhandler.o .libs/libipmi20_la-groupext.o
.libs/libipmi20_la-utils.o .libs/libipmi20_la-selutility.o
.libs/libipmi20_la-ipmi_fru_info_area.o
.libs/libipmi20_la-read_fru_data.o
.libs/libipmi20_la-sensordatahandler.o
user_channel/.libs/libipmi20_la-usercommands.o
user_channel/.libs/libipmi20_la-channelcommands.o
.libs/libipmi20_la-sensor-gen.o
.libs/libipmi20_la-inventory-sensor-gen.o
.libs/libipmi20_la-fru-read-gen.o .libs/libipmi20_la-channel-gen.o
-L/usr/local/lib -lphosphor_logging -lsdbusplus -lsystemd
-lphosphor_dbus -lstdc++fs -luserlayer -lmapper
-L/usr/lib/gcc/x86_64-linux-gnu/7
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu
-L/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib
-L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu
-L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/7/../../.. -lstdc++
-lm -lc -lgcc_s /usr/lib/gcc/x86_64-linux-gnu/7/crtendS.o
/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/crtn.o
-flto -g -O2   -Wl,-soname -Wl,libipmi20.so.0 -o
.libs/libipmi20.so.0.0.0
/usr/bin/ld: cannot find -luserlayer
collect2: error: ld returned 1 exit status
libtool:   error: error: relink 'libipmi20.la' with the above command
before installing it
Makefile:882: recipe for target 'install-libipmi20LTLIBRARIES' failed
make[3]: *** [install-libipmi20LTLIBRARIES] Error 1
make[3]: Leaving directory
'/usr/local/google/git/workspaces/ci_test_area/phosphor-host-ipmid'
Makefile:1987: recipe for target 'install-am' failed
make[2]: *** [install-am] Error 2
Makefile:1527: recipe for target 'install-recursive' failed
make[1]: *** [install-recursive] Error 1
Makefile:1981: recipe for target 'install' failed
make: *** [install] Error 2

Patrick
