Return-Path: <miltonm@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 041AA1A0008
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 14:06:05 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 2 Mar 2016 20:06:02 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Mar 2016 20:06:01 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 515531FF001E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 19:54:10 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u23360qa31260726
 for <openbmc@lists.ozlabs.org>; Thu, 3 Mar 2016 03:06:00 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u23360K1018856
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2016 22:06:00 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u23360du018848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2016 22:06:00 -0500
Message-Id: <201603030306.u23360du018848@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 2 Mar 2016 22:06:00 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 2 Mar 2016 22:05:57 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 3 Mar 2016 03:05:56 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 3 Mar 2016 03:05:55 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016030303055440-15163 ;
 Thu, 3 Mar 2016 03:05:54 +0000 
In-Reply-To: 
Subject: RFC: Pre pull request for openbmc initfs updates
From: "Milton Miller II" <miltonm@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 3 Mar 2016 03:05:54 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP3 February 26, 2016
X-LLNOutbound: False
X-Disclaimed: 53811
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16030303-0009-0000-0000-000012F19907
X-IBM-ISS-SpamDetectors: Score=0.431006; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.431006; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004988; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00667831; UDB=6.00304721; UTC=2016-03-03
 03:05:55
x-cbparentid: 16030303-9588-0000-0000-0000023D52E8
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 03:06:06 -0000


All,=20

I have completed initial testing of my updates to initfs to allow=20
running from RAM.  Comments on the option names and functions are=20
welcome.  The branch is available at=20

https://github.com/mdmillerii/openbmc/tree/wip-from-ram


There are a couple of use cases enabled by this series:

1) Allow the BMC to run without any access to the flash.

2) Allow running a new application layer while updating the flash.

3) Allow a new application layer to be tested without committing it=20
   to flash.

4) Allow running the overlay totally from RAM with only white
   listed files saved at specific times.


This is implemented by having the following options in init:

- An option and hook to run a command that could download an image

- Alternatively use existing debug-init-sh hook

- An option to copy existing read-only file into RAM

- Mount an read-only file system image in RAM via a loop device

- An option to copy white listed files from read-write file system=C2=A0to =

  RAM for use at runtime =C2=A0(can also use empty overlay but that would=20
  loose   dropbear key, machine id, network settings)

- An option to suppress mounting Read-Write file system before creating=20
  overlay


The following options control the behavior of /init in the initramfs:

- debug-init-sh : a previously existing hook to invoke a shell via=20
  sulogin, can add or change options here

- openbmc-init-download-files  : will execute via sh -c the saved=20
  contents of openbmcinitdownload u-boot variable (which can be=20
  used to download files via http (wget) or tftp).

- clean-rwfs-filesystem : an existing option to remove , erase, and=20
  restore files.  unless a image-rwfs exists via download this will=20
  have the side effect of converting the read-write files ystem to=20
  jffs2 our current build choice.

- copy-files-to-ram : copy files from the read-write files system to ram

- overlay-filesystem-in-ram : skip mounting read-write filesystem, will=20
  be blank if copy-files-to-ram not set

- copy-base-filesystem-to-ram : copy existing flash to image to ram=20
  unless an image file is already present in ram

These options are read from the /run/initramfs/init-options which is=20
initialized from the combination of the kernel command line and=20
the saved contents of two u-boot environment variables openbmcinit=20
and openbmconce.  The file can be edited at the debug-init-sh prompt=20
and/or via the shell command line stored in the debug hook.

A custom initramfs can be booted via tftp with an embedded image-rofs=20
that will be activated for run.

I do not have a dhcp server to test setting variables from a dhcp script.

An example download command today might be:
u-boot env:

# set kernel command line with copy of static ip configuration (none). run =
addip
fw=5Fsetenv addip 'setenv bootargs ${bootargs} ip=3D${ipaddr}:${serverip}:$=
{gatewayip}:${netmask}:${hostname}:eth0:none:${dnsip}:${dnsip2}'

# init option via kernel command line for temporary host by "run triggerdow=
nload"
fw=5Fsetenv triggerdownload "setenv bootargs ${bootargs} openbmc-init-downl=
oad-files"

# an http get from dns resolved host
fw=5Fsetenv openbmcinitdownload 'cp /proc/net/pnp /run/resolv.conf ; ln -sn=
f ../run/resolv.conf /etc/resolv.conf ; wget -O /run/image-rofs http://serv=
er.example.com/openbmc/test-image-rofs'

# a simple tftp to fixed numberic server
fw=5Fsetenv openbmcinitdownload 'tftp -r test-image-rofs -l /run/image-rofs=
 -g 192.168.0.1'
---
at the u-boot prompt you can then run
run addip dodownload

Not implemented but on shortlist:

Make update script more strict / lenient / smart, allowing update or save=20
of rwfs files during runtime while read only file system is running from=20
flash, or writing read only file system image while read write file=20
system is running from flash (possibly cleaned to white listed files on=20
this boot).  Delayed because it needs to exclude bmc container update
in addition to 3 ways to specify mtd device to mount.

Modify update script to take list of images to update instead of finding=20
files via wildcard would save creating empty updates to run white list=20
functions and duplicate knowledge of where images to flash are located.open=
bmc-init-download-files

Add options to change runtime init (eg init=3D kernel command line), defer =

updates (flash=5Fimages=5Fbefore=5Finit=3Dn), and force jffs2 options in bo=
ot.

Adding hook for running script(s) before runtime init run to setup files
before systemd.

Adding systemd unit to clear the run-once init options variable from=20
u-boot environment.  The command is "fw=5Fsetenv openbmcbootonce" and it=20
can run every boot as the shutdown script will trigger an update of the=20
fw=5Fenv back to flash on shutdown if the file differs from the flash.
