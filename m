Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bnQR0Jw4zDr1q
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 02:50:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2019 07:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,466,1539673200"; d="scan'208";a="309612529"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2019 07:50:48 -0800
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 11 Jan 2019 07:50:47 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.248]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.130]) with mapi id 14.03.0415.000;
 Fri, 11 Jan 2019 07:50:47 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: "omkar.kuppa@sanmina.com" <omkar.kuppa@sanmina.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Build fail - Reg
Thread-Topic: Build fail - Reg
Thread-Index: AQHUqabe9RfkIOnNY0ud1IZttI8FHqWql4OA//+gBUA=
Date: Fri, 11 Jan 2019 15:50:47 +0000
Message-ID: <9251870D-2847-49BD-A222-AC1009B494A2@intel.com>
References: <CAOSNvHpQqF_7=RCN+jcR7enA+x_ikWfUP70P0rizau7MoZYFbw@mail.gmail.com>,
 <CALLMt=q75TCAEhAnLD1sv=cdN8dWdUZwwt3ZjyOK4HeTS9m9zA@mail.gmail.com>
In-Reply-To: <CALLMt=q75TCAEhAnLD1sv=cdN8dWdUZwwt3ZjyOK4HeTS9m9zA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 11 Jan 2019 15:50:55 -0000

Does your network have a proxy server?  There are quite a few things that n=
eed configured to get a successful build behind a proxy server.

-Ed

> On Jan 11, 2019, at 5:34 AM, Andrew Geissler <geissonator@gmail.com> wrot=
e:
>=20
>> On Fri, Jan 11, 2019 at 6:12 AM Omkar Kuppa <omkar.kuppa@sanmina.com> wr=
ote:
>>=20
>> Hi all,
>> I've downloaded the openbmc project from github. While building the proj=
ect, I'm facing the following error.
>>=20
>> Build Configuration:
>> BB_VERSION           =3D "1.40.0"
>> BUILD_SYS            =3D "i686-linux"
>> NATIVELSBSTRING      =3D "ubuntu-14.04"
>> TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
>> MACHINE              =3D "zaius"
>> DISTRO               =3D "openbmc-phosphor"
>> DISTRO_VERSION       =3D "0.1.0"
>> TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
>> TARGET_FPU           =3D "soft"
>> meta-zaius           =3D "master:1a4b7ee28bf7413af6513fb45ad0d0736048f86=
6"
>>=20
>> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure=
: Fetch command export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=
=3D"unix:abstract=3D/tmp/dbus-4MEPus6gYW"; export SSH_AUTH_SOCK=3D"/run/use=
r/1000/keyring-5RCWfK/ssh"; export PATH=3D"/../openbmc/build/tmp/work/armv6=
-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysro=
ot-native/usr/bin/python3-native:/../openbmc/scripts:/../openbmc/build/tmp/=
work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/re=
cipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi:/../openbmc/build/tmp=
/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/r=
ecipe-sysroot/usr/bin/crossscripts:/../openbmc/build/tmp/work/armv6-openbmc=
-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-nativ=
e/usr/sbin:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-brok=
er/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin:/../openbmc/bu=
ild/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa=
09-r0/recipe-sysroot-native/sbin:/../openbmc/build/tmp/work/armv6-openbmc-l=
inux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/=
bin:/../openbmc/poky/bitbake/bin:/../openbmc/build/tmp/hosttools"; export H=
OME=3D"/home/omkar"; LANG=3DC git -c core.fsyncobjectfiles=3D0 clone --bare=
 --mirror git://github.com/bus1/dbus-broker /../openbmc/build/downloads/git=
2/github.com.bus1.dbus-broker --progress failed with exit code 128, output:
>> Cloning into bare repository '/../openbmc/build/downloads/git2/github.co=
m.bus1.dbus-broker'...
>> fatal: unable to connect to github.com:
>> github.com[0: 52.74.223.119]: errno=3DConnection timed out
>> github.com[1: 13.250.177.223]: errno=3DConnection timed out
>> github.com[2: 13.229.188.59]: errno=3DConnection timed out
>=20
> These certainly looks suspicious. Intermittent github connection issues?
> Did you try rebuilding a few times? The initial build requires a lot
> of network based downloads.
>=20
>>=20
>> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure=
 for URL: 'gitsm://github.com/bus1/dbus-broker;protocol=3Dgit'. Unable to f=
etch URL from any source.
>> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Function failed=
: base_do_fetch
>> ERROR: Logfile of failure stored in: /../openbmc/build/tmp/work/armv6-op=
enbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/log.do_fet=
ch.2531
>> ERROR: Task (/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbu=
s-broker_git.bb:do_fetch) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2757 tasks of which 2756 didn't need to b=
e rerun and 1 failed.
>>=20
>> Summary: 1 task failed:
>>  /../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git=
.bb:do_fetch
>>=20
>> I'm trying to build the open bmc project for the first time. I tried to =
build for Romulus, Palmetto and Zaius. Each build failed with a different e=
rror. I don't have the errors for other builds. Please let me know how to r=
esolve this error.
>>=20
>> Thanks in advance,
>> Omkar
>>=20
>> CONFIDENTIALITY
>> This e-mail message and any attachments thereto, is intended only for us=
e by the addressee(s) named herein and may contain legally privileged and/o=
r confidential information. If you are not the intended recipient of this e=
-mail message, you are hereby notified that any dissemination, distribution=
 or copying of this e-mail message, and any attachments thereto, is strictl=
y prohibited. If you have received this e-mail message in error, please imm=
ediately notify the sender and permanently delete the original and any copi=
es of this email and any prints thereof.
>> ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS =
NOT INTENDED AS A SUBSTITUTE FOR A WRITING. Notwithstanding the Uniform Ele=
ctronic Transactions Act or the applicability of any other law of similar s=
ubstance and effect, absent an express statement to the contrary hereinabov=
e, this e-mail message its contents, and any attachments hereto are not int=
ended to represent an offer or acceptance to enter into a contract and are =
not otherwise intended to bind the sender, Sanmina Corporation (or any of i=
ts subsidiaries), or any other person or entity.
