Return-Path: <austenc@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AF9E41A06AF
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 10:09:34 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 12 Jan 2016 16:09:32 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 12 Jan 2016 16:09:30 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 60DAB19D8041
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:57:31 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0CN9TVv7667952
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 23:09:29 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0CN9TlC006112
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 18:09:29 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0CN9SAg005900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 18:09:28 -0500
Message-Id: <201601122309.u0CN9SAg005900@d01av04.pok.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 12 Jan 2016 18:09:28 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 12 Jan 2016 18:09:26 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 12 Jan 2016 23:09:25 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Jan 2016 23:09:23 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016011223100405-526163 ;
 Tue, 12 Jan 2016 23:10:04 +0000 
In-Reply-To: 
Subject: Automated test migration
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 12 Jan 2016 23:09:22 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 40551
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16011223-0005-0000-0000-00001B613F44
X-IBM-ISS-SpamDetectors: Score=0.431006; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.431006; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004780; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000131; SDB=6.00644402; UDB=6.00290526; UTC=2016-01-12
 23:09:24
x-cbparentid: 16011223-4778-0000-0000-0000018C2965
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
X-List-Received-Date: Tue, 12 Jan 2016 23:09:35 -0000

 I've known for a while that we would eventually move the automated test su=
ites from https://github.com/mkumatag/openbmc-automation to https://github.=
com/openbmc/openbmc-test-automation.=C2=A0 That day came yesterday.=C2=A0 M=
anjuanth and I have adhered to code review principals making sure that we n=
ever merged without the others review.=C2=A0 However I will admit the commi=
t message and the amount of commits per pull request was not my top priorit=
y.=C2=A0 To be honest just getting to the state where dev and test were dev=
eloping code in the same sprint was good enough, all other things be damned=
.=C2=A0 Now I see there are a lot of review comments aimed at the style of =
committing.=C2=A0=20

So now we are at a junction.=C2=A0 Should I ask Manjuanth to stop test auto=
mation development to work on squashing logical commits or should I keep hi=
m working on automating the code we are developing.=C2=A0 I certainly under=
stand the need for a git history that tells the story.=C2=A0 It also makes =
sense to read commit best practices as those listed by Stewart and Patrick =
and become better developers for it.

I ask is there anything that would put a hold on merging the pull request a=
s is?=C2=A0 I do need a response from those with comments as you are the on=
es that put the time and effort in to reviewing it in the first place.=C2=
=A0=20



Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)
