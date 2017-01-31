Return-Path: <xow@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCgZ93wSJzDq99
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 09:15:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SSn3fYZm"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id l126so47474515qkc.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AH5UJQ0PRhCrHr7y6cmC1F4eirGGbsxZt04wjnyDh+w=;
 b=SSn3fYZmX7p8ryaHE3XxOwGJugCOFuKQJWqXKgjhnjnpfKob3scYLskp03SysKQWpS
 K9CTHHjRCfLeUWNjPgq5l7I7RAyfcejeb0f64tcrNOapLJeAU4Z278vv24uui0BaPw0n
 F6R3aK4Z7LBfrYLaUCW2LU1E7Jo42U8qJyMnXfMSzfhjhIySvRFKPUT0rOczYs5bTzC7
 p2bztpO5MXzbez4OQi9WryfMyYSwePzqmlIM+BP8ufR0dWf1qPSnFgw9MxTnJOKXW1/I
 +22nuyjWnsV9hOBv2QLaDx42z3I12We8cC61og6D1O9mkXubVeNb+JfHS9pA70/C4Skc
 6vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AH5UJQ0PRhCrHr7y6cmC1F4eirGGbsxZt04wjnyDh+w=;
 b=h5kIx5atAZ1UucBopMS6MfAfpHKsonms3yVYDZa9B15fwX4gvF0XwAJHOULsHzwxGf
 8XCZ7Pojm5sVFIAgvvr8vN0KHCgSpoR0XM7wFB7w3OVmt71U1OoRSEsL7Syr6N10HJO4
 ZqQUVeJfL48+6ekjUG3pIR9C2MSvb+QKIAz44kH7m0DMl9oPcmvmX/PJorkSpxN4zNaT
 vFOGR0rlSLgt04u66lKxhJQQdLNSo1B4fjizBholBKpruBy4PybAeE8DRtssuYPXsFZl
 3ACcmwe6HA+SdZzj0fhHT4vd5lzoUrivRr16GstcYH+RP68SWNLZDGB09JgfXqcg0D7h
 TRqg==
X-Gm-Message-State: AIkVDXIlnV9dhqnEt1r8GeE2k/kuoN0qgi5rA5GjulXkOIRD+rHImG1FaMVX6VT0zen5ZfqFzuXL77Bu344DnPRa
X-Received: by 10.55.71.13 with SMTP id u13mr27966091qka.300.1485900942317;
 Tue, 31 Jan 2017 14:15:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Tue, 31 Jan 2017 14:15:41 -0800 (PST)
In-Reply-To: <1485825312.4137.25.camel@aj.id.au>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <1485825312.4137.25.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Tue, 31 Jan 2017 14:15:41 -0800
Message-ID: <CAPH-5w5BgnQTZ+BA1Wvhb3yuc0OsbaKba95nKgHPndpbMvFqSQ@mail.gmail.com>
Subject: Re: GPIO offsets used by userspace
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 31 Jan 2017 22:15:46 -0000

On Mon, Jan 30, 2017 at 5:15 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2017-01-31 at 10:55 +1030, Joel Stanley wrote:
>> > On Mon, Jan 30, 2017 at 12:04 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Hi all,
>> >
>> > Just a heads up that when the linked patch is pulled into the OpenBMC
>> > kernel it will break our userspace. We will need to synchronise the
>> > kernel bump with the fixes for the machine configs to update the magic
>> > GPIO offset number.
>> >
>> > https://lkml.org/lkml/2017/1/26/786
>> >
>> > The magic offset is essentially 512-(ngpios) (I don't know why, but
>> > that's the behaviour), and this now varies between AST2400 and AST2500
>> > systems due to the AST2500 having an extra bank, and also because the
>> > AST2400 has a "hole" at the end of its GPIO number space.
>>
>> Can you suggest a way to detect this from userspace?
>
> Not off the top of my head.
>

I mentioned this on GitHub, but in theory we should have at least one
/sys/class/gpio/gpiochipN directory, where N is the offset for GPIOs
provided by that GPIO device.

On a BMC not attached to GPIO expanders this directory name could be
parsed by the Python currently in use. Not foolproof, but it could be
a working stopgap.

However I don't actually see a /sys/class/gpio/gpiochipN directory on
the BMCs I touched. Any ideas?

cheers
xo
