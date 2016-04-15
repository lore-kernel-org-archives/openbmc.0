Return-Path: <austenc@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmmsJ06qKzDq62
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 04:53:39 +1000 (AEST)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Apr 2016 12:53:37 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 15 Apr 2016 12:53:35 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 8C6623E40030
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 12:53:34 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3FIrY9l46989538
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 11:53:34 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3FIrYHN024467
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 12:53:34 -0600
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3FIrYF0024455
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 12:53:34 -0600
Message-Id: <201604151853.u3FIrYF0024455@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Apr 2016 12:53:34 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Apr 2016 12:53:32 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Apr 2016 18:53:31 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 15 Apr 2016 18:53:29 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016041518532947-384108 ;
 Fri, 15 Apr 2016 18:53:29 +0000 
In-Reply-To: 
Subject: Resolving the lonely pull request
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 15 Apr 2016 18:53:29 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP5 April 14, 2016
X-LLNOutbound: False
X-Disclaimed: 7923
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16041518-0029-0000-0000-0000231360C8
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005159; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000158; SDB=6.00688529; UDB=6.00317006; UTC=2016-04-15
 18:53:30
x-cbparentid: 16041518-7792-0000-0000-0000030DE64E
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
X-List-Received-Date: Fri, 15 Apr 2016 18:53:40 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Days, weeks and months go by with some pull requests sitt=
ing idle.&nbsp; Is it because no one feels accountable for the review?&nbsp=
; Would it make sense to assign maintainers for repos?&nbsp; I'd like to th=
ink we made the right call asking someone to work on one piece of functiona=
lity over another but it's hard to think that when it sits for multiple wee=
ks.&nbsp; I think everyone on this team has put in long nights and weekends=
 to meet sprint schedules and we owe it to each other to put in the last mi=
le.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >This is just a stab based on the number of commits someon=
e has issued to a repo.&nbsp; I spent a grand total of 1 minute assigning n=
ames so if you think I've got something wrong or you want to grow your infl=
uence/leadership/career to take on more then feel free to make changes.&nbs=
p; People should still have others review their code it would simply be a s=
tatement of who do I go to when commits seem to not be going any where.&nbs=
p;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Comments?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >rest-dbus - Brad</div>
<div dir=3D"ltr" >openbmc - Norm</div>
<div dir=3D"ltr" >phosphor-objmgr - Brad</div>
<div dir=3D"ltr" >pyphosphor - Brad</div>
<div dir=3D"ltr" >ipmi-fru-parser - Vishwa</div>
<div dir=3D"ltr" >skeleton - Norm</div>
<div dir=3D"ltr" >openpower-inventory-upload&nbsp; - Patrick</div>
<div dir=3D"ltr" >openpower-host-ipmi-oem - ChrisA</div>
<div dir=3D"ltr" >docs - Jeremy</div>
<div dir=3D"ltr" >phosphor-host-ipmid - Vishwa</div>
<div dir=3D"ltr" >obmc-console - Jeremy</div>
<div dir=3D"ltr" >uboot - Joel</div>
<div dir=3D"ltr" >phosphor-settingsd - Tom</div>
<div dir=3D"ltr" >qemu - Andrew J</div>
<div dir=3D"ltr" >phosphor-rest-server - Brad</div>
<div dir=3D"ltr" >phosphor-networkd - Hari</div>
<div dir=3D"ltr" >linux - Joel</div>
<div dir=3D"ltr" >phosphor-event - ChrisA</div>
<div dir=3D"ltr" >openbmc-build-scripts - ChrisS</div>
<div dir=3D"ltr" >inarp - Jeremy</div>
<div dir=3D"ltr" >btbridge - Cyril</div>
<div dir=3D"ltr" >openbmc-test-automation - Ratan</div>
<div dir=3D"ltr" >kernel-hwmon-occ &lt;--- Delete?</div>
<div dir=3D"ltr" >phosphor-hwmon -&nbsp; Patrick</div>
<div dir=3D"ltr" >ipmitool - Jeremy</div>
<div dir=3D"ltr" >meta* - ?</div>
<div dir=3D"ltr" >&nbsp;
<div>&nbsp;</div>
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
