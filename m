Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s09Sr28RSzDqZj
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 09:00:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6RMseCK127582
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 19:00:40 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24edmatcc8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 19:00:40 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 27 Jul 2016 19:00:40 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 27 Jul 2016 19:00:38 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 3BFDD6E803F
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 19:00:18 -0400 (EDT)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6RN0bhk64946238
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 23:00:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB90AE04E
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 19:00:37 -0400 (EDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS id 912D8AE034
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 19:00:37 -0400 (EDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 27 Jul 2016 17:00:36 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 27 Jul 2016 17:00:34 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 27 Jul 2016 23:00:33 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Jul 2016 23:00:31 -0000
X-IBM-Helo: us1a3-smtp04.a3.dal06.isc4sb.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016072723003125-596824 ;
 Wed, 27 Jul 2016 23:00:31 +0000 
MIME-Version: 1.0
In-Reply-To: <63797755-a7e5-b146-dd66-893165a9eb32@kaod.org>
Subject: Re: openbmc qemu vs Cedric qemu is different
To: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Wed, 27 Jul 2016 18:00:33 -0500
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au> <1468577985.954.22.camel@aj.id.au>
 <OF920CED31.64D6B88A-ON86257FF1.00579A2D-86257FF1.0057B9EA@notes.na.collabserv.com>
 <ce634cab-6594-3876-7517-d35bae40bb1d@kaod.org>
 <1469622628.5468.64.camel@aj.id.au>
 <63797755-a7e5-b146-dd66-893165a9eb32@kaod.org>
X-KeepSent: 515F6415:3CCE970F-86257FFD:007E414E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 52315
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE"
x-cbid: 16072723-0056-0000-0000-000000E6B3F3
X-IBM-ISS-SpamDetectors: Score=0.394815; BY=0.107846; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.394815; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005534; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000177; SDB=6.00736358; UDB=6.00345801; UTC=2016-07-27
 23:00:33
x-cbparentid: 16072723-7094-0000-0000-000000AF7B3E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005534; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000177; SDB=6.00736358; UDB=6.00345802; IPR=6.00508953; 
 BA=6.00004625; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012091; XFM=3.00000011;
 UTC=2016-07-27 23:00:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF515F6415.3CCE970F-ON86257FFD.007E414E-86257FFD.007E64AF@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-27_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607270228
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 23:00:44 -0000

--0__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE
Content-type: multipart/alternative; 
	Boundary="1__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE"


--1__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Tested on my servers, great job merging back in to openbmc/qemu.  I've
updated my cheatsheet commit to reflect QEMU operations.


Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)



From:	C=E9dric Le Goater <clg@kaod.org>
To:	Andrew Jeffery <andrew@aj.id.au>, Chris Austen/Austin/IBM@IBMUS
Cc:	Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date:	07/27/2016 07:37 AM
Subject:	Re: openbmc qemu vs Cedric qemu is different



On 07/27/2016 02:30 PM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 12:26 +0200, C=E9dric Le Goater wrote:
>> On 07/15/2016 05:58 PM, Chris Austen wrote:
>>>
>>> Sounds like you have a workable plan. Thank you. The test team will run

>>> off of https://github.com/legoater/qemu  (branch:aspeed) until the
>>> openbmc/qemu gets the needed updates.
>>
>> FYI, I just updated this branch. Changes are :
>>
>>   - rebase on v2.7.0-rc0
>>   - end of n/w support for linux 4.4. the fgtmac100 now uses
>>     the aspeed end of ring buffer bits to be in sync with
>>     linux 4.6
>>   - rework of ast2500 support to remove duplicated code. I should
>>     send to mainline shortly for review.
>
> I've just merged Cedric's work above into openbmc/qemu master. Tested
> with a Palmetto flash image and kernel/rootfs from Witherspoon,
> everything looks good.

Thanks Andrew.

C.

> Chris: Any documentation you have can now point there. Let me know if
> there are any issues.
>
> Cheers,
>
> Andrew
>



--1__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p>Tested on my servers, great job merging back in to openbmc/q=
emu.  I've updated my cheatsheet commit to reflect QEMU operations.<br><br>=
<br>Chris Austen<br>POWER Systems Enablement Manager <br>(512) 286-5184 (T/=
L: 363-5184)<br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09=
BBF56EDFEDC7DE8f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide d=
etails for C=E9dric Le Goater ---07/27/2016 07:37:02 AM---On 07/27/2016 02:=
30 PM, Andrew Jeffery wrote: &gt; On Wed, "><font color=3D"#424282">C=E9dri=
c Le Goater ---07/27/2016 07:37:02 AM---On 07/27/2016 02:30 PM, Andrew Jeff=
ery wrote: &gt; On Wed, 2016-07-27 at 12:26 +0200, C=E9dric Le Goater</font=
><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=
=3D"2">C=E9dric Le Goater &lt;clg@kaod.org&gt;</font><br><font size=3D"2" c=
olor=3D"#5F5F5F">To:        </font><font size=3D"2">Andrew Jeffery &lt;andr=
ew@aj.id.au&gt;, Chris Austen/Austin/IBM@IBMUS</font><br><font size=3D"2" c=
olor=3D"#5F5F5F">Cc:        </font><font size=3D"2">Joel Stanley &lt;joel@j=
ms.id.au&gt;, openbmc@lists.ozlabs.org</font><br><font size=3D"2" color=3D"=
#5F5F5F">Date:        </font><font size=3D"2">07/27/2016 07:37 AM</font><br=
><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2"=
>Re: openbmc qemu vs Cedric qemu is different</font><br><hr width=3D"100%" =
size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt=
>On 07/27/2016 02:30 PM, Andrew Jeffery wrote:<br>&gt; On Wed, 2016-07-27 a=
t 12:26 +0200, C=E9dric Le Goater wrote:<br>&gt;&gt; On 07/15/2016 05:58 PM=
, Chris Austen wrote:<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Sounds like you have =
a workable plan. Thank you. The test team will run <br>&gt;&gt;&gt; off of =
</tt><tt><a href=3D"https://github.com/legoater/qemu">https://github.com/le=
goater/qemu</a></tt><tt>&nbsp; (branch:aspeed) until the <br>&gt;&gt;&gt; o=
penbmc/qemu gets the needed updates.<br>&gt;&gt;<br>&gt;&gt; FYI, I just up=
dated this branch. Changes are :<br>&gt;&gt;<br>&gt;&gt; &nbsp; - rebase on=
 v2.7.0-rc0<br>&gt;&gt; &nbsp; - end of n/w support for linux 4.4. the fgtm=
ac100 now uses <br>&gt;&gt; &nbsp; &nbsp; the aspeed end of ring buffer bit=
s to be in sync with <br>&gt;&gt; &nbsp; &nbsp; linux 4.6 <br>&gt;&gt; &nbs=
p; - rework of ast2500 support to remove duplicated code. I should<br>&gt;&=
gt; &nbsp; &nbsp; send to mainline shortly for review.<br>&gt; <br>&gt; I'v=
e just merged Cedric's work above into openbmc/qemu master. Tested<br>&gt; =
with a Palmetto flash image and kernel/rootfs from Witherspoon,<br>&gt; eve=
rything looks good.<br><br>Thanks Andrew.<br><br>C.<br><br>&gt; Chris: Any =
documentation you have can now point there. Let me know if<br>&gt; there ar=
e any issues.<br>&gt; <br>&gt; Cheers,<br>&gt; <br>&gt; Andrew<br>&gt; <br>=
<br></tt><br><BR>
</body></html>

--1__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE--


--0__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF56EDFEDC7DE8f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF56EDFEDC7DE8f9e8a93df938690918c09BBF56EDFEDC7DE--
