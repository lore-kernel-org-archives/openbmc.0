Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.42; helo=que005-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
X-Greylist: delayed 685 seconds by postgrey-1.36 at bilbo;
 Thu, 24 May 2018 14:15:18 AEST
Received: from que005-public.msg.strl.va.charter.net
 (que005-public.msg.strl.va.charter.net [68.114.190.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 40rwyt2TbmzF1Gj
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 14:15:17 +1000 (AEST)
Received: from impout003 ([68.114.189.18]) by mtaout003.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180524040350.ODAU7355.mtaout003.msg.strl.va.charter.net@impout003>
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 23:03:50 -0500
Received: from [192.168.2.9] ([97.86.254.207]) by impout003 with charter.net
 id q43o1x00A4VFKzV0143pdj; Wed, 23 May 2018 23:03:50 -0500
X-Authority-Analysis: v=2.2 cv=HqsGIwbS c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=x7bEGLp0ZPQA:10 a=voM4FWlXAAAA:8 a=iGHA9ds3AAAA:8
 a=hOpmn2quAAAA:8 a=jU4qhlNgAAAA:8 a=uYk_21zaJFecBHMzqSoA:9 a=QEXdDO2ut3YA:10
 a=2jrASSjgkwAA:10 a=IC2XNlieTeVoXbcui8wp:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=GyA-uvUxXSCciAkwuKQO:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: Proposal for OpenBMC releases + migration
To: openbmc@lists.ozlabs.org
References: <mailman.860.1526928553.24858.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <6d271d14-c60b-9567-b6a6-38743e6eda75@charter.net>
Date: Wed, 23 May 2018 23:03:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.860.1526928553.24858.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2018 04:15:19 -0000

On 5/21/2018 1:49 PM, openbmc-request@lists.ozlabs.org wrote:
> In order for us to facilitate all member companies in the OpenBMC work
> planning process, I believe it is important for the project to adopt a
> formal release schedule. Release cycles allow member companies to plan
> on content being delivered, get a read on project priorities, and
> exchange design ideas on the best implementation. As with other
> projects, release dates would be fixed in time. If a feature didn't make
> the release cutoff, then it ships in the next release. This really helps
> drive prioritization of new functionality.
>
> As Brad commented in the community call today, let's start off the
> proposal with aligning with the Yocto project releases plus some time
> for project testing/hardening. Yocto releases are every 6 months, around
> May-October[1], so if we allow for a month of freeze and testing, that
> would be OpenBMC releases every June-November. Since June is next month,
> I'd propose that we start planning now for the November release.
>
> OpenBMC release ? November 2018
>
> Questions:
> How do we number releases? do we want to code name them?
> Do we want a stable branch/working branch organization?
> How long does the project maintain a stable branch? n-1? n-2?
> Do we want project milestones for content proposal, code freeze and release?
>
> [1]https://wiki.yoctoproject.org/wiki/Releases
>
> Kurt Taylor (krtaylor)
It is my understanding that one of the primary applications of OpenBMC 
is for use in servers that may have a life span of 7 years (wild 
guess).  Does that mean we should support selected OpenBMC releases for 
that long?  Or do we leave that work to the downstream projects that use 
OpenBMC?  Some groups will be required to remediate BMC security flaws 
for the lifetime of the server.

An alternative is a migration path.  For example, a server is placed 
into service in a data center, serviced by OpenBMC release N.  The 
server receives regular maintenance and updates as usual.  The BMC also 
receives updates to remediate its flaws.  When OpenBMC release N goes 
out of service, the administrator migrates to OpenBMC release N+1, and 
continues maintenance.

The "release upgrade/migration" replaces the OpenBMC code, while leaving 
its data intact: user authentication and authorization levels, event 
logs, FRUs, etc.  That implies the data must be forward compatible, 
specifically, OpenBMC release N+1 must be able to read/use/handle data 
from release N data.  Implicit is an assumption that the only way to 
update a BMC based on OpenBMC is by replacing the entire installed image.

IN SUMMARY, I think the OpenBMC project will need a forward migration 
path from each release N to release N+1.  And that means OpenBMC 
developers will need to consider how they will provide forward 
compatibility for data stored on the BMC.  For example, when release N+1 
is booted up, it will be expected to work with data that was created on 
release N.
-- 
Joseph Reynolds | 507.208.5420 | joseph-reynolds@charter.net
linkedin.com/in/joseph-reynolds
