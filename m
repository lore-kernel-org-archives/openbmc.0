Return-Path: <miltonm@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQQWQ0dPlzDq6T
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 09:04:33 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 16 Mar 2016 16:04:31 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Mar 2016 16:04:28 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0513F19D804E
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 15:52:21 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2GM4Qpb42532940
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 15:04:26 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2GM4QtB019849
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 16:04:26 -0600
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2GM4OW5019571
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 16:04:24 -0600
Message-Id: <201603162204.u2GM4OW5019571@d03av02.boulder.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 16 Mar 2016 16:04:24 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 16 Mar 2016 16:04:22 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 16 Mar 2016 22:04:21 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 16 Mar 2016 22:04:20 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016031622041917-465120 ;
 Wed, 16 Mar 2016 22:04:19 +0000 
In-Reply-To: 
Subject: Upstream jffs2 patches
From: "Milton Miller II" <miltonm@us.ibm.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 16 Mar 2016 22:04:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_02292016_FP2 March 07, 2016
X-LLNOutbound: False
X-Disclaimed: 33219
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16031622-0005-0000-0000-00001DD2C946
X-IBM-ISS-SpamDetectors: Score=0.415652; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005045; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000151; SDB=6.00674330; UDB=6.00308580; UTC=2016-03-16
 22:04:21
x-cbparentid: 16031622-5090-0000-0000-000007A38D65
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
X-List-Received-Date: Wed, 16 Mar 2016 22:04:34 -0000

Joel,

Please apply the following upstream fixes to our tree.
All apply as straight cherry-pick.

We have definitive evidence of the problem fixed by
be629 causing the application stack not to run because
the directory went missing.  The next 2 are a deadlock
reported as widely encountered and affecting garbage=20
collection which is required for writes.

The last two affect error paths.

be629c62a603e5935f8177fd8a19e014100a259e=20
=C2=A0=C2=A0 Fix directory hardlinks from deleted directories

157078f64b8a9cd7011b6b900b2f2498df850748=20
=C2=A0=C2=A0 Revert "jffs2: Fix lock acquisition order bug in jffs2=5Fwrite=
=5Fbegin"

49e91e7079febe59a20ca885a87dd1c54240d0f1 j
=C2=A0=C2=A0 ffs2: Fix page lock / f->sem deadlock

In addition consider these:

f93812846f31381d35c04c6c577d724254355e7f=20
=C2=A0=C2=A0 jffs2: reduce the breakage on recovery from halfway failed ren=
ame()

eb042ec35956de2684de2a05a814cd15efe570ca=20
=C2=A0=C2=A0 jffs2: fix a memleak in read=5Fdirentry()

Thanks,
milton
