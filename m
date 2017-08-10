Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSc9z3fpMzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:28:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="srVdi1Go"; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id g131so80512767oic.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uVUMj6VHUbWxNJRGOmuaLChbYJ5YZv+WnWNzUMFMNnQ=;
 b=srVdi1GolQeoBNcI9n9wG46n20rHytPQl6dfm1cF/79muvY4eRPtTZyW1utSZgQ4Wf
 fTEo+ugDyg7yYF3eBPcnIXTvSpbfCs11tiP97neEf/6osv85M4MgTgDDZAWfKp6vN2hf
 fu548szTCoBlHwmY86j32wy0U3j1+Dk1KpdgBmTy98HmfhkuXxEpjOzkfb+XcOkc7fvs
 7yxbTk5x28NtFuqBZ98qD6rEA4qcOqwRpSd1vb7jxSAkTSenFK+S6q7fWws+e1cmwWIo
 e2BYmM7DEKeHoS7SBsJiePUSb/lNiULqrAeoB/ob8lusJsUpjiVCMy3aNJ0nEaNupo9d
 zCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uVUMj6VHUbWxNJRGOmuaLChbYJ5YZv+WnWNzUMFMNnQ=;
 b=eiMq3G/DXlAHif2iyQPG692eN10xD1t7THxcMl/uvgOqxq4WLxPt86EaUqY8LbZokf
 HVVgaPp6WIFDYQf/diMAHye+/3B9gRUIDrSCK9SirPiW51glcnH0p0YKytL4a0TyG0hI
 hvxbb7HcbEU0w0/pB+C4fCnVw+uuuT890V5xoevq3eEhKtFdUEu4xRFCQ5odV0Z0RTJP
 B0X9BsnFCQXASltBEBXYXlhgC6+5E3kplgd54YsQ27KG45PuF++OAA/CkNqDHvk0WIw4
 ZG7XBCqjH29Jd2hNHE6ca9PP2i7HcgPNSRDV57yjDUv7mh9P3bcJiBTuf8AG7/dSnEL/
 9V/Q==
X-Gm-Message-State: AHYfb5h0T4/iJmpGjJpZwV3W+O6j2+3T8c2mv7cZuHDWNGH/v+txwSoY
 EqSzN2uBUkVojGrn2jt8MAxpTuDprZ4h
X-Received: by 10.202.86.77 with SMTP id k74mr11129029oib.213.1502342916553;
 Wed, 09 Aug 2017 22:28:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Wed, 9 Aug 2017 22:28:36 -0700 (PDT)
In-Reply-To: <9c0aef7c-6dcc-2328-f712-d35ef81ebc41@gmail.com>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
 <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
 <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
 <CAFd5g47FmTiygHDjm0-h2NAz8qa85zZVLKgCf9vGYP8iK6_+ZQ@mail.gmail.com>
 <9c0aef7c-6dcc-2328-f712-d35ef81ebc41@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 9 Aug 2017 22:28:36 -0700
Message-ID: <CAFd5g45BYV702x+PnN5DWcXo=P+yU=zhSEHJA21=z_gP8QD_Xw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: Corey Minyard <minyard@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Benjamin Fair <benjaminfair@google.com>, 
 linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 10 Aug 2017 05:28:40 -0000

On Wed, Aug 9, 2017 at 7:26 PM, Corey Minyard <tcminyard@gmail.com> wrote:
> On 08/09/2017 08:04 PM, Brendan Higgins wrote:
>>>
>>> Perhaps that is some level of abuse, but it's pretty common.  I'm not
>>> against it.
>>>
>>> There is standard IPMI firmware NetFN (though no commands defined) that
>>> if
>>> you use
>>> the driver automatically goes into "Maintenance mode" and modified the
>>> timeouts
>>> and handling to some extent to help with this.
>>
>> That is a really good point, I missed that.
>> ...
>>>
>>>
>>> There are ways to accomplish this that aren't that complex.  You can
>>> create
>>> an OEM
>>> command that can query the maximum message size and the ability to do
>>> sequence
>>> numbers in the messages.
>>>
>>> If messages larger than 32-bytes are supported, and the host I2C/SMBus
>>> driver
>>> supports it, you could use the standard SSIF SMBus commands to do this,
>>> they
>>> have an 8-bit length field.
>>>
>>> If sequence numbers are supported, The SSIF could use different SMBus
>>> commands
>>> to do the write and read requests.  Since this is only if you get an OEM
>>> command,
>>> and if you put the sequence numbers at the end where they are easy to add
>>> on
>>> the send side, this is a small change to the driver.
>>
>> What if we just had an OEM command that changed the message structure from
>> that point on? We could abuse the "maintenance mode" NetFN to get back
>> into
>> normal SSIF if necessary.
>
>
> Actually, I wouldn't have a separate "openbmc mode".  I would have OpenBMC
> always
> work with standard SSIF, and have separate SMBus commands for messages with
> the sequence number and messages larger than 32 bytes.
>
> I've attached a patch with what I would expect the changes to be to the host
> driver.
> It doesn't handle multiple outstanding messages, but it shows what detection
> and a
> separate SMBus command would look like.

