Return-Path: <SRS0=x2GU=NB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897CAC4320A
	for <openbmc@archiver.kernel.org>; Tue, 10 Aug 2021 12:24:43 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 954FB60EFF
	for <openbmc@archiver.kernel.org>; Tue, 10 Aug 2021 12:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 954FB60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkXFj0M9kz3bPG
	for <openbmc@archiver.kernel.org>; Tue, 10 Aug 2021 22:24:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213;
 helo=5.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 13173 seconds by postgrey-1.36 at boromir;
 Tue, 10 Aug 2021 22:24:12 AEST
Received: from 5.mo548.mail-out.ovh.net (5.mo548.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkXF83q85z301s
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 22:24:10 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7B19D203DA;
 Tue, 10 Aug 2021 08:44:32 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 10:44:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a6049110-6e5f-437b-aaeb-60ad878cd368,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: ast2600-evb qemu and usb-net
To: Joel Stanley <joel@jms.id.au>, Deepak Kodihalli
 <deepak.kodihalli.83@gmail.com>
References: <CAM=TmwU57zhc_k7KAKc56wTf=mihD4uWxBd8qPS+-22ZKER94w@mail.gmail.com>
 <CACPK8XdcNq7_N9FKB9zOrknwkR2JQN2btL=qa2JBR14aMe2tMw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c60975ed-8af1-3c8a-a6f4-6dcb3c853fc0@kaod.org>
Date: Tue, 10 Aug 2021 10:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdcNq7_N9FKB9zOrknwkR2JQN2btL=qa2JBR14aMe2tMw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7c79122-3407-4272-858c-c435fac12760
X-Ovh-Tracer-Id: 4354699365347134432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejieeitdekueevffehvdfhteehuefgteeiueduvdeljefgfeefhffhfeegjedtjeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvghvqdgvnhhvihhrohhnmhgvnhhtrdhmugenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 8/10/21 4:31 AM, Joel Stanley wrote:
> On Mon, 9 Aug 2021 at 04:56, Deepak Kodihalli
> <deepak.kodihalli.83@gmail.com> wrote:
>>
>> Hi All,
>>
>> I am trying to launch the ast2600-evb machine on QEMU by passing a a
>> usb-net device:
>> qemu-system-arm -machine ast2600-evb  -drive file=<bmc
>> image>,if=mtd,bus=0,unit=0,snapshot=on -nographic  -nic
>> user,hostname=qemu -device usb-net,netdev=net0 -netdev
>> socket,id=net0,listen=:1234
>>
>> I downloaded the QEMU binary from
>> https://github.com/openbmc/docs/blob/master/development/dev-environment.md#download-and-start-qemu-session.
> 
> This is unrelated to your question, but that qemu is built from an
> outdated branch. I would recommend using mainline qemu instead.
> 
> We also have a qemu tree that Cedric maintains at
> https://github.com/legoater/qemu. The aspeed-6.1 (and soon aspeed-6.2)
> have changes that we have not yet merged to mainline.
> 
>> I get the following error when I run the command above:
>> qemu-system-arm: -device usb-net,netdev=net0: Warning: speed mismatch
>> trying to attach usb device "QEMU USB Network Interface" (full speed)
>> to bus "usb-bus.1", port "1" (high speed)
> 
> As the error message says, you're attempting to attach a full speed
> (USB 1.1) device to a high speed (USB 2.0) bus.
> 
> This is where I get a bit confused by USB. I thought that the
> controller supported both full and high speed (that's what the data
> sheet says).
>> The chip also has a USB 1.1 controller (UCHI) hasn't been enabled for
> the ast2600. There's also no qemu model hooked up.

It shouldn't be too complex to add. We might need a SysBus version of
the UHCI model.

>> The intent is to have two such QEMU instances talking over emulated
>> usb-net (the other instance would do a connect on the netdev socket).

I would setup a libvirt bridge on the host and run with : 

 qemu-system-arm -M ast2600-evb \
    -net nic,macaddr=<mac>,netdev=net0 \
    -netdev bridge,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0  \
    -drive file=<file>,format=raw,if=mtd \
    -serial mon:stdio 

It's also perfectly possible to run a pool of Aspeed machines as VMs 
under libvirt.

C.
