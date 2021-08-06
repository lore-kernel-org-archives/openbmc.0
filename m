Return-Path: <SRS0=6yv1=M5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EA2C4338F
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 06:41:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C19B611B0
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 06:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C19B611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggwqn6zlTz30Dd
	for <openbmc@archiver.kernel.org>; Fri,  6 Aug 2021 16:41:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 305 seconds by postgrey-1.36 at boromir;
 Fri, 06 Aug 2021 16:41:20 AEST
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgwqN6H0zz309p
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 16:41:20 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0Ui6ZmQq_1628231755; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0Ui6ZmQq_1628231755) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 Aug 2021 14:35:56 +0800
Subject: Re: Question about NVMe MCTP in dbus-sensors
To: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 jk@codeconstruct.com.au
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
 <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <30416e46-2e6d-c878-4c7d-943aa1119c0e@linux.alibaba.com>
Date: Fri, 6 Aug 2021 14:35:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Andrew, Jeremy,

Appreciate your helpful information. Let me take some time to look into 
all this document and patches :)

BTW, when will MCTP be ready in openbmc mainline, including SMBus 
binding and PCIe binding? Do you have any plan in the future openbmc 
release?

Thanks,

Heyi


On 2021/8/6 下午1:42, Andrew Jeffery wrote:
> Hello Heyi!
>
> On Fri, 6 Aug 2021, at 14:47, Heyi Guo wrote:
>> Hi,
>>
>> We can see that NVMe sensors in dbus-sensors relies on MCTP to get
>> hardware information. It is using libmctp interfaces to initialize MCTP
>> and SMBus.
> To be clear, it's using a fork of libmctp that implements an SMBus
> binding via a fork of the kernel that exposes a I2C API that isn't
> upstream.
>
> For the SMBus binding to be merged in upstream libmctp I'd like to see
> the necessary kernel interfaces merged into the upstream kernel tree,
> but I don't expect that's going to happen any time soon. More on why
> below.
>
> As an aside you may be interested in this patch which allows nvmesensor
> to use the basic management command to fetch temperature data:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/43665
>
>> However I don't find the code or component who is responsible
>> as a bus owner, to discover endpoints, manager EID and update routing
>> table. Isn't necessary for a central component to do such things?
> It's not strictly necessary in that it's valid for systems to be
> completely defined in terms of static endpoints. Doing so isn't covered
> by the MCTP spec, and it's also pretty limiting, but it is enough in
> some circumstances.
>
>> Will
>> there be access conflict if non-NVMe devices (MCTP capable) are also
>> connected to the same SMBus？
> No.
>
>> We also found another implementation from Intel:
>> https://github.com/Intel-BMC/pmci. It implements mctpd to provide MCTP
>> message transfer interfaces on D-Bus, while PLDM, NVME-MI and others can
>> rely on the D-Bus interfaces instead of libmctp.
> This is a direction Intel chose to go however it's not the direction
> that upstream OpenBMC will be using. The use of a pure userspace
> solution such as libmctp went far enough to expose the need for a
> kernel-based solution. We will shortly have that, thanks to the efforts
> of Jeremy and Matt at Code Construct:
>
> https://lore.kernel.org/netdev/20210729022053.134453-1-jk@codeconstruct.com.au/
>
> This series is now in net-next, and Matt and Jeremy have also been
> developing the in-kernel hardware binding support and necessary
> userspace components[1].
>
> [1] https://github.com/CodeConstruct/mctp
>
> You can read more about the application of the socket syscalls here:
>
> https://lore.kernel.org/netdev/20210729022053.134453-16-jk@codeconstruct.com.au/
>
> and here:
>
> https://github.com/openbmc/docs/blob/master/designs/mctp/mctp-kernel.md
>
> Once we have AF_MCTP in the OpenBMC kernel tree with some binding
> implementations we'll be switching the userspace applications over to
> use it.
>
> Hope that helps!
>
> Andrew
