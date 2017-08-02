Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMkfM6FsJzDrSK
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 17:02:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7271nhN018775
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 03:02:49 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c33502e92-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 03:02:49 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 01:02:47 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 01:02:46 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7272jgo4915464; Wed, 2 Aug 2017 00:02:45 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3FD2BE04C;
 Wed,  2 Aug 2017 01:02:45 -0600 (MDT)
Received: from birb.localdomain (unknown [9.83.5.250])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id C925EBE04A;
 Wed,  2 Aug 2017 01:02:44 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 3DF7B4EC562; Wed,  2 Aug 2017 17:02:41 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: REST API docs
In-Reply-To: <20170801212832.GC14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com> <20170801212832.GC14987@asimov>
Date: Wed, 02 Aug 2017 17:02:41 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17080207-0008-0000-0000-0000085639BC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007469; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000215; SDB=6.00896364; UDB=6.00448402; IPR=6.00676551; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016492; XFM=3.00000015;
 UTC=2017-08-02 07:02:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080207-0009-0000-0000-0000435CF31B
Message-Id: <87bmnymoz2.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708020114
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Aug 2017 07:02:52 -0000

Patrick Williams <patrick@stwcx.xyz> writes:

> On Tue, Aug 01, 2017 at 03:07:36PM +1000, Stewart Smith wrote:
>> The documentation up at:
>> https://github.com/openbmc/docs/blob/master/host-management.md
>> says /org/openbmc but we here tales in internal bug reports that
>> everything is switching to /xyz/openbmc_project.
>> 
>> Except, I don't recall seeing any deprecation plan.... is there
>> one?
>> 
>> We're heavily using this now for op-test-framework, and there's a patch
>> to switch it, but I need to know how far back/forwards the existing/new
>> interfaces are supported.
>> 
>> See:
>> https://github.com/open-power/op-test-framework/pull/150/commits/e05b1a89e032b1bbe14d9a177afa46f1a2c6413c
>> 
>> Also, could some more effort please be put into communicating these
>> changes. These kind of surprises aren't great for our already
>> constrained team.
>
> Stewart,
>
> I don't know why this is a surprise.  We have been communicating in
> various avenues that the /org/openbmc APIs defined for Barreleye
> were all deprecated the day we split the 2.0 development branch.
> I alluded to this even in the email announcing the v1.0 tag:
>     https://lists.ozlabs.org/pipermail/openbmc/2016-June/003707.html

API changes are reading a bit too much between the lines there to
reasonably be actionable on.

> It is a violation of the dbus spec for us to be using /org/openbmc since
> it is not a domain name we have control over.

ok, that's reasonable.

> None of the /org/openbmc interfaces went through any proper interface
> design.  They were all defined and implemented ad-hoc by individual
> developers as part of the Barreleye proof-of-concept work.  There are
> numerous inconsistencies in their original form.

ok.

> One of the first pieces of work we defined and began working on was a
> dbus interface YAML specification, from which we generate compile-time
> enforced dbus bindings to ensure compatibility between applications.
> All of the xyz.openbmc_project interfaces have formal documentation in
> the phosphor-dbus-interfaces repository, which had its first commits in
> October of last year.

So something like this
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory
supercedes
https://github.com/openbmc/docs/blob/master/host-management.md#inventory
?

The former certainly isn't too clear, while the original docs are. In
fact, we explicitly call out to /usr/bin/curl and print the command line
we're running so that we have an easy way to see what our test suite was
doing in case somebody wants to manually recreate it for debugging purposes.

> The dbus interfaces you are _moving to_ were defined and implemented
> in December of last year and we moved over to them as a whole within
> the code base by Feb.  Your first commit "Initial OpenBMC support" in
> your repository wasn't until late Feb, so you were already using the
> wrong interfaces.

The inital commit (738db7943eb0f090fa3db07c5200df536d0e3a4a) just used
the SSH host console and that's it, it wasn't until June
(64312b69acff30de8d75d80ab208c759a522a8ee) that we started to use the
REST API at all as when we started to poke at the IPMI support in March
(b19d231096ac27fa137eaf07b22c6deb61032e24), we quickly discovered that
it wasn't going to be sufficient in a near enough timeframe to be
suitable for OPAL testing.

