Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zPQV3bHbzDqNk
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 00:58:57 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1CDtr8E132258
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 08:58:55 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qkww9ma7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 08:58:55 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Tue, 12 Feb 2019 13:58:54 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Feb 2019 13:58:51 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019021213585116-541806 ;
 Tue, 12 Feb 2019 13:58:51 +0000 
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Subject: Re: Secure boot for BMC
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Tue, 12 Feb 2019 19:28:51 +0530
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
MIME-Version: 1.0
X-KeepSent: 92324BB0:102A5073-0025839F:004C43BD;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 62395
X-TNEFEvaluated: 1
x-cbid: 19021213-9717-0000-0000-00000B01663B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.046680
X-IBM-SpamModules-Versions: BY=3.00010583; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01159998; UDB=6.00605394; IPR=6.00940550; 
 BA=6.00006229; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025545; XFM=3.00000015;
 UTC=2019-02-12 13:58:53
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-02-12 13:00:53 - 6.00009577
x-cbparentid: 19021213-9718-0000-0000-0000438D73B1
Message-Id: <OF92324BB0.102A5073-ON0025839F.004C43BD-6525839F.004CCCA3@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 004C61E26525839F_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Tue, 12 Feb 2019 13:58:59 -0000


--=_alternative 004C61E26525839F_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

From:   Brad Bishop <bradleyb@fuzziesquirrel.com>
To:     openbmc@lists.ozlabs.org
Date:   02/05/2019 07:44 PM
Subject:        Secure boot for BMC
Sent by:        "openbmc"=20
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>



Hi everyone

Does anyone have plans to provide a secure BMC boot implementation to
OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
all wants to collaborate on this before I submit a design template.

thx - brad



> I'm interested in secureboot discussion.

> Thnx- George


--=_alternative 004C61E26525839F_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Brad
Bishop &lt;bradleyb@fuzziesquirrel.com&gt;</span><br><span style=3D" font-s=
ize:9pt;color:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">openbmc@lists.ozlabs.org</span><br><span style=3D" font-size:9=
pt;color:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">02/05/2019
07:44 PM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Secure
boot for BMC</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-fam=
ily:sans-serif">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-fa=
mily:sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</span><br><h=
r noshade><br><br><br><tt><span style=3D" font-size:10pt">Hi everyone<br><b=
r>Does anyone have plans to provide a secure BMC boot implementation to<br>=
OpenBMC in the 2.7 or 2.8 timeframe? &nbsp;Just trying to get a feel for
who<br>all wants to collaborate on this before I submit a design template.<=
br><br>thx - brad<br><br></span></tt><br><br><span style=3D" font-size:10pt=
;font-family:sans-serif">&gt; I'm interested
in secureboot discussion.</span><br><br><span style=3D" font-size:10pt;font=
-family:sans-serif">&gt; Thnx- George</span><BR>
--=_alternative 004C61E26525839F_=--
