Return-Path: <jiangyu@cn.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C75F71A02E8
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2015 02:20:55 +1100 (AEDT)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Mon, 30 Nov 2015 01:20:54 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 30 Nov 2015 01:20:52 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: jiangyu@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 7CED82CE8050
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2015 02:20:51 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tATFKh3P37617746
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2015 02:20:51 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tATFKJAk016230
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2015 02:20:19 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tATFKHEE015914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2015 02:20:18 +1100
Message-Id: <201511291520.tATFKHEE015914@d23av02.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Sun, 29 Nov 2015 08:19:53 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 29 Nov 2015 08:19:51 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: jiangyu@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Sun, 29 Nov 2015 15:19:50 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 29 Nov 2015 15:19:48 -0000
Received: from us1a3-mail123.a3.dal06.isc4sb.com ([10.146.45.250])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015112915205674-65835 ;
 Sun, 29 Nov 2015 15:20:56 +0000 
In-Reply-To: 
Subject: China Team's weekly status_20151129
From: "Frank J Yu" <jiangyu@cn.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Sun, 29 Nov 2015 15:19:47 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_11092015_FP2 November 12, 2015
X-LLNOutbound: False
X-Disclaimed: 39731
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15112915-0017-0000-0000-000002445543
X-IBM-ISS-SpamDetectors: Score=0.380009; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.380009; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004623; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00624224; UDB=6.00277902; UTC=2015-11-29
 15:19:50
x-cbparentid: 15112915-4778-0000-0000-00000108C16A
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
X-List-Received-Date: Sun, 29 Nov 2015 15:20:55 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"> Dear All, <br><br>In order to help China team co-work with the team=
, I would like to report China team's status weekly here and look forward t=
o your comments and suggestions. Thanks!<br><br>Finished:<br><font size=3D"=
2">1) Submitted occ hwmon driver to openbmc as kernel patch. Git pull reque=
sted get reviewed by kernel developer Joel.</font><br><font size=3D"2">2) F=
ixed the style issue and re-submitted the patch to openbmc/linux</font><br>=
3) Setup 3 OpenBMC-automation environment in different HW environment. They=
 can run with some errors. Still investigate how to solve these errors. <br=
>4) Finished the study on boot options and sdbus communication method. Made=
 the DBUS demo code available in IPMID code and ran it with qemu.<br>&nbsp;

<div dir=3D"ltr">Todo:<br>1) <font size=3D"2">Add hwmon dbus interface for =
occ sensors</font><br><font size=3D"2">2) Implement set user power cap func=
tion.</font><br>3) Discuss with Adriana about the definition of DBUS proper=
ties on boot options. <br>4) Implement set/get boot options function. <br>5=
) Study dbus services/objects mapper invoke method in C code. <br><br>Regar=
ds,<br></div><span><br>=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94<br>Dr. Jiang Yu (=E4=BD=99=E6=B1=9F) PMP=C2=AE<br>OpenPower Application=
 Engineer<br>IBM GCG Systems &amp; Technology Group Lab<br><br>Tel: (86-21)=
6092-2872<br>T/L:&nbsp;&nbsp;11-90-22872<br>Fax:&nbsp;&nbsp;86-21-60922200<=
br>E-Mail: <a href=3D"mailto:jiangyu@cn.ibm.com">jiangyu@cn.ibm.com</a></sp=
an></font><BR>
