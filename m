Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycDY71xktzDql1
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 17:11:54 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAF6AdNY083284
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 01:11:52 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2e8dt1d06p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 01:11:51 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 15 Nov 2017 01:11:51 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 15 Nov 2017 01:11:48 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAF6BlIx49938456
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 06:11:47 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0E09AE052
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 01:12:38 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.210.253])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id 232BBAE034
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 01:12:37 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id BB60F4F0D20; Wed, 15 Nov 2017 17:11:41 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: On the state of documentation
Date: Wed, 15 Nov 2017 17:11:41 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17111506-0056-0000-0000-000003EA2484
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008066; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00946080; UDB=6.00477524; IPR=6.00726377; 
 BA=6.00005690; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018022; XFM=3.00000015;
 UTC=2017-11-15 06:11:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111506-0057-0000-0000-0000082143A2
Message-Id: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711150087
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
X-List-Received-Date: Wed, 15 Nov 2017 06:11:55 -0000

Hi all,

thought I'd try and contribute my thoughts here, as a consumer of
OpenBMC rather than a developer on it.

The message has long been that the REST API is what should be used to
interact with the BMC, and as such we now have a lot of tooling that
does just that (and we're not the only ones).

Over the past $months, it's been frustrating (to say the least) that
there hasn't been any good documentation of this API.

Indeed, If I look at the API on the "Rusty's API Scale" of usability:
http://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
http://ozlabs.org/~rusty/index.cgi/tech/2008-04-01.html
It's all pretty high on the negatives, although it does vary on what
specific API you're looking at.

A lot of the negative scoring here is due to a near complete absence of
documentation. Most things that we use have ended up being documented
either in the implementation (which may or may not allow you to use it
correctly), or by some random thread on an IBM internal slack channel.

Additionally, this issue and PR has come up:
"Remove org.openbmc.* from REST server"
https://github.com/openbmc/openbmc/issues/2378
https://gerrit.openbmc-project.xyz/#/c/7422/

This morning, I took a stab at going through the documentation and
working out what this means for current documentation:
https://gerrit.openbmc-project.xyz/#/c/7916/

In short: it's not good. There is now no longer documentation even
describing how to turn the host on and off.

If the above "remove org.openbmc.* from REST server" is merged, there
will be *ZERO* documentation on how to turn the host on and off - which
is about the most simple thing you want to do with a BMC.

Is there a plan to attack this?

IMNSHO I'd like to see a standard interface be "the way" to talk to
OpenBMC based systems, something like RedFish, which I noticed there was
the start of some work on here: https://gerrit.openbmc-project.xyz/#/c/7786/

But even if RedFish/IPMI became *the* way externally, the internal APIs
(as in, d-bus APIs) could probably also do with some love.

My initial stab at helping with that is:
https://gerrit.openbmc-project.xyz/#/c/7923/
but even then, that very same API raises a lot of other questions that I
haven't addressed - and even in that pull request, I've made a bunch of
sweeping statements binding the OpenBMC developers to certain API
stability constraints.
-- 
Stewart Smith
OPAL Architect, IBM.
