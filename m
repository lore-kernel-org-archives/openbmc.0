Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2qVw5RCvzF06g
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 11:43:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBM0eMoH090365
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 19:43:18 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2f0j7g5th8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 19:43:18 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 21 Dec 2017 19:43:16 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Dec 2017 19:43:13 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBM0hDlH49610780; Fri, 22 Dec 2017 00:43:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4CA2AE04B;
 Thu, 21 Dec 2017 19:44:16 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.207.201])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id 60DE7AE04E;
 Thu, 21 Dec 2017 19:44:15 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 87C374EC6A2; Fri, 22 Dec 2017 11:43:06 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Michael.E.Brown@dell.com, bradleyb@fuzziesquirrel.com
Cc: vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org,
 richard.marian.thomaiyar@linux.intel.com
Subject: RE: OpenBMC community telecon - 11/27 Agenda
In-Reply-To: <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery>
 <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
 <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
Date: Fri, 22 Dec 2017 11:43:06 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 17122200-0024-0000-0000-00000305A616
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008240; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00963673; UDB=6.00487546; IPR=6.00743659; 
 BA=6.00005753; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018665; XFM=3.00000015;
 UTC=2017-12-22 00:43:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17122200-0025-0000-0000-00004662A157
Message-Id: <87k1xfvbhh.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-21_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712220007
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
X-List-Received-Date: Fri, 22 Dec 2017 00:43:21 -0000

Michael.E.Brown@dell.com writes:
> The main issue is one of security. And I realize here that openbmc has a =
different security model than our product, but here goes:
>
> The "ipmi/web/etc" users are "attacker controlled", if you consider
> the end-user the adversary and are trying to protect the internal
> functioning of the product. That may sound a bit off, but the main
> thing here is that we don't want to allow the user(/administrator) to
> do something that would break the product or allow an insecure
> situation. In our product we now have all of our internal daemons
> running as non-root and a separate user account for each daemon. For
> example: the "powerd" daemon runs as the "power" user and "power"
> group. That linux user has permissions to the /dev entries it needs to
> function, but does not have access to things like KVM or other
> infrastructure or hardware that it doesn=E2=80=99t need. Since we allow "=
ssh"
> logins to a (minimalistic) shell (either racadm or a smash compatible
> clp), that represents an attack surface. If the user were able to
> create user called "power" that is a linux user and an ipmi/web user
> and they logged into the box as that 'power' user, it would be have
> the same permissions as our power daemon. We try to lock down the
> default shells for non-privileged users but this would represent a
> possible entry point.

Neat!

I've thought that OpenBMC would be a good candidate for a really
restrictive set of SELinux policy too (or some other security module),
to further mitigate any possible damage that could be done even in the
event of a vulnerability.

Have you looked into anything like that at all?

--=20
Stewart Smith
OPAL Architect, IBM.
