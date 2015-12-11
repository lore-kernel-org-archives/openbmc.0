Return-Path: <anoo@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 955FA1A1053
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2015 09:43:48 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 11 Dec 2015 17:43:45 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Dec 2015 17:43:42 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id B56726E8047
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2015 17:31:50 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBBMhfTd30343186
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2015 22:43:41 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBBMejWo010785
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2015 17:40:45 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBBMebUg010413
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2015 17:40:38 -0500
Message-Id: <201512112240.tBBMebUg010413@d01av05.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 11 Dec 2015 15:43:31 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 11 Dec 2015 15:43:28 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 11 Dec 2015 22:43:27 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 11 Dec 2015 22:43:25 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015121122443543-458633 ;
 Fri, 11 Dec 2015 22:44:35 +0000 
To: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Error inject from OS
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 11 Dec 2015 16:43:25 -0600
MIME-Version: 1.0
X-KeepSent: 80A82A5D:08C91F66-86257F18:007C7990;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 58655
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 007CD30E86257F18_="
x-cbid: 15121122-0041-0000-0000-000002B4C620
X-IBM-ISS-SpamDetectors: Score=0.439231; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004657; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000124; SDB=6.00629361; UDB=6.00281401; UTC=2015-12-11
 22:43:26
x-cbparentid: 15121122-5938-0000-0000-000001491DD2
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
X-List-Received-Date: Fri, 11 Dec 2015 22:43:49 -0000


--=_alternative 007CD30E86257F18_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Last week we mentioned we wanted to get from Feroz the procedure to inject =

an error via putscom from the OS. Here is his reply:


You will need to download xscom-utils from=20
https://github.com/open-power/skiboot/tree/master/external/xscom-utils and =

compile it on the host.

1) on Host os download the skiboot code with the following command=20
git clone git://git.linux.ibm.com/skiboot/skiboot.git=20

2) cd skiboot/external/xscom-utils=20

3) compile the code --> "make" to get putscom and getscom binaries

Usages:
usage: getscom [-c|--chip chip-id] addr
       getscom -l|--list-chips
       getscom -v|--version

usage: putscom [-c|--chip chip-id] addr value
       putscom -v|--version

4) find out the chip and core details=20
cat /sys/firmware/opal/msglog | grep Chip | grep Core=20

5) Before you get/set any scom addresses you will need to query for chip=20
ids as below:

$ getscom -l
Chip ID  | Rev   | Chip type
---------|-------|--------
00000008 | DD2.0 | P8 (Venice) processor
00000000 | DD2.0 | P8 (Venice) processor


6. Once you get chip id's you will then be able to issue set/get on scom=20
addresses for chip ids.
    e.g.
        # Prim/Secondary Master/Slave Status Register (TOD Status=20
Register)
        [root@fir01 xscom-utils]# ./getscom -c 0x8 0x00040008
        6663d0c00000000
        [root@fir01 xscom-utils]# ./getscom -c 0x0 0x00040008
        6663d0c00000000
=20
        [root@fir01 xscom-utils]# ./putscom -c 0x0 0x40000 0x0=20
        0



--=_alternative 007CD30E86257F18_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Last week we mentioned we wanted to get
from Feroz the procedure to inject an error via putscom from the OS. Here
is his reply:</font><br><br><br><font size=3D2 face=3D"sans-serif">You will=
 need to download xscom-utils
from </font><a href=3D"https://github.com/open-power/skiboot/tree/master/ex=
ternal/xscom-utils"><font size=3D2 color=3Dblue face=3D"sans-serif">https:/=
/github.com/open-power/skiboot/tree/master/external/xscom-utils</font></a><=
font size=3D2 face=3D"sans-serif">and compile it on the host.</font><br><br=
><font size=3D2 face=3D"sans-serif">1) on Host os download the skiboot code
with the following command </font><br><font size=3D2 face=3D"sans-serif">gi=
t clone git://git.linux.ibm.com/skiboot/skiboot.git
</font><br><br><font size=3D2 face=3D"sans-serif">2) cd skiboot/external/xs=
com-utils </font><br><br><font size=3D2 face=3D"sans-serif">3) compile the =
code --&gt; &quot;make&quot;
to get putscom and getscom binaries</font><br><br><font size=3D2 face=3D"sa=
ns-serif">Usages:</font><br><font size=3D2 face=3D"sans-serif">usage: getsc=
om [-c|--chip chip-id] addr</font><br><font size=3D2 face=3D"sans-serif">&n=
bsp; &nbsp; &nbsp; &nbsp;getscom -l|--list-chips</font><br><font size=3D2 f=
ace=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;getscom -v|--version</font><b=
r><br><font size=3D2 face=3D"sans-serif">usage: putscom [-c|--chip chip-id]=
 addr
value</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nb=
sp;putscom -v|--version</font><br><br><font size=3D2 face=3D"sans-serif">4)=
 find out the chip and core details
</font><br><font size=3D2 face=3D"sans-serif">cat /sys/firmware/opal/msglog=
 | grep
Chip | grep Core </font><br><br><font size=3D2 face=3D"sans-serif">5) Befor=
e you get/set any scom addresses
you will need to query for chip ids as below:</font><br><br><font size=3D2 =
face=3D"sans-serif">$ getscom -l</font><br><font size=3D2 face=3D"sans-seri=
f">Chip ID &nbsp;| Rev &nbsp; | Chip type</font><br><font size=3D2 face=3D"=
sans-serif">---------|-------|--------</font><br><font size=3D2 face=3D"san=
s-serif">00000008 | DD2.0 | P8 (Venice) processor</font><br><font size=3D2 =
face=3D"sans-serif">00000000 | DD2.0 | P8 (Venice) processor</font><br><br>=
<br><font size=3D2 face=3D"sans-serif">6. Once you get chip id's you will t=
hen
be able to issue set/get on scom addresses for chip ids.</font><br><font si=
ze=3D2 face=3D"sans-serif">&nbsp; &nbsp; e.g.</font><br><font size=3D2 face=
=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; #
Prim/Secondary Master/Slave Status Register (TOD Status Register)</font><br=
><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [root@fir01
xscom-utils]# ./getscom -c 0x8 0x00040008</font><br><font size=3D2 face=3D"=
sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; 6663d0c00000000</font><br><font siz=
e=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [root@fir01
xscom-utils]# ./getscom -c 0x0 0x00040008</font><br><font size=3D2 face=3D"=
sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; 6663d0c00000000</font><br><font siz=
e=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; </font><br><font size=
=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [root@fir01
xscom-utils]# ./putscom -c 0x0 0x40000 0x0 </font><br><font size=3D2 face=
=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; 0</font><br><BR>
--=_alternative 007CD30E86257F18_=--
