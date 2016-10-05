Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spfwS6t7czDqQq
 for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2016 13:33:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ycJnRCAv; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id b186so3000929vkb.3
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 19:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uf8bSkdBMFzz6VJl89nog6ih5dZ8+A9VsbutPJ2JsAw=;
 b=ycJnRCAv0YepLZn8njUfjzcISHnpFxb9LrFnUHRVJ6l/mwrSFrpG3yctnJRwBKwRYF
 aynTnBc+fpKiRgftsgVusyA7tbbzQbyxKGwWaxzaAeDFtWNFtztW4X7dupGYXYlw+Jk9
 lLCTqIkvj9+PtlhYZBs7dzGL8QV7kbJfEf76rJLb4msvtmFd7gQjed3b2cRQ1JT+mqBc
 35VGN3R89oJ6lIfDpB2zrBCWuPH6rMogjHq5eu0ZtZ/VAiymJxSdTgP3gFAM6qCeN9oq
 jBx64+SB/Nf7MXRZb+XBFPFikzIv2u1gxql3j/1Po+YiQnNixlEk7ptZ2y662SVvXWzE
 pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uf8bSkdBMFzz6VJl89nog6ih5dZ8+A9VsbutPJ2JsAw=;
 b=RMtiEi8elSnKNXhmgCHKXmzcsNCb7/BQv2/lzT17A2REIXJrhkME/66BniKZZw4/HQ
 jJwcThV3t/INCIQ7BUbn2RfpzVTiKJiCiCkNdGqEacUxaIjvkAulp8xizOjinVbLH1y/
 nHUqtUQR/6rWP5nbtu/3J6X6OPJJLhOPVD0mX9860r/GBjumJi4uj51e28VMbNoYVOfY
 tQaum0F1cSdeCMSgVdRzE1aYlIfvXiXappItZ38UQTKH22Ijgg5zYiOtI2jdTCjwRqMq
 0HgYW1g8TEarslUPUedl/CoEy1OaDwRFidfa1t8MCgHKNzh9Lp3a7/DF3+caSuY8Z6rR
 p/VQ==
X-Gm-Message-State: AA6/9RkDgss1Ndhyy5fdKq9QIbfMcvNiyx1Thr6p0fV5wKh5BDmOCoqv7oY3JuSoxp/a4E4dKpQlUnaVZxJ3+A==
X-Received: by 10.31.4.195 with SMTP id 186mr4897625vke.82.1475634806765; Tue,
 04 Oct 2016 19:33:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 4 Oct 2016 19:33:06 -0700 (PDT)
In-Reply-To: <CAFR_W8rhiDOkP9RmhgybTMy7X6TUytYqWhU_MUeh3nmj=an0Lg@mail.gmail.com>
References: <1474998214-12720-3-git-send-email-maxims@google.com>
 <1475527322-95220-1-git-send-email-maxims@google.com>
 <915d2b6a-6275-0053-836b-713de89200f2@kaod.org>
 <CAFR_W8rhiDOkP9RmhgybTMy7X6TUytYqWhU_MUeh3nmj=an0Lg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Oct 2016 13:03:06 +1030
X-Google-Sender-Auth: 36KiZUAm5Sm8wBlQUlrW3cASP4c
Message-ID: <CACPK8XcOTVAGfzPtoaFhd=7qWS7F1VmCdma83dfcL7uPuuUUQw@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5,g4: I2C driver.
To: Maxim Sloyko <maxims@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 05 Oct 2016 02:33:29 -0000

On Wed, Oct 5, 2016 at 10:45 AM, Maxim Sloyko <maxims@google.com> wrote:
>> On 10/03/2016 10:42 PM, maxims@google.com wrote:
>> > From: Maxim Sloyko <maxims@google.com>
>> >
>> > The driver is very limited: only single master mode is supported
>> > and only byte-by-byte synchronous reads and writes are supported,
>> > no Pool Buffers or DMA.
>>
>> I don't think this is a problem for the moment.
>>
>> You should add your SoB here :
>
>
> What is SoB?

Signed-off-by. You can read more about it here:

  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches#n420

I recommend having a read of the SubmittingPatches as well as
http://www.denx.de/wiki/U-Boot/Patches. While every rule has it's
exception, it's good background for what is expected.

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches
http://www.denx.de/wiki/U-Boot/Patches
http://www.denx.de/wiki/U-Boot/CodingStyle

>> > +
>> > +static int ast_i2c_probe(struct udevice *dev)
>> > +{
>> > +     struct ast_i2c *i2c_bus = dev_get_priv(dev);
>> > +
>> > +     debug("Enabling I2C%u \n", dev->seq);
>> > +     ast_scu_enable_i2c(dev->seq);
>>
>>
>> I don't see that routine in the u-boot openbmc uses. Which version
>> are you on ?
>
>
> It's in another patch that is also under review. SCU helper functions or
> something like that.

You can make it clear by sending these patches as part of a series.
Make them sequential commits in your local git branch, and then use
git-format-patch to create a sequence of patches.

Your sequence should be bisectable, that is, at each point in history
the tree should build (and hopefully boot). You can check this by
using git rebase interactive's executable flag.

Cheers,

Joel
