Return-Path: <njames@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0CEC11A047B
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 03:43:37 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 18 Nov 2015 09:43:30 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 Nov 2015 09:43:28 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 7BFAC3E4003E
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 09:43:23 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAIGdq9p7143810
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 09:39:52 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAIGhNVt017240
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 09:43:23 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAIGhLAG016977
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 09:43:21 -0700
Message-Id: <201511181643.tAIGhLAG016977@d03av04.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 18 Nov 2015 11:43:17 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 18 Nov 2015 11:43:13 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 18 Nov 2015 16:43:09 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 18 Nov 2015 16:42:19 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015111816421464-342399 ;
 Wed, 18 Nov 2015 16:42:14 +0000 
In-Reply-To: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
Subject: Re: Supporting new flash in pflash
To: Joel Stanley <joel@jms.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Wed, 18 Nov 2015 10:32:16 -0600
References: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
X-KeepSent: 67413CAF:8A668914-86257F01:005AAA3C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 4619
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC"
x-cbid: 15111816-0013-0000-0000-00001A5616CF
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133212; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004597; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00619222; UDB=6.00274793; UTC=2015-11-18
 16:42:30
x-cbparentid: 15111816-5090-0000-0000-000005E0C3F6
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
X-List-Received-Date: Wed, 18 Nov 2015 16:43:39 -0000

--0__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC
Content-type: multipart/alternative; 
	Boundary="1__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC"


--1__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


I used a flash chip that pflash does recognize and it fails with this:

root@barreleye:~# pflash -b -i
LIBFLASH: Failed to set controller 4b mode
LIBFLASH: Flash configuration failed
Failed to open flash chip

It is like the BMC is holding it hostage?



Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Joel Stanley <joel@jms.id.au>
To:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	11/18/2015 12:54 AM
Subject:	Supporting new flash in pflash
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



Hi Ben,

On the barreleye BMC we have a 32MB flash. I can pflash -i the system
pnor, but when I attempt to look at the BMC flash, It errors out.

u-boot indicated that it's a 0x20ba19, so I added this to the flash=5Finfo
table.

+       { 0x20ba19, 0x02000000, FL=5FERASE=5F4K  | FL=5FERASE=5F64K | FL=5F=
CAN=5F4B |
+                                FL=5FERASE=5FBULK | FL=5FMICRON=5FBUGS,
+                                                          "Micron
N25Q256A"    },

However this fails:

root@barreleye:~# ./pflash -i -b
LIBFLASH: Failed to set controller 4b mode
LIBFLASH: Flash configuration failed
Failed to open flash chip

Do you have any ideas?

Cheers,

Joel
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>I used a flash chip that pflash does recognize and it fails =
with this:<br><br>root@barreleye:~# pflash -b -i<br>LIBFLASH: Failed to set=
 controller 4b mode<br>LIBFLASH: Flash configuration failed<br>Failed to op=
en flash chip<br><br>It is like the BMC is holding it hostage?<br><br><br><=
br>Regards,<br>Norman James<br>IBM - POWER Systems Architect<br>Phone: 1-51=
2-286-6807 (T/L: 363-6807)<br>Internet: njames@us.ibm.com<br><br><br><img w=
idth=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF592DFC92CAC8f9e8a93df93=
8690918c09B@" border=3D"0" alt=3D"Inactive hide details for Joel Stanley --=
-11/18/2015 12:54:12 AM---Hi Ben, On the barreleye BMC we have a 32MB flash=
. I can pfl"><font color=3D"#424282">Joel Stanley ---11/18/2015 12:54:12 AM=
---Hi Ben, On the barreleye BMC we have a 32MB flash. I can pflash -i the s=
ystem</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font>=
<font size=3D"2">Joel Stanley &lt;joel@jms.id.au&gt;</font><br><font size=
=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">Benjamin Herren=
schmidt &lt;benh@kernel.crashing.org&gt;</font><br><font size=3D"2" color=
=3D"#5F5F5F">Cc:        </font><font size=3D"2">OpenBMC Maillist &lt;openbm=
c@lists.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:  =
      </font><font size=3D"2">11/18/2015 12:54 AM</font><br><font size=3D"2=
" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">Supporting new =
flash in pflash</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:      =
  </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3D=
us.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" ali=
gn=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>Hi Ben,<br><b=
r>On the barreleye BMC we have a 32MB flash. I can pflash -i the system<br>=
pnor, but when I attempt to look at the BMC flash, It errors out.<br><br>u-=
boot indicated that it's a 0x20ba19, so I added this to the flash=5Finfo ta=
ble.<br><br>+ &nbsp; &nbsp; &nbsp; { 0x20ba19, 0x02000000, FL=5FERASE=5F4K =
&nbsp;| FL=5FERASE=5F64K | FL=5FCAN=5F4B |<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;FL=5FERASE=5FBULK | FL=5FMICRON=5FBUGS,<br>+ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Micron<br>N25Q256A&quot; &nbsp; &nbsp;=
},<br><br>However this fails:<br><br>root@barreleye:~# ./pflash -i -b<br>LI=
BFLASH: Failed to set controller 4b mode<br>LIBFLASH: Flash configuration f=
ailed<br>Failed to open flash chip<br><br>Do you have any ideas?<br><br>Che=
ers,<br><br>Joel<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><t=
t><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlab=
s.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC--


--0__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF592DFC92CAC8f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF592DFC92CAC8f9e8a93df938690918c09BBF592DFC92CAC--
