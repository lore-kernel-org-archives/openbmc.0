Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yDTCr4vcszDqv8
 for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2017 13:33:27 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9E2TPeE033689
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 22:33:24 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dk0j79rnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 22:33:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 14 Oct 2017 02:33:23 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 14 Oct 2017 02:33:21 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2017101402332103-2246842 ;
 Sat, 14 Oct 2017 02:33:21 +0000 
To: "Simon Glass" <sjg@chromium.org>
In-Reply-To: <OFF0AEFDA9.8819F371-ON002581B8.007FA002@LocalDomain>
Date: Sat, 14 Oct 2017 02:33:21 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: Call for maintainers
Cc: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.20 Build 201710061038_30 on behalf of device with
 id
 H7J...M0O, type 450 (ios) and description iPhone 6:Apple-iPhone7C2/1501.421
 (OS 11)
X-KeepSent: 63DDCE9F:99DF1057-002581B9:000E0A44;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 7311
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary=Apple-Mail-E0A05F91-7E33-4E0E-9DF6-39941A472417
x-cbid: 17101402-3815-0000-0000-000002EA6270
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410169; ST=0; TS=0; UL=0; ISC=; MB=0.141770
X-IBM-SpamModules-Versions: BY=3.00007894; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00930821; UDB=6.00468606; IPR=6.00711085; 
 BA=6.00005636; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017535; XFM=3.00000015;
 UTC=2017-10-14 02:33:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-13 22:25:57 - 6.00007456
x-cbparentid: 17101402-3816-0000-0000-0000A406ACE9
Message-Id: <OF63DDCE9F.99DF1057-ON002581B9.000E0A44-1507948401492@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-13_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2017 02:33:29 -0000


--Apple-Mail-E0A05F91-7E33-4E0E-9DF6-39941A472417
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Simon.  The goal is to stay as close to master as we can.  We=E2=80=99ve=
 done a better job at proving that with our 4.3-4.7-4.10 kernel and 1.7-1.8=
-2.2 yocto upgrades over the last 1.5 years then with our u-boot. =20

I know we would like to move up on U-Boot and the reason we have not is sim=
ply a lack people power. =20

I=E2=80=99m sure we can figure out a cadence that would work for you.=20

Sent from my iPhone

> On Oct 13, 2017, at 6:14 PM, Simon Glass <sjg@chromium.org> wrote:
>=20
> Hi Chris,
>=20
>> On 9 October 2017 at 19:04, Chris Austen <austenc@us.ibm.com> wrote:
>>=20
>> Greetings,
>>=20
>> I received some feedback that people would like to know more about what =
it takes to become, and duties of, a Maintainer in OpenBMC.
>>=20
>> A Maintainer is a lead position in the project who is intrusted with arc=
hitecture and stability. In return you will have a say in the future archit=
ecture.
>>=20
>> Steps to get there...
>>=20
>> 1) Pick a project repository that you have matured
>> 2) Sign up for reviews in that repository without being asked
>> 3) provide comments that correctly shape the goals of the repository
>> 4) Be on architecture calls to learn from others
>> 5) Contribute code
>> 6) Contribute socially (IRC, mailing list feedback, writing articles tha=
t end up on /. , etc)
>>=20
>=20
> I might be interested in being U-Boot maintainer.
>=20
> But I'd like to understand how close to upstream you plan to be? Will
> you select a U-Boot release and stick with it for a year or more, or
> will you try to target each U-Boot release (currently every two
> months)?
>=20
> For U-Boot specifically you could cc the U-Boot mailing list and see
> if anyone else is interested there.
>=20
> Regards,
> Simon
>=20


--Apple-Mail-E0A05F91-7E33-4E0E-9DF6-39941A472417
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto">Hi Simon. &nbsp;The goal is to stay as =
close to master as we can. &nbsp;We=E2=80=99ve done a better job at proving=
 that with our 4.3-4.7-4.10 kernel and 1.7-1.8-2.2 yocto upgrades over the =
last 1.5 years then with our u-boot. &nbsp;<div><br></div><div>I know we wo=
uld like to move up on U-Boot and the reason we have not is simply a lack p=
eople power. &nbsp;</div><div><br></div><div>I=E2=80=99m sure we can figure=
 out a cadence that would work for you.&nbsp;<br><br><div id=3D"AppleMailSi=
gnature">Sent from my iPhone</div><div><br>On Oct 13, 2017, at 6:14 PM, Sim=
on Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; w=
rote:<br><br></div><blockquote type=3D"cite"><div><span>Hi Chris,</span><br=
><span></span><br><span>On 9 October 2017 at 19:04, Chris Austen &lt;<a hre=
f=3D"mailto:austenc@us.ibm.com">austenc@us.ibm.com</a>&gt; wrote:</span><br=
><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=
=3D"cite"><span>Greetings,</span><br></blockquote><blockquote type=3D"cite"=
><span></span><br></blockquote><blockquote type=3D"cite"><span>I received s=
ome feedback that people would like to know more about what it takes to bec=
ome, and duties of, a Maintainer in OpenBMC.</span><br></blockquote><blockq=
uote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>A Maintainer is a lead position in the project who is intrusted with =
architecture and stability. In return you will have a say in the future arc=
hitecture.</span><br></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><span>Steps to get there...</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span>1) Pick a project repository that you have ma=
tured</span><br></blockquote><blockquote type=3D"cite"><span>2) Sign up for=
 reviews in that repository without being asked</span><br></blockquote><blo=
ckquote type=3D"cite"><span>3) provide comments that correctly shape the go=
als of the repository</span><br></blockquote><blockquote type=3D"cite"><spa=
n>4) Be on architecture calls to learn from others</span><br></blockquote><=
blockquote type=3D"cite"><span>5) Contribute code</span><br></blockquote><b=
lockquote type=3D"cite"><span>6) Contribute socially (IRC, mailing list fee=
dback, writing articles that end up on /. , etc)</span><br></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><span></span><br><span=
>I might be interested in being U-Boot maintainer.</span><br><span></span><=
br><span>But I'd like to understand how close to upstream you plan to be? W=
ill</span><br><span>you select a U-Boot release and stick with it for a yea=
r or more, or</span><br><span>will you try to target each U-Boot release (c=
urrently every two</span><br><span>months)?</span><br><span></span><br><spa=
n>For U-Boot specifically you could cc the U-Boot mailing list and see</spa=
n><br><span>if anyone else is interested there.</span><br><span></span><br>=
<span>Regards,</span><br><span>Simon</span><br><span></span><br></div></blo=
ckquote></div><BR>
</body></html>

--Apple-Mail-E0A05F91-7E33-4E0E-9DF6-39941A472417--
