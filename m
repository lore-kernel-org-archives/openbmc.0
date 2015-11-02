Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7A1031A0298
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2015 12:44:25 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 1 Nov 2015 20:44:21 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 1 Nov 2015 20:44:18 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 3025F38C8041
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 20:44:18 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tA21iIfr49479808
 for <openbmc@lists.ozlabs.org>; Mon, 2 Nov 2015 01:44:18 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tA21iHiS028887
 for <openbmc@lists.ozlabs.org>; Sun, 1 Nov 2015 20:44:17 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tA21iHHI028877
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sun, 1 Nov 2015 20:44:17 -0500
Message-Id: <201511020144.tA21iHHI028877@d01av03.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 1 Nov 2015 20:44:17 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 1 Nov 2015 20:44:16 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 2 Nov 2015 01:44:15 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 2 Nov 2015 01:44:13 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015110201442912-163264 ;
 Mon, 2 Nov 2015 01:44:29 +0000 
In-Reply-To: 
Subject: Skeleton dependencies need fixin 
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 2 Nov 2015 01:44:12 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_10192015_FP1 October 21, 2015
X-LLNOutbound: False
X-Disclaimed: 5407
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15110201-0041-0000-0000-0000022F5C7F
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.293918; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004558; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00611369; UDB=6.00270058; UTC=2015-11-02
 01:44:14
x-cbparentid: 15110201-9900-0000-0000-000004B912B5
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
X-List-Received-Date: Mon, 02 Nov 2015 01:44:26 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Somethings not right with the build.&nbs=
p; If I try to do a clean build I don't get all of skeleton code.&nbsp;</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div><strong>rm -rf build/conf</strong></div>
<div><strong>rm -rf build/tmp</strong></div>
<div><strong>bitbake obmc-phosphor-image</strong></div>
<div><div>$ find . -name pflash<br>./tmp/work/palmetto-openbmc-linux-gnueab=
i/obmc-phosphor-image/1.0-r0/rootfs/usr/sbin/pflash</div></div>
<div>&nbsp;</div>
<div>But if after all that above I then run the commands below, they do ind=
eed get in to the flash image.</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><strong>bitbake -c cleanall skeleton</strong></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>$ find . -name pflash<br>./tmp/work/palmetto-openbmc=
-linux-gnueabi/obmc-phosphor-image/1.0-r0/rootfs/usr/sbin/pflash</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>bitbake -c compile skeleton</strong></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>$ find . -name pflash<br>./tmp/work/armv5e-openbmc-l=
inux-gnueabi/skeleton/1.0-r1/git/objects/pflash<br>./tmp/work/armv5e-openbm=
c-linux-gnueabi/skeleton/1.0-r1/git/bin/pflash<br>./tmp/work/palmetto-openb=
mc-linux-gnueabi/obmc-phosphor-image/1.0-r0/rootfs/usr/sbin/pflash<br>caust=
en@causten-VirtualBox:~/openbmc-barreleye/build<br>$</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>bitbake obmc-phosphor-image</strong></div>
<div>&nbsp;</div>
<div><div>$ find . -name pflash<br>./tmp/work/armv5e-openbmc-linux-gnueabi/=
skeleton/1.0-r1/image/usr/sbin/pflash<br>./tmp/work/armv5e-openbmc-linux-gn=
ueabi/skeleton/1.0-r1/git/objects/pflash<br>./tmp/work/armv5e-openbmc-linux=
-gnueabi/skeleton/1.0-r1/git/bin/pflash<br>./tmp/work/armv5e-openbmc-linux-=
gnueabi/skeleton/1.0-r1/packages-split/skeleton-dbg/usr/src/debug/skeleton/=
1.0-r1/git/objects/pflash<br>./tmp/work/armv5e-openbmc-linux-gnueabi/skelet=
on/1.0-r1/packages-split/skeleton-dbg/usr/sbin/.debug/pflash<br>./tmp/work/=
armv5e-openbmc-linux-gnueabi/skeleton/1.0-r1/packages-split/skeleton/usr/sb=
in/pflash<br>./tmp/work/armv5e-openbmc-linux-gnueabi/skeleton/1.0-r1/packag=
e/usr/src/debug/skeleton/1.0-r1/git/objects/pflash<br>./tmp/work/armv5e-ope=
nbmc-linux-gnueabi/skeleton/1.0-r1/package/usr/sbin/pflash<br>./tmp/work/ar=
mv5e-openbmc-linux-gnueabi/skeleton/1.0-r1/package/usr/sbin/.debug/pflash<b=
r>./tmp/work/palmetto-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/root=
fs/usr/sbin/pflash<br>causten@causten-VirtualBox:~/openbmc-barreleye/build<=
br>$</div>
<div>&nbsp;</div></div>
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