I personally spent a bunch of time getting our test suite to be BMC
agnostic just to accomodate the backwards incompatibility of OpenBMC
(notably P9 FSP systems and P9 SMC systems are backwards compatibile,
and I don't think we had to add *any* code to accomodate them over the
P8 systems, with one patch for SMC versus AMI BMCs).

As of the time I pulled in the code to speak the OpenBMC REST API, that
was what was in the docs, and indeed, it's what is still there. The docs
repository is exclusively /org/openbmc/.

[stewart@birb openbmc-docs]$ ack -l 'org/openbmc'
cheatsheet.md
code-update.md
dbus-interfaces.md
host-management.md
rest-api.md
rfc-obmc-service-iface.md
[stewart@birb openbmc-docs]$ ack -l 'xyz/openbmc_project'
LED-architecture.md
openbmc-systemd.md
sensor-architecture.md

> We have been working very closely with the automated test group that
> works on the openbmc-test-automation repository.  I was pretty certain
> that within IBM there is some affinity between the team working on this
> repository and the team working on your repository, isn't there?  In
> fact, I clearly recall discussions within IBM questioning why the
> op-test-framework would not be building on top of the existing Robot
> support provided by openbmc-test-automation rather than implement
> a different custom framework.

There hasn't been. Recently we re-synced a bit, but just on a discussion
level.

There are two very different goals of the test suites too. One is to
test OpenBMC itself, while the other is to test host firmware, and
largely incidentally test the BMC implementation.

A while ago (January) there was a pull request r.e. Robot tests for
op-test-framework
(https://github.com/open-power/op-test-framework/pull/74 ) but for a
couple of reasons this didn't go anywhere. My biggest issues were that it
just added Robot files to the repository and didn't integrate at all
with the existing tests, nor re-implement any of them, and certainly
didn't support running the same tests against systems based on FSP,
OpenBMC, AMI and SMC. We have to be able to run against any of them, and
preferably also against any/all of the simulators we use.

I'm certainly not fundamentally opposed to Robot, it's possibly useful
for writing some small tests. But we do get a lot of power from just
having python
available... e.g. https://github.com/open-power/op-test-framework/blob/v0.8/testcases/IpmiTorture.py
which was instrumental in finding and fixing a critical customer
issue. We can write quite sophisticated tests that do a lot of things
concurrently (in and out of band).

While the Robot syntax may be nicer for a bunch of basic tests, it's not
*too* bad with what we have
(e.g. https://github.com/open-power/op-test-framework/blob/v0.8/testcases/OpalMsglog.py
greps the OPAL log for warnings/errors on the host both at the petitboot
shell and in a booted OS).

> I was not aware that you had written your own test automation suite that
> was using REST APIs and you were not relying on the existing and
> supported openbmc-test-automation repository.  I also did not hear any
> inquiry from you, either publicly or privately, on which APIs you should
> be targeting for work you were doing.

We just read the docs, and code seemed to work written to the docs (if
it didn't, we likely would have filed a bug).

> The deprecation plan is, and has for the entire 2.0 development branch,
> that 1.0 and 2.0 have a complete API break and there is no attempt at
> backwards compatibility.  A clear requirement of a 2.0 tag is that all
> /org/openbmc interfaces have been removed and replaced by something
> documented in phosphor-dbus-interfaces and implemented within the code
> base.  We have been doing that at a fairly regular pace the entire
> year.

It'd be great if the docs repo could be updated so it was clear with the
examples and the transition. Additionally, it'd be good if there'd be
posts to the list saying, say "the new xyz/openbmc_project sensors API
is now in master, we'll keep the org/openbmc/ one for the next 60 days
before dropping it" or along those lines.

Reality is that different P9 platforms are on (slightly) different
OpenBMC builds, and not every machine we get pointed at is up to date
with OpenBMC, so we do need to support a range of OpenBMC
builds. Especially considering we're pretty agile in being able to swap
between host and BMC development whenever we spot a problem in the other
system to help someone debug (even if the solution is 'yeah, I've
upgraded it for you').

-- 
Stewart Smith
OPAL Architect, IBM.