I took a look at the patch, it seems reasonable. If I was maintaining
SSIF, I probably
would not want that kind of clutter for my admittedly weird use case,
but if you're
okay with it, then so am I.

>
>
>>> So I think the changes would be small and contained.  I'm actually ok
>>> with a
>>> different driver, but I think it would be more valuable to the OpenBMC
>>> project
>>> to have a standardized interface that would work (in a not quite as
>>> efficient
>>> mode) with software that does not use the Linux IPMI driver.
>>
>> I guess I see the all of my asks as hacky things which we can hopefully
>> remove
>> at some point. Hopefully, most OpenBMC users won't want or need these
>> things.
>> ...
>>>>
>>>> Regardless of what we do with the "BT-I2C" stuff, I am still interested
>>>> in
>>>> what
>>>> you think about this.
>>>
>>>
>>> I think you are right, it probably belongs some place else.  The way that
>>> makes the most
>>> sense to me would be to have an "ipmi" directory with a "host" and
>>> "slave"
>>> side, and since
>>> ipmi is not really a char driver, to move it to the main driver
>>> directory.
>>> That might be
>>> fairly disruptive, though.
>>
>> That was my thinking exactly.
>>
>>> The other option that makes sense to me would be to add a
>>> drivers/char/ipmi_slave directory,
>>> or something like that, and put the slave code there.  That would be less
>>> disruptive.
>>
>> Right that is the approach I took, except I called it
>> drivers/char/ipmi_bmc.
>>
>> I originally thought doing the less disruptive thing is best; however, I
>> know
>> there are also some OpenBMC people who are interested in implementing
>> IPMB. So maybe now is the time to bite the bullet and create an ipmi
>> directory under drivers/.
>
>
> I'm not sure IPMB would make much difference, there's no host side change as
> it's
> already supported.  I don't think there would be any significant code
> sharing
> between the two.

No, I don't expect much code sharing between them. I just thought it would be a
reasonable place to put IPMB, sort of like how we have a bunch of "character"
device drivers in drivers/char, but I suppose that might be somewhat of an
anti-pattern ;-)

>
> If there end up being a significant amount of common code, then it would
> definitely be worth the effort to move it.
>
>>> -corey
>>
>> In summary, I think I can live with making it a mangled form of SSIF, but
>> I would prefer to put it in its own driver.
>
>
> You can look at the patch and consider it, and consider that you would need
> to
> implement flag and event handling.  On an x86 host there would be SMBIOS
> and ACPI stuff to deal with somehow for discovery.  There's probably few
> other
> things to deal with.
>
>> In any case, I think I would rather focus on the the BMC side IPMI
>> framework
>> now, since it is a bigger change and would also reduce the work of
>> implementing a BMC side SSIF driver.
>>
>> Here is what I propose: we focus on the BMC side IPMI framework RFC that
>> I sent out the other day:
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1463473.html
>> I will add a change to the BMC side IPMI framework patchset to move all
>> the
>> IPMI stuff to the new drivers/ipmi directory as discussed and then drop
>> the
>> patch in that patchset that depends on this patchset.
>>
>> Let me know what you think
>
>
> Let's hold off on the new directory, there's probably some convincing of the
> "powers
> that be" for that.
>
> I'll look at the patch set tomorrow, unless something critical comes up.

Sounds good

>
> Thanks,
>
> -corey
>

Cheers
