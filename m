Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydNHY2qJXzDr8d
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 14:04:09 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAH2xR77108434
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 22:04:07 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e9jtttwmx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 22:04:06 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 16 Nov 2017 22:04:05 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Nov 2017 22:04:02 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAH3414437945596; Fri, 17 Nov 2017 03:04:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CEADAE03B;
 Thu, 16 Nov 2017 22:04:53 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.204.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id B7330AE034;
 Thu, 16 Nov 2017 22:04:51 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 5E6D74F0CA8; Fri, 17 Nov 2017 14:03:49 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Tanous\, Ed" <ed.tanous@intel.com>, Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: On the state of documentation
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAF586A@ORSMSX105.amr.corp.intel.com>
References: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
 <B9643A4A-B3FF-4D99-880C-8617231513BA@stwcx.xyz>
 <7E9441B1E5EFFD4681F54958E82169932EAF586A@ORSMSX105.amr.corp.intel.com>
Date: Fri, 17 Nov 2017 14:03:49 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17111703-0036-0000-0000-0000028DF321
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008079; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00946977; UDB=6.00478061; IPR=6.00727269; 
 BA=6.00005696; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018055; XFM=3.00000015;
 UTC=2017-11-17 03:04:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111703-0037-0000-0000-000042680454
Message-Id: <87zi7lzjvu.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711170037
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
X-List-Received-Date: Fri, 17 Nov 2017 03:04:09 -0000

"Tanous, Ed" <ed.tanous@intel.com> writes:
> I believe that the lack of good documentation is a symptom of a larger
> issue:  OpenBMC is not targeting a public specification with its REST
> interface.  This has led to certain engineering flexibilities with the
> interface that, while useful for short term to "get something that
> works", make it very difficult to target openbmc an evolving platform.
> In the current model, DBus specifications are pushed directly to the
> end user, which means (nearly) every DBus spec change results in a
> change to end user interfaces.  I don't believe this is sustainable in
> the long run, given the number of platforms that this is targeting and
> the need for reproducible APIs between systems.

I very much agree.

As someone consuming it, for the purposes of automating testing host
firmware (for the purpose of being a host firmware maintainer), it's
been *extroadinarily* frustrating. Upgrading a BMC usually meant 0.5-1
day of working out what API change broke and how to code something that
was safe for more than one OpenBMC build.

Additionally, much of the docs of the DBUS API are currently written
targetting somebody working on OpenBMC internals.

> I would argue that middle to long term we should transition away from
> these interfaces for end-user facing functionality, and move toward
> something that has a standard behind it.  I think the obvious choice
> in this problem space is redfish, but I'm open to other options.

I am 100% with you on that.

RedFish may not be ideal (neither is IPMI), but it's *standard*, so at
least it's not just a OpenBMC problem.

I see at least 2 other BMCs I have to deal with going the RedFish route,
so I'd honestly like to see OpenBMC go there.

I view all the code I've written against the OpenBMC REST API to be
throw-away code... but that's what I've been told by the IBM team they
support, so there hasn't really been a choice apart from rewriting half
of it every month for no discernable good reason.

> I'd like to pose the question:
> Should we move toward deprecating the /xyz and /org style rest
> interfaces, and agree that we should start transitioning to something
> (redfish or not) with a fixed specification?

My vote is YES, *PLEASE* YES.

> Some important key points that I think should be driven by the new model:
> 1. Rest interfaces should not be driven by the underlying DBus interfaces, nor the backend implementation language.
> 2. Interfaces should not contain any "backdoor" type APIs that allow white box style access to internal APIs.  Anything breaking the black box model should be done in a machine specific layer or configuration.
> 3. APIs should give the minimum required amount of information to fulfill the end user use case.
> 4. Interfaces should be backed by the system level security policy (PAM users in the current model).
> 5. Where possible, the implementations should follow an existing specification.  In the cases where the requirements are not supported, the api should follow the style of the supporting interface  (Think redfish OEM command support)
> 6. Documentation changes should be pushed ahead of or along with
> implementation support, with the goal of keeping the documentation
> constantly up to date.

Completely agree.
> Shameless plug: As the person that pushed the aforementioned gerrit
> review for a new thinking on the webserver and redfish, I would love
> comments on architecture decisions and implementation details.

I nearly commented MERGE NOW without even looking, but that's possibly a
bit keen :)

I reckon the Minimum Viable Product for something is enough to do what
TripleO needs (which is probably the same set of things that I need for
OPAL testing). Once it's there, I say go for it - internals can be
cleaned up, but at least those of us consuming OpenBMC have a good way
forward along with an upstream spec to point to and look at.

-- 
Stewart Smith
OPAL Architect, IBM.
