Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydR6t6nvYzDrK3
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 16:11:50 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAH5BeU5115471
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 00:11:47 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e9sbgg374-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 00:11:40 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 16 Nov 2017 22:11:29 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Nov 2017 22:11:25 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAH5BP5Q6226250; Thu, 16 Nov 2017 22:11:25 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ACB1C604A;
 Thu, 16 Nov 2017 22:11:25 -0700 (MST)
Received: from birb.localdomain (unknown [9.81.204.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with SMTP id 5354CC6042;
 Thu, 16 Nov 2017 22:11:24 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id F17274F0CA8; Fri, 17 Nov 2017 16:11:17 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: On the state of documentation
In-Reply-To: <C56F44F7-987C-47B2-8E8A-E50A2F6D2A53@fuzziesquirrel.com>
References: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
 <B9643A4A-B3FF-4D99-880C-8617231513BA@stwcx.xyz>
 <7E9441B1E5EFFD4681F54958E82169932EAF586A@ORSMSX105.amr.corp.intel.com>
 <87zi7lzjvu.fsf@linux.vnet.ibm.com>
 <C56F44F7-987C-47B2-8E8A-E50A2F6D2A53@fuzziesquirrel.com>
Date: Fri, 17 Nov 2017 16:11:17 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 17111705-8235-0000-0000-00000C942576
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008079; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00947019; UDB=6.00478086; IPR=6.00727311; 
 BA=6.00005696; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018057; XFM=3.00000015;
 UTC=2017-11-17 05:11:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111705-8236-0000-0000-00003E79F0AC
Message-Id: <87vai9zdze.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-17_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711170069
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
X-List-Received-Date: Fri, 17 Nov 2017 05:11:51 -0000

Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
>> On Nov 16, 2017, at 10:03 PM, Stewart Smith <stewart@linux.vnet.ibm.com>=
 wrote:
>>=20
>> "Tanous, Ed" <ed.tanous@intel.com> writes:
>>> I believe that the lack of good documentation is a symptom of a larger
>>> issue:  OpenBMC is not targeting a public specification with its REST
>>> interface.  This has led to certain engineering flexibilities with the
>>> interface that, while useful for short term to "get something that
>>> works", make it very difficult to target openbmc an evolving platform.
>>> In the current model, DBus specifications are pushed directly to the
>>> end user, which means (nearly) every DBus spec change results in a
>>> change to end user interfaces.  I don't believe this is sustainable in
>>> the long run, given the number of platforms that this is targeting and
>>> the need for reproducible APIs between systems.
>
> No disagreement here.  The project could really could use a Redfish
> and full IPMI implementation.

>>> that middle to long term we should transition away from
>>> these interfaces for end-user facing functionality, and move toward
>
> Words like 'transition away' and 'move toward' are kind of freaking me out
> a little.  Are you suggesting that OpenBMC can _only_ have a Redfish
> implementation?  Any other REST API implementation would be=E2=80=A6banne=
d from
> the project?  Or am I reading into it too much?

I'd support multiple interfaces (after all, IPMI and RedFish are
multiple ones anyway, and IPMI is probably going to take a few more
years to disappear)

> Like I said, I too agree we need a Redfish and IPMI implementation
> in OpenBMC.
>
> That said, what reason is there to get rid of the existing DBus<->REST
> translation server?  It=E2=80=99s not as if its a maintenance burden.  It=
 isn=E2=80=99t
> as if anyone is making people use it in their products.  Its there.
> You can use it or not use it.  When we have an IPMI or Redfish
> implementation, I=E2=80=99ll be the first in line (well maybe second after
> Stewart) to tell my employer to turn it off in their products.
> That isn=E2=80=99t the same thing as removing it from the project altoget=
her.

It might be useful for debug to keep around "forever"?

>>> Some important key points that I think should be driven by the new mode=
l:
>>> 1. Rest interfaces should not be driven by the underlying DBus interfac=
es, nor the backend implementation language.
>
> This reads like policy for someone using OpenBMC to build a BMC stack.
>
> I would rephrase it to:
>
> XYZ corp cannot use any REST implementations provided by OpenBMC that are
> driven by the underlying DBus interfaces in XYZ corp products making use
> of OpenBMC.
>
> Do you see the difference?

I'd say "The OpenBMC REST API is not meant to be a stable API to be
consumed. It exists exclusively for debug and development efforts of
OpenBMC. It may, in future, completely change or disappear."

From someone consuming it, that's certainly been the experience at least :)

>>> 2. Interfaces should not contain any "backdoor" type APIs that allow wh=
ite box style access to internal APIs.  Anything breaking the black box mod=
el should be done in a machine specific layer or configuration.
>>> 3. APIs should give the minimum required amount of information to fulfi=
ll the end user use case.
>>> 4. Interfaces should be backed by the system level security policy (PAM=
 users in the current model).
>>> 5. Where possible, the implementations should follow an existing specif=
ication.  In the cases where the requirements are not supported, the api sh=
ould follow the style of the supporting interface  (Think redfish OEM comma=
nd support)
>
> I have the same reaction to 2-6 as I did for 1.  These are policies on _u=
se_
> of OpenBMC.  Right?  Not what the contributors to the project are allowed=
 to do.
>
> My worldview is that each one of these bullet points would cost the proje=
ct a
> potential contributor.  Somewhere, someone is going to want to do one of
> those things.  Why not let them, when the only thing you have to do is no=
t use
> their code?

Maybe guidelines more than rules?

I'm sure there's exceptions, but there's unlikely to be anything really
exist beyond RedFish and IPMI... If there is, I'd say it's up to you if
you want to include it in the base/reference distribution and if this
will create value or just more work :)


--=20
Stewart Smith
OPAL Architect, IBM.
