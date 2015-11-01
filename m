Return-Path: <austenc@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B25101A02CB
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2015 01:12:45 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 1 Nov 2015 07:12:41 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 1 Nov 2015 07:12:38 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id A303B1FF0021
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 07:00:49 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id tA1EBCiV5308798
 for <openbmc@lists.ozlabs.org>; Sun, 1 Nov 2015 07:11:12 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tA1ECb92019165
 for <openbmc@lists.ozlabs.org>; Sun, 1 Nov 2015 07:12:37 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tA1ECac8019134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sun, 1 Nov 2015 07:12:37 -0700
Message-Id: <201511011412.tA1ECac8019134@d03av05.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 1 Nov 2015 09:12:36 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 1 Nov 2015 09:12:35 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 1 Nov 2015 14:12:34 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 1 Nov 2015 14:12:31 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015110114124554-70837 ;
 Sun, 1 Nov 2015 14:12:45 +0000 
In-Reply-To: 
Subject: openbmc build failing
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Sun, 1 Nov 2015 14:12:29 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_10192015_FP1 October 21, 2015
X-LLNOutbound: False
X-Disclaimed: 46135
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15110114-0029-0000-0000-00000DCC24BE
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004556; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00611140; UDB=6.00269919; UTC=2015-11-01
 14:12:32
x-cbparentid: 15110114-9900-0000-0000-000004B877E0
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
X-List-Received-Date: Sun, 01 Nov 2015 14:12:46 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" ><div class=3D"socpimCom=
binedMailingListContainer" >Anyone seen this issue?</div>
<div class=3D"socpimCombinedMailingListContainer" >&nbsp;</div>
<div class=3D"socpimCombinedMailingListContainer" >&nbsp;</div></div>
<div dir=3D"ltr" ><div>DEBUG: Executing python function package=5Fget=5Faut=
o=5Fpr<br>DEBUG: Python function package=5Fget=5Fauto=5Fpr finished<br>DEBU=
G: Executing shell function do=5Finstall<br>NOTE: make -j 4 DEPMOD=3Decho I=
NSTALL=5FMOD=5FPATH=3D/home/causten/openbmc-barreleye/build/tmp/work/palmet=
to-openbmc-linux-gnueabi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/image modu=
les=5Finstall<br>&nbsp; DEPMOD&nbsp; 4.2.0-openbmc-20151028-1<br>install: c=
annot stat 'arch/arm/boot/cuImage': No such file or directory<br>WARNING: e=
xit code 1 from a shell command.<br>ERROR: Function failed: do=5Finstall (l=
og file is located at /home/causten/openbmc-barreleye/build/tmp/work/palmet=
to-openbmc-linux-gnueabi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/temp/log.d=
o=5Finstall.20085)</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" >&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div></div><BR>
