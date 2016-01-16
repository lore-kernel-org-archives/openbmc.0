Return-Path: <austenc@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A97EF1A0075
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 18:23:30 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 16 Jan 2016 00:23:28 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 16 Jan 2016 00:23:26 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5071619D8026
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 00:11:27 -0700 (MST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0G7NPPP32833694
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 07:23:25 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0G7NP5O014817
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 02:23:25 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0G7NPMm014807
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 02:23:25 -0500
Message-Id: <201601160723.u0G7NPMm014807@d01av01.pok.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 16 Jan 2016 02:23:25 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 16 Jan 2016 02:23:23 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 16 Jan 2016 07:23:22 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 16 Jan 2016 07:23:21 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016011607242195-19521 ;
 Sat, 16 Jan 2016 07:24:21 +0000 
To: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
In-Reply-To: <1452925878-19525-1-git-send-email-openbmc-patches@stwcx.xyz>
Date: Sat, 16 Jan 2016 07:23:21 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH skeleton] skeleton: Add BMC cold_reset() method to
 org.openbmc.control.Bmc dbus interface
Cc: "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.9 Build 201512301413_20
X-KeepSent: A5D5A368:0252597D-00257F3C:00289714;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 45167
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_33_1036271044.1452929001336"
x-cbid: 16011607-0013-0000-0000-00001BF08FE9
X-IBM-ISS-SpamDetectors: Score=0.429909; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.429909; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004795; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000133; SDB=6.00645967; UDB=6.00291476; UTC=2016-01-16
 07:23:22
x-cbparentid: 16011607-5090-0000-0000-000006AE6384
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
X-List-Received-Date: Sat, 16 Jan 2016 07:23:31 -0000


------=_Part_33_1036271044.1452929001336
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Needs to move out of skeleton.  Use sdbus no gdbus=0A =0A Sent from my iPho=
ne using IBM Verse=0A =0A On Jan 16, 2016, 12:31:39 AM, "OpenBMC Patches" <=
openbmc-patches@stwcx.xyz> wrote:=0A =0A   The host sends IPMI 'cold reset'=
 command to reset BMC. Ipmid=0A  calls the org.openbmc.control.Bmc::cold=5F=
reset() to do reset.=0A  cold=5Freset() just invoke "reboot --force", which=
 in effect=0A  same as a 'cold' reset.=0A  https://github.com/openbmc/skele=
ton/pull/28=0A  William (1):=0A   skeleton: Add BMC cold=5Freset() method t=
o org.openbmc.control.Bmc dbus=0A     interface=0A  interfaces/openbmc=5Fin=
tf.c | 56 +++++++++++++++++++++++------------------------=0A  interfaces/op=
enbmc=5Fintf.h | 10 ++++-----=0A  objects/control=5Fbmc=5Fobj.c | 35 ++++++=
+++++++++++++++++++----=0A  xml/openbmc=5Fintf.xml      |  2 +-=0A  4 files=
 changed, 65 insertions(+), 38 deletions(-)=0A  -- =0A  2.6.4=0A  =5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A  openbmc maili=
ng list=0A  openbmc@lists.ozlabs.org=0A  https://lists.ozlabs.org/listinfo/=
openbmc

------=_Part_33_1036271044.1452929001336
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Needs to move out of skeleton. &nbsp;Use sdbus no gdbus<br=
><br>Sent from my iPhone using IBM Verse<br><br><hr>On Jan 16, 2016, 12:31:=
39 AM, "OpenBMC Patches" &lt;openbmc-patches@stwcx.xyz&gt; wrote:<br><div s=
tyle=3D"margin-left: 15px;" id=3D"MaaS360PIMSDKOriginalMessageId">The&nbsp;=
host&nbsp;sends&nbsp;IPMI&nbsp;'cold&nbsp;reset'&nbsp;command&nbsp;to&nbsp;=
reset&nbsp;BMC.&nbsp;Ipmid<br>calls&nbsp;the&nbsp;org.openbmc.control.Bmc::=
cold=5Freset()&nbsp;to&nbsp;do&nbsp;reset.<br>cold=5Freset()&nbsp;just&nbsp=
;invoke&nbsp;"reboot&nbsp;--force",&nbsp;which&nbsp;in&nbsp;effect<br>same&=
nbsp;as&nbsp;a&nbsp;'cold'&nbsp;reset.<br>https://github.com/openbmc/skelet=
on/pull/28<br>William&nbsp;(1):<br>&nbsp;skeleton:&nbsp;Add&nbsp;BMC&nbsp;c=
old=5Freset()&nbsp;method&nbsp;to&nbsp;org.openbmc.control.Bmc&nbsp;dbus<br=
>&nbsp;&nbsp;&nbsp;interface<br>interfaces/openbmc=5Fintf.c&nbsp;|&nbsp;56&=
nbsp;+++++++++++++++++++++++------------------------<br>interfaces/openbmc=
=5Fintf.h&nbsp;|&nbsp;10&nbsp;++++-----<br>objects/control=5Fbmc=5Fobj.c&nb=
sp;|&nbsp;35&nbsp;+++++++++++++++++++++++++----<br>xml/openbmc=5Fintf.xml&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;2&nbsp;+-<br>4&nbsp;files&nb=
sp;changed,&nbsp;65&nbsp;insertions(+),&nbsp;38&nbsp;deletions(-)<br>--&nbs=
p;<br>2.6.4<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc@lists.ozlabs.org<br>htt=
ps://lists.ozlabs.org/listinfo/openbmc<br></div></div><BR>
</body></html>

------=_Part_33_1036271044.1452929001336--
