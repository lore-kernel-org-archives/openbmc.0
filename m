Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D328F1A027B
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 15:06:20 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 9 Nov 2015 23:06:17 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 9 Nov 2015 23:06:16 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id A68A2C90042
 for <openbmc@lists.ozlabs.org>; Mon,  9 Nov 2015 22:54:25 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAA46FIp57081904
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 04:06:15 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAA44hJQ020940
 for <openbmc@lists.ozlabs.org>; Mon, 9 Nov 2015 23:04:43 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAA44hkq020926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 9 Nov 2015 23:04:43 -0500
Message-Id: <201511100404.tAA44hkq020926@d01av05.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 9 Nov 2015 23:06:14 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 9 Nov 2015 23:06:13 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 10 Nov 2015 04:06:12 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 10 Nov 2015 04:06:09 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015111004063281-7343 ;
 Tue, 10 Nov 2015 04:06:32 +0000 
In-Reply-To: 
Subject: FRU VPD writer available
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 10 Nov 2015 04:06:07 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_10262015_FP2 November 02, 2015
X-LLNOutbound: False
X-Disclaimed: 15967
X-TNEFEvaluated: 1
Content-Type: multipart/mixed; boundary="=_mixed 001688B300257EF9_="
x-cbid: 15111004-0041-0000-0000-00000249656B
X-IBM-ISS-SpamDetectors: Score=0.40304; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.40304; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004584; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00615215; UDB=6.00272367; UTC=2015-11-10
 04:06:10
x-cbparentid: 15111004-9900-0000-0000-000004D89404
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
X-List-Received-Date: Tue, 10 Nov 2015 04:06:21 -0000


--=_mixed 001688B300257EF9_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >In our quest to find a =
fru vpd write I found this working version.&nbsp; By default it writes the =
VPD in 6bit ascii.&nbsp; If Hari's parser accepts that then it can be run w=
ithout modifications.&nbsp; I also made a simple change to get 8bit ascii t=
o work too.&nbsp; The example file they have is really straight forward.&nb=
sp; MFG just needs to update the correct key value pair and it will build i=
t.&nbsp; MIT licensed.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hari can you run the different bin files through the pars=
er and see if it will accept 6bit ascii.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div><span style=3D"font-family:courier new,courier,monos=
pace;" >[bia]</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >mfg=5Fdate=
time=3D10213275</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >manufactur=
er=3DMANUFACTURER</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >product=5F=
name=3DPRODUCT=5FNAME</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >serial=5Fn=
umber=3D123456</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >part=5Fnum=
ber=3D1234567890</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >board=5Fcu=
stom=5F1=3DABCD</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/mandeepsandhu/ipmi-fru-it" =
>https://github.com/mandeepsandhu/ipmi-fru-it</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div></div>
<BR>
--=_mixed 001688B300257EF9_=
Content-Type: application/octet-stream; name="FRU.bin"
Content-Disposition: attachment; filename="FRU.bin"
Content-Transfer-Encoding: base64

AQAAAQAAAP4BBgCb15uJbejWZjjStVzKibD8kvVI/27YloWRNFGVBYiRNFGVdWEZBACDoTiSwQQ=


--=_mixed 001688B300257EF9_=
Content-Type: application/octet-stream; name="FRU1.bin"
Content-Disposition: attachment; filename="FRU1.bin"
Content-Transfer-Encoding: base64

AQAAAQAAAP4BCACb15vMTUFOVUZBQ1RVUkVSzFBST0RVQ1RfTkFNRcYxMjM0NTbKMTIzNDU2Nzg5
MADEQUJDRMEAAAAAAADD


--=_mixed 001688B300257EF9_=--
