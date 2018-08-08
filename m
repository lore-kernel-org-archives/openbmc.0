Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lxhx255YzDrbB
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 02:31:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w78GSxiT146075
 for <openbmc@lists.ozlabs.org>; Wed, 8 Aug 2018 12:31:10 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kr19k8f4f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 12:31:10 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Wed, 8 Aug 2018 12:31:09 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Aug 2018 12:31:08 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w78GV7Fo10486024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Aug 2018 16:31:07 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49CABAE064;
 Wed,  8 Aug 2018 12:30:04 -0400 (EDT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23C34AE05C;
 Wed,  8 Aug 2018 12:30:04 -0400 (EDT)
Received: from [9.10.99.188] (unknown [9.10.99.188])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Aug 2018 12:30:03 -0400 (EDT)
Subject: Re: bitbake do_configure failure: automake: command not found
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notx7qNDyNDA=Zd2amR1CyYT1YtO1v69YMb0kc9SCJTVfuQ@mail.gmail.com>
 <7129fe1c-73ac-0489-b34c-a44ce3490ad8@linux.ibm.com>
 <CAO=notwa+5gjMK6Egft+bvAHsNv6RfSipyinkt-5+0FOFW6xxA@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Wed, 8 Aug 2018 11:31:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwa+5gjMK6Egft+bvAHsNv6RfSipyinkt-5+0FOFW6xxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18080816-2213-0000-0000-000002D78EB5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009507; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01071004; UDB=6.00551387; IPR=6.00850549; 
 MB=3.00022590; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-08 16:31:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080816-2214-0000-0000-00005B21B914
Message-Id: <39b5cc92-0dfe-cfe0-c0ce-5e57e1c4295d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808080168
X-Mailman-Approved-At: Fri, 10 Aug 2018 10:59:07 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 16:31:13 -0000



On 08/08/2018 11:04 AM, Patrick Venture wrote:
> On Wed, Aug 8, 2018 at 8:56 AM, Matthew Barth <msbarth@linux.ibm.com> wrote:
>>
>>
>> On 08/08/2018 09:42 AM, Patrick Venture wrote:
>>>
>>> I'm seeing the configure fail on a couple downstream recipes that
>>> essentially just build ipmi libraries now that we're merged with v2.2
>>> of OpenBMC.
>>>
>>> NOTE: recipe google-ipmi-ethstats-1.0-r0: task do_configure: Started
>>> ERROR: google-ipmi-ethstats-1.0-r0 do_configure: Function failed:
>>> do_configure (log file is located at
>>>
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938)
>>> ERROR: Logfile of failure stored in:
>>>
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938
>>> Log data follows:
>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>>> 'arm-linux-gnueabi', 'common']
>>> | DEBUG: Executing shell function autotools_preconfigure
>>> | DEBUG: Shell function autotools_preconfigure finished
>>> | DEBUG: Executing python function autotools_aclocals
>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>>> 'arm-linux-gnueabi', 'common']
>>> | DEBUG: Python function autotools_aclocals finished
>>> | DEBUG: Executing shell function do_configure
>>> |
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>> 1:
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>> automake: not found
>>> |
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>> 146:
>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>> automake: not found
>>
>>  From what's given, I'd check to see if the continuous build environment has
>> the autotools installed since `automake` isnt found.
> 
> So, the environment has automake and autotools-dev installed.  I also
> tried within a docker instance and made sure those were installed.
> That said, with yocto 2.3 it's not supposed to rely on what's
> installed in the host environment but rather rely on the native
> packages that come as dependencies.  Or am I mistaken?
> 
Correct, yocto should include the dependencies. Is automake included 
within openbmc/import-layers/yocto-poky/meta/recipes-devtools ?

