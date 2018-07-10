Return-Path: <hramasub@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hramasub@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PxX75m8yzDrcK
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 19:21:07 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6A9J7r4076083
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 05:21:06 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2k4s1m54yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 05:21:05 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 10 Jul 2018 09:21:05 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 10 Jul 2018 09:21:02 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.6.12])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2018071009210132-308036 ;
 Tue, 10 Jul 2018 09:21:01 +0000 
In-Reply-To: <57babd9a-22fd-093f-3edd-214642e0a016@linux.vnet.ibm.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: IPMI and Redfish support in openbmc Linux
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Tue, 10 Jul 2018 14:51:01 +0530
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
 <57babd9a-22fd-093f-3edd-214642e0a016@linux.vnet.ibm.com>
X-KeepSent: CA608E26:3D7FF9BB-652582C6:00327BAF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 51907
X-TNEFEvaluated: 1
x-cbid: 18071009-7581-0000-0000-000008255FA6
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.4332; 
 ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00009343; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01059232; UDB=6.00543607; IPR=6.00837153; 
 BA=6.00006041; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022083; XFM=3.00000015;
 UTC=2018-07-10 09:21:04
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-07-10 09:19:31 - 6.00008683
x-cbparentid: 18071009-7582-0000-0000-00001DC26312
Message-Id: <OFCA608E26.3D7FF9BB-ON652582C6.00327BAF-652582C6.00335CBE@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0032F901652582C6_="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-10_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2018 09:21:12 -0000


--=_alternative 0032F901652582C6_=
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

"openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org> wrote on=
=20
07/10/2018 02:04:49 PM:


>=20
> But I couldn't access Redfish API through the below command.
> curl -b cjar -k https://10.99.241.79/redvish/v1/
>=20

1) Looks like you have a typo in the URI : It must be redfish and not=20
redvish ?
2) Also try removing the trailing forward slash : redfish/v1 instead of=20
redfish/v1/
3) Is the service running in the standard 443 port ? If not append the=20
port number to the IP in the URI.

-Hari !


--=_alternative 0032F901652582C6_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><tt><font size=3D2>&quot;openbmc&quot; &lt;openbmc-bounces+hramasub=3Di=
n.ibm.com@lists.ozlabs.org&gt;
wrote on 07/10/2018 02:04:49 PM:<br><br></font></tt><br><tt><font size=3D2>=
&gt; <br>&gt; But I couldn't access Redfish API through the below command.<=
/font></tt><br><tt><font size=3D2>&gt; curl -b cjar -k </font></tt><a href=
=3Dhttps://10.99.241.79/redvish/v1/><tt><font size=3D2>https://10.99.241.79=
/redvish/v1/</font></tt></a><br><tt><font size=3D2>&gt; <br></font></tt><br=
><tt><font size=3D2>1) Looks like you have a typo in the URI : It must
be redfish and not redvish ?</font></tt><br><tt><font size=3D2>2) Also try =
removing the trailing forward slash :
redfish/v1 instead of redfish/v1/</font></tt><br><tt><font size=3D2>3) Is t=
he service running in the standard 443 port
? If not append the port number to the IP in the URI.</font></tt><br><br><t=
t><font size=3D2>-Hari !</font></tt><BR>
--=_alternative 0032F901652582C6_=--
