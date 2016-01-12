Return-Path: <austenc@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6193A1A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 11:21:42 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 11 Jan 2016 17:21:40 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 17:21:37 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id AF90FC40001
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 17:09:47 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C0Lawv28901518
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 00:21:36 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C0LaSt028842
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 19:21:36 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C0Lap7028792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 19:21:36 -0500
Message-Id: <201601120021.u0C0Lap7028792@d01av04.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 11 Jan 2016 19:21:36 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 11 Jan 2016 19:21:33 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 12 Jan 2016 00:21:32 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Jan 2016 00:21:29 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016011200222065-535120 ;
 Tue, 12 Jan 2016 00:22:20 +0000 
In-Reply-To: <877fjf7k3d.fsf@gamma.ozlabs.ibm.com>
Subject: Re: [PATCH openbmc] pflash and linux updates
From: "Chris Austen" <austenc@us.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 12 Jan 2016 00:21:28 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <877fjf7k3d.fsf@gamma.ozlabs.ibm.com>,
 <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 24539
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16011200-0021-0000-0000-000016022F90
X-IBM-ISS-SpamDetectors: Score=0.440876; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.440876; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004778; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000131; SDB=6.00643948; UDB=6.00290257; UTC=2016-01-12
 00:21:30
x-cbparentid: 16011200-5938-0000-0000-0000019977A7
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
X-List-Received-Date: Tue, 12 Jan 2016 00:21:44 -0000

 I hope this comes through as plain text...

We are using the Robottest framework for automated testing.=C2=A0 I would l=
ove some help making the last mile automated.=C2=A0 We have test cases.=C2=
=A0 We have systems.=C2=A0 We have Jenkins.=C2=A0 There is some funny busin=
ess to get the code started (setting up ip addresses, accepting ssh key cha=
nges, copying a helper tool over to the victim box) but after that we are r=
olling.=C2=A0=20

If you are able to help swing a hammer I can provide all the materials you =
need.=20


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: Daniel Axtens=20
Sent by: "openbmc"=20
Date: 01/11/2016 06:04PM
Subject: Re: [PATCH openbmc] pflash and linux updates

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> I've tested on Barreleye

I realise this might be a bit optimistic, but do we have any automated
(or even semi-automated) testing for existing machine types?

If not, I'm happy to start chipping away at little bits of it.

Regards,
Daniel

>
> https://github.com/openbmc/openbmc/pull/130
>
> Chris Austen (1):
> =C2=A0 pflash and linux updates
>
> =C2=A0meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb | 2 +-
> =C2=A0meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb =C2=A0| =
2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> --=20
> 2.6.4
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


[attachment "signature.asc" removed by Chris Austen/Austin/IBM]
