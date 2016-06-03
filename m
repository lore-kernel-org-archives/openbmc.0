Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com
 [IPv6:2607:f8b0:400d:c04::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLwJF2bZDzDq66
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 06:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=O3+vRAIL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=UEOv53zc; 
 dkim-atps=neutral
Received: by mail-qg0-x241.google.com with SMTP id z67so2518122qgz.1
 for <openbmc@lists.ozlabs.org>; Fri, 03 Jun 2016 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Hdwkm5CX9HfDTt2yKt2dsmHtIJO9syoW7XLhgxmbmbY=;
 b=O3+vRAILEiHNK/Z2+pCIYvyCIsqPtbT7p9X1pL+Y9lrPDIZUU+Ysl9KabO3EAbms4u
 QlePxA641TWl7aLyuD0orxVMZjaVb7vgbyRuga5ooqKewTBCo2sagW56ZH+2IS7LzZjG
 1uSfUOoE5fOnLxQpZHlWEVmqpwzhgn7egBADgRZV3kUsJcTvhx7ULCQ6u/f3fUsyHGlf
 TxEHFBeumFYt4tkYTE1+9lwj459VvfyU2wIrf0js6YHey+snLHlECTvwHQwWtdqMkxt8
 mwfpRNbZK/aNS3cSsJAT7KHv2/oPWKZSSU/vLBEUVCauAtJRKBQPNB2Xv6hAk+XqXq8b
 OTVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Hdwkm5CX9HfDTt2yKt2dsmHtIJO9syoW7XLhgxmbmbY=;
 b=UEOv53zcIH5ilxAICjExWLhY3avFvZm+2sdUE/MbikrWMdWbdLb3d6t3J0VJ866Aty
 Pb/ahxqBptTqCx77drEyNiQFTfeoeV5iCbn2w0WkJMl03X6WXCHCH4VUEf65juDgNsCi
 9FsmkRKOericEzGbZtK9SLF9cc3KYJwrrlddA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Hdwkm5CX9HfDTt2yKt2dsmHtIJO9syoW7XLhgxmbmbY=;
 b=HACa0U8pt7fYbRIBeH36VwzaTiv94wKGm3dljrRE0pB72eyjPBbE+gVZFNaJ9RK5RL
 1Mlrja5xDIpEKx6RrCIjmwz0Yl0vBgrS3RmoDF3ndSSCMcrqLZjP2j1cuyUI0iqjBcWi
 g8kLaHUILZB5abC+Nd13Twx6rePwIz5Rj1r9zGLzgum1Huv6utVMzcf1OxVyyy9njI9+
 52PVw85qW6v5EVj123V74aeVU75KF9AjAzCPIQsjrrT14b5LypsapRzY2OkPzTisbjAK
 ecLa5mtzBKdnJRyxTUOxCL9ELIROB8MmB8d1kUqtA3tKQ9LJWFZ7VEsZdJyufNcbBwPA
 +oPw==
X-Gm-Message-State: ALyK8tJs2LQAtNYz3kG5rvud7MoCj2Z395X/WUmSCT2UmvsfJPEXGIe4WrSoAE2PsScQT8gLj1CfQh8gMgtLxw==
X-Received: by 10.140.37.21 with SMTP id q21mr4850566qgq.69.1464984778362;
 Fri, 03 Jun 2016 13:12:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Fri, 3 Jun 2016 13:12:38 -0700 (PDT)
In-Reply-To: <CAPLgG=kyY-gfV7nqwWx16FSWXML-mxOCsiG2YtWvD7NGjinZCA@mail.gmail.com>
References: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
 <20160602022644.GR19968@asimov.austin.ibm.com>
 <CAPLgG=kyY-gfV7nqwWx16FSWXML-mxOCsiG2YtWvD7NGjinZCA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Jun 2016 15:12:38 -0500
X-Google-Sender-Auth: 5kJpMQJ74haWFnDRnP8x4Z6j9EY
Message-ID: <CACPK8XeLH1pM1+cmB02tYK9iSJqS6ZSwBduyxRKy-3x+SrBYOA@mail.gmail.com>
Subject: Re: Roadmap for AST2500?
To: Rick Altherr <raltherr@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Gavin Shan <gwshan@linux.vnet.ibm.com>, Teddy Reed V <teddy@prosauce.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2016 20:13:02 -0000

Hello Rick,

On Thu, Jun 2, 2016 at 1:05 PM, Rick Altherr <raltherr@google.com> wrote:
> AFAIK, Zaius will have an option for NC-SI in addition to an on-board PHY.
> I suspect there will be some work required for NC-SI with the NICs Google
> will be using.

We've got a proposed NC-SI stack in our kernels we're using for
Barreleye and on a ast2500 based system. That's been worked on by
Gavin; he's keen to find someone who works in the Linux network stack
to provide meaningful review.

> Are you planning to stick with 4.7-rc1 as a base for AST2500 support?  I was
> expecting to start from a normal release such as 4.6.

We tend to keep moving forward so any work we do is relevant for
upstreaming. I have some basic aspeed support upstream in 4.7, and I
moved our drivers up so I could test this. As I didn't run in to any
trouble on the evb when testing we're running with 4.7.

I intend to continue cleaning up our drivers and submitting them
before the 4.8 merge window opens. Assistance on this front is
welcome.

> I'll ask one of my people to start looking into u-boot.  I know we need to
> do some work for Google-specific changes but we should also be able to help
> with getting the Aspeed changes cleaned up for upstream.

We've got two people working on that front. Teddy has been focusing on
the ast2400 and sent some mail to the u-boot list relating to that
today.

Cedric has been focusing on ast2500 support. He has that booting on
Qemu and will try that on hardware next week.

Finally, Brad has added a ast2500-evb board to our poky tree. Expect
to see patches for that on the list in the next day or two.

Cheers,

Joel

>
>
> On Wed, Jun 1, 2016 at 7:26 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> Rick,
>>
>> Joel has been working on the AST2500 support for the kernel. I believe
>> his current working tree is here:
>>     https://github.com/shenki/linux/tree/dev-4.7
>>
>> We are currently using the u-boot from the Aspeed SDK without much
>> (any?) change at all. I think this is his tree for that:
>>     https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500
>>
>> We are also in the process of creating the AST2500 BSP recipes to pull
>> this work all together. You should see some commits in the next few days
>> for this. In the worst case, it will be up by the end of next week.
>>
>> One area of need we have is taking the u-boot changes from Aspeed and
>> getting them cleaned up, applicable to upstream master, and sent
>> upstream. Joel and Teddy from Facebook have both done a little work in
>> this area, but I think both of them have been busy with other tasks.
>>
>> Have you looked at support for Zaius' NIC for the BMC? Some of the
>> systems use an NCSI shared interface and some have an independent PHY.
>> This has tended to be a "problematic" area for both u-boot and kernel.
>> If you're not using an already-supported interface there will be code
>> you need to write there. U-boot isn't required but is handy for netboot
>> in development.
>>
>> I don't have the roadmap ready for the userspace work we are planning to
>> do. There is a significant amount of work we have planned over the next
>> N months for a machine we are developing in a parallel time-frame with
>> Zaius. I am really striving to get this all out on Github so we can
>> coordinate this work with your team, but had some snags that I am
>> working out.
>>
>> I am going to be in town next Wed 6/8. We can discuss some more on the
>> userspace plans face-to-face. Hopefully, I can get our plans for the
>> next few months published in Github by the end of this month.
>>
>> On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:
>> > For Zaius, Google and Rackspace's Power9 server, we'll be including an
>> > AST2500 and plan to run OpenBMC.  I have a few people on my team
>> > available
>> > to contribute to AST2500 bringup and Zaius-specific OpenBMC development.
>> > I'm trying to figure out what all needs to be done, what AST2500 work is
>> > already being done, and where my team's contributions can best be
>> > utilized.
>> >
>> > I know Xo Wang (xow@google.com) has already been talking with some of
>> > you
>> > about the kernel work needed for AST2500.  What is needed in Yocto and
>> > the
>> > userspace apps?  I can easily put together a AST2500 bsp layer but
>> > without
>> > a corresponding kernel, that's not particularly useful.
>> >
>> > Is there a published roadmap somewhere?  Where do you see the biggest
>> > need
>> > for help?
>> >
>> > Rick
>>
>> > _______________________________________________
>> > openbmc mailing list
>> > openbmc@lists.ozlabs.org
>> > https://lists.ozlabs.org/listinfo/openbmc
>>
>>
>> --
>> Patrick Williams
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