>>
>>
>>> | WARNING: exit code 127 from a shell command.
>>>
>>> The configure.ac:
>>>
>>> # Initialization
>>> AC_PREREQ([2.69])
>>> AC_INIT([gsys-ipmi], [1.0], [https://www.google.com])
>>> AC_LANG([C++])
>>> AC_CONFIG_HEADERS([config.h])
>>> AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign dist-xz])
>>> AM_SILENT_RULES([yes])
>>> # Checks for programs.
>>> AC_PROG_CXX
>>> AM_PROG_AR
>>> AC_PROG_INSTALL
>>> AC_PROG_MAKE_SET
>>> # Checks for typedefs, structures, and compiler characteristics.
>>> AX_CXX_COMPILE_STDCXX_14([noext])
>>> AX_APPEND_COMPILE_FLAGS([-Wall -Werror], [CXXFLAGS])
>>> # Checks for libraries.
>>> PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 221], [],
>>> [AC_MSG_ERROR(["systemd required and not found"])])
>>> PKG_CHECK_MODULES([SDBUSPLUS], [sdbusplus], ,[AC_MSG_ERROR([The
>>> openbmc/sdbusplus package is required])])
>>> PKG_CHECK_MODULES([PHOSPHOR_LOGGING], [phosphor-logging],
>>> ,[AC_MSG_ERROR([The openbmc/phosphor-logging package is required])])
>>> PKG_CHECK_MODULES([PHOSPHOR_DBUS_INTERFACES],
>>> [phosphor-dbus-interfaces], [],
>>> [AC_MSG_ERROR(["phosphor-dbus-interfaces required and not found."])])
>>> AC_CHECK_HEADER(experimental/any, ,[AC_MSG_ERROR([Could not find
>>> experimental/any...libstdc++fs developement package required])])
>>> # Checks for library functions.
>>> LT_INIT # Required for systemd linking
>>> # Create configured output
>>> AC_CONFIG_FILES([Makefile])
>>> AC_OUTPUT
>>>
>>> Which looks like all the others I've seen, more or less, nothing special.
>>>
>>> The recipe:
>>>
>>> SUMMARY = "Ethernet Statistics OEM Command"
>>> DESCRIPTION = "Ethernet Statistics OEM Command"
>>> LICENSE = "CLOSED"
>>> inherit autotools pkgconfig
>>> inherit obmc-phosphor-ipmiprovider-symlink
>>> S = "${WORKDIR}/"
>>> SRC_URI = "file://Makefile.am \
>>>    file://bootstrap.sh \
>>>    file://configure.ac \
>>>    file://main.cpp \
>>> "
>>> DEPENDS += "autoconf-archive-native"
>>> DEPENDS += "sdbusplus"
>>> DEPENDS += "phosphor-logging"
>>> # We depend on this to be built first so we can build our providers.
>>> DEPENDS += "phosphor-ipmi-host"
>>> RDEPENDS_${PN} += "sdbusplus phosphor-dbus-interfaces"
>>> FILES_${PN}_append = " ${libdir}/ipmid-providers/lib*${SOLIBS}"
>>> FILES_${PN}_append = " ${libdir}/host-ipmid/lib*${SOLIBS}"
>>> FILES_${PN}_append = " ${libdir}/net-ipmid/lib*${SOLIBS}"
>>> FILES_${PN}-dev_append = " ${libdir}/ipmid-providers/lib*${SOLIBSDEV}
>>> ${libdir}/ipmid-providers/*.la"
>>> HOSTIPMI_PROVIDER_LIBRARY += "libethstatscmd.so"
>>>
>>> Any things to check or poke would be appreciated.  It doesn't break in
>>> all build environments, oddly.  Presumably with the yocto 2.3
>>> inclusion in OpenBMC v2.2, the host environment became less involved. >
>>> But when I build an image on my desktop, it builds fine.  When I run
>>> the same commands in our continuous build environment, it fails.
>>
>> When you build on your desktop are you in an SDK and/or have autotools
>> installed in your environment already and maybe not in the continuous build
>> environment? I'd start poking around for those differences.
> 
> I'm not in an SDK. I'm just building the obmc-phosphor-image from a
> clean check-out of the meta layers.  The command I'm running locally
> and the environment for the continuous build are the same in terms of
> commands and configuration, but different in terms of locally
> installed packages.  Which, per the above, I thought that was no
> longer a factor.
> 
>>
>>>
>>> Patrick
>>>
>>
>> Matt
>>
> 
