Return-Path: <anoo@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqvFP5cMmzDqZd
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 06:51:53 +1000 (AEST)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 20 Apr 2016 14:51:51 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 14:51:50 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 210BA1FF001E
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 14:51:35 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KKpnnk33554608
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 13:51:49 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KKpnP1012132
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 14:51:49 -0600
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KKpncl012123
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 14:51:49 -0600
Message-Id: <201604202051.u3KKpncl012123@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 20 Apr 2016 14:51:49 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Apr 2016 14:51:47 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 20 Apr 2016 20:51:46 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Apr 2016 20:51:43 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016042020514261-444605 ;
 Wed, 20 Apr 2016 20:51:42 +0000 
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: FRU VPD - MAC and UUID
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 20 Apr 2016 15:51:43 -0500
MIME-Version: 1.0
X-KeepSent: B23763B7:CABAD2D0-86257F9B:00715B3A;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 47391
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 007298A586257F9B_="
x-cbid: 16042020-0021-0000-0000-00003BEE65C0
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.049475; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005181; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000160; SDB=6.00690933; UDB=6.00318443; UTC=2016-04-20
 20:51:44
x-cbparentid: 16042020-4778-0000-0000-000005E76C46
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
X-List-Received-Date: Wed, 20 Apr 2016 20:51:54 -0000


--=_alternative 007298A586257F9B_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Mfg will be storing the MAC address and UUID of the Barreleye system in=20
the FRU VPD so that we can persist it better. Couple questions:

1. The UUID is planned to be stored in the motherboard VPD. Anybody has=20
the info on which eeprom is the motherboard VPD? Seems the only chips=20
under /sys/bus/i2c/devices/ with vpd are the ones from the i/o, expander,=20
and hdd cards (0-0050, 6-0055, 6-0051).

2. The MAC is planned to be stored at the end of the i/o board VPD. All of =

the FRU VPD follow the format of=20
header->chassis=5Finfo->board=5Finfo->product=5Finfo. The header contains t=
he=20
offset to the *=5Finfo areas. Without an offset to the MAC (which would be =

stored after the product=5Finfo area), we could just read passed the=20
product=5Farea and if it's not 0s, assume it's the MAC. Would it be better =

to ask Mfg to add the offset to the MAC to header although this breaks the =

IPMI formatting, or get the MAC into one of the custom fields inside the=20
product info area. Thoughts?


--=_alternative 007298A586257F9B_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Mfg will be storing the MAC address and
UUID of the Barreleye system in the FRU VPD so that we can persist it bette=
r.
Couple questions:</font><br><br><font size=3D2 face=3D"sans-serif">1. The U=
UID is planned to be stored
in the motherboard VPD. Anybody has the info on which eeprom is the motherb=
oard
VPD? Seems the only chips under /sys/bus/i2c/devices/ with vpd are the
ones from the i/o, expander, and hdd cards (0-0050, 6-0055, 6-0051).</font>=
<br><br><font size=3D2 face=3D"sans-serif">2. The MAC is planned to be stor=
ed at
the end of the i/o board VPD. All of the FRU VPD follow the format of heade=
r-&gt;chassis=5Finfo-&gt;board=5Finfo-&gt;product=5Finfo.
The header contains the offset to the *=5Finfo areas. Without an offset to
the MAC (which would be stored after the product=5Finfo area), we could just
read passed the product=5Farea and if it's not 0s, assume it's the MAC. Wou=
ld
it be better to ask Mfg to add the offset to the MAC to header although
this breaks the IPMI formatting, or get the MAC into one of the custom
fields inside the product info area. Thoughts?</font><BR>
--=_alternative 007298A586257F9B_=--
