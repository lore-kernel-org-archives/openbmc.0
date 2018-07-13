Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.29; helo=mtaout004-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout004-public.msg.strl.va.charter.net
 (mtaout004-public.msg.strl.va.charter.net [68.114.190.29])
 by lists.ozlabs.org (Postfix) with ESMTP id 41Rcg81QKWzDr55
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 12:48:03 +1000 (AEST)
Received: from impout006 ([68.114.189.21]) by mtaout004.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180713024759.RFZ3685.mtaout004.msg.strl.va.charter.net@impout006>
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 21:47:59 -0500
Received: from [192.168.2.8] ([97.86.254.207]) by impout006 with charter.net
 id A2nz1y0044VFKzV012nzRY; Thu, 12 Jul 2018 21:47:59 -0500
X-Authority-Analysis: v=2.2 cv=UeshcOaN c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=x7bEGLp0ZPQA:10 a=voM4FWlXAAAA:8 a=hOpmn2quAAAA:8
 a=QyXUC8HyAAAA:8 a=tcme9c7lAAAA:8 a=9H6MWKLwAAAA:8 a=dpRSjrXKAAAA:8
 a=B6KMzFptAAAA:20 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=e-GSelqVAAAA:8
 a=uZrwUF-vtwSy3NPKS-QA:9 a=F6au3JbH5glm_-kD:21 a=zFqZI-hN4St9j7hB:21
 a=QEXdDO2ut3YA:10 a=gib0HD_uULMA:10 a=ESXXJOcZ9k8A:10 a=U3n7YvTwqyMA:10
 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10 a=IC2XNlieTeVoXbcui8wp:22
 a=GyA-uvUxXSCciAkwuKQO:22 a=cJsI3S3cdgERF2JXxJch:22 a=teZfpv_PRiPChz4BB6pV:22
 a=xkwab4zIHtOjTkBAMNFX:22 a=AjGcO6oz07-iQ99wixmX:22 a=VTQqQez33RekakbJVocy:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: How to handle security vulnerabilities (was: OpenBMC security
 workgroup status)
To: openbmc@lists.ozlabs.org
References: <mailman.665.1531286336.32318.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <e863845c-d53f-6bd3-eb0e-5bdef19f96c7@charter.net>
Date: Thu, 12 Jul 2018 21:47:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.665.1531286336.32318.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 02:48:05 -0000

On 7/11/2018 12:18 AM, openbmc-request@lists.ozlabs.org wrote:
> Message: 1
> Date: Wed, 11 Jul 2018 12:49:36 +0930
> From: Andrew Jeffery <andrew@aj.id.au>
> To: Joseph Reynolds <joseph-reynolds@charter.net>,
> 	openbmc@lists.ozlabs.org
> Cc: James Mihm <james.mihm@intel.com>, bradleyb@fuzziesquirrel.com
> Subject: Re: OpenBMC security workgroup status
> Message-ID:
> 	<1531279176.3103610.1436766272.6E940CAB@webmail.messagingengine.com>
> Content-Type: text/plain; charset="utf-8"
>
> On Tue, 10 Jul 2018, at 11:50, Joseph Reynolds wrote:
>> Here is the OpenBMC security work group status.
>>
>> The OpenBMC security work has been partitioned into four areas:
>> hardware, firmware (Linux, phosphor, etc.), OpenBMC development
>> activity, and downstream development.? Reviews are out for three areas;
>> see https://gerrit.openbmc-project.xyz/#/c/11120/ and 11164.? Work to
>> sketch out firmware security topics is beginning.? We are also beginning
>> to look at topics such as release planning and how to handle security
>> flaws.? For more details, see the group?s agenda and minutes at
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI.
> What's the short-term strategy for handling vulnerability reports received in the gap between now and getting some formal process in place?
We don't have a strategy.  Let's discuss it here.

Officially (https://github.com/openbmc/openbmc/ section "Bug Reporting") 
issues are managed on GitHub.

Unofficially, Brad volunteered to accept one batch of security 
vulnerability reports and distribute them, presumably to the OpenBMC TSC 
members (https://github.com/openbmc/docs section "Technical Steering 
Committee") or their delegates.  I assume they would privately contact a 
trusted OpenBMC contributor who could address the problem.

We could adapt the Linux model 
(https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html), 
although I am still looking for information on what the Linux security 
team does with the bug report.  For example, how security group members 
track and discuss problems among themselves, how they pull in additional 
resources to fix or mitigate the problem, and how they inform downstream 
distros before announcing the problem, etc.

I think the first step for the OpenBMC team should be to establish an 
email address (like security@openbmc.org), subscribe only trusted people 
to that email list, and update the docs to explain that you should email 
the security team for security questions, and use issues for everything 
else.  Presumably, the security team would communicate privately among 
themselves and the submitter to assess the situation, and contact 
OpenBMC community members privately to address the problem.

This would be an easy step to take, and would move the team in the right 
direction.  What do you think?
