Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="FMz3OgoM"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 441hCQ61vYzDqcm
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 18:12:15 +1100 (AEDT)
Received: from cpsps-ews06.kpnxchange.com ([10.94.84.173]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Sat, 16 Feb 2019 08:12:10 +0100
X-Brand: 7abm2Q==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e2=11;e3=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=GcnGYjfL c=1 sm=1 tr=0
 a=O9TprTQLaYRVp1+k5WUGuw==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=xqWC_Br6kY4A:10 a=CFTnQlWoA9kA:10 a=QyXUC8HyAAAA:8
 a=c9EktyYcTDotxIfWH3YA:9 a=CjuIK1q_8ugA:10 a=RFb2gjqhYFZ-8m_d:21
 a=_W_S_7VecoQA:10 a=frz4AuCg-hUA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT107.kpnxchange.com ([195.121.3.23]) by
 cpsps-ews06.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Sat, 16 Feb 2019 08:12:10 +0100
Content-Language: nl-NL
Content-Type: multipart/alternative;
 boundary="_000_cd91d486012d4176870160245acfa4e9emailandroidcom_"
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550301130;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=4fEhb45/lGcVhNqs5qaiQaTpKuoS3eb7g0/M/egcJFQ=;
 b=FMz3OgoMibcxOvpFWOV+VmXJYkzLmQA2Y+u3JyPQrmyC7gexa3iqx9tnGgXhcWw2bPc5BmYdL2e
 Iv+LtRwDUz4QSPWz0A6lt5xRVea+bdVaxw6AbJQQyAetZPWwucABNo2qT4LocCCNHv4UBKJVZzOFn
 LbTuJ/pDNzJo4sepU5g=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT107.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Sat, 16 Feb 2019 08:12:10 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Sat, 16 Feb
 2019 08:11:47 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Sat, 16 Feb 2019 08:11:47 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: James Feist <james.feist@linux.intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLAAJ7nwAABUSLHM=
Date: Sat, 16 Feb 2019 07:11:46 +0000
Message-ID: <cd91d486-012d-4176-8701-60245acfa4e9@email.android.com>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>,
 <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
In-Reply-To: <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Feb 2019 07:12:10.0752 (UTC)
 FILETIME=[EF2D8000:01D4C5C6]
X-RcptDomain: lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2019 07:12:22 -0000

--_000_cd91d486012d4176870160245acfa4e9emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello James,

Thanks. This indeed causes the driver to load.

Best regards,

Wim Vervoorn

Op 15 feb. 2019 11:09 p.m. schreef James Feist <james.feist@linux.intel.com=
>:
On 2/15/19 8:31 AM, Wim Vervoorn wrote:
> I noticed that the facebook-tiogapass.dts has the items for kcs2 and 3 in=
cluded while the s2600wf.dts doesn't assign addresses for these devices (le=
aving the kcs_addr at 0 causing the driver not to load).
>
> I this intentional and do start the driver in another way or should I cha=
nge the dts?

The dts needs to have the kcs nodes added. This hasn't been upstreamed
yet. Should look like:

  +&kcs3 {
  +   kcs_addr =3D <0xCA2>;
  +   status =3D "okay";
  +};
  +
  +&kcs4 {
  +   kcs_addr =3D <0xCA4>;
  +   status =3D "okay";
  +};



Thanks,

James






--_000_cd91d486012d4176870160245acfa4e9emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Hello James,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks. This indeed causes the driver to load.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Best regards,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Wim Vervoorn</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Op 15 feb. 2019 11:09 p.m. schreef James Feist=
 &lt;james.feist@linux.intel.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 2/15/19 8:31 AM, Wim Vervoorn wrote:<br>
&gt; I noticed that the facebook-tiogapass.dts has the items for kcs2 and 3=
 included while the s2600wf.dts doesn't assign addresses for these devices =
(leaving the kcs_addr at 0 causing the driver not to load).<br>
&gt; <br>
&gt; I this intentional and do start the driver in another way or should I =
change the dts?<br>
<br>
The dts needs to have the kcs nodes added. This hasn't been upstreamed <br>
yet. Should look like:<br>
<br>
&nbsp; &#43;&amp;kcs3 {<br>
&nbsp; &#43;&nbsp;&nbsp; kcs_addr =3D &lt;0xCA2&gt;;<br>
&nbsp; &#43;&nbsp;&nbsp; status =3D &quot;okay&quot;;<br>
&nbsp; &#43;};<br>
&nbsp; &#43;<br>
&nbsp; &#43;&amp;kcs4 {<br>
&nbsp; &#43;&nbsp;&nbsp; kcs_addr =3D &lt;0xCA4&gt;;<br>
&nbsp; &#43;&nbsp;&nbsp; status =3D &quot;okay&quot;;<br>
&nbsp; &#43;};<br>
<br>
<br>
<br>
Thanks,<br>
<br>
James<br>
<br>
<br>
<br>
<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_cd91d486012d4176870160245acfa4e9emailandroidcom_--
