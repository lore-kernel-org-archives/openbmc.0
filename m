Return-Path: <sjg@google.com>
Received: from mail-ot0-x230.google.com (mail-ot0-x230.google.com
 [IPv6:2607:f8b0:4003:c0f::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v455b5GtfzDqHH
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jan 2017 00:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c+qpNczF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="SlN232VI";
 dkim-atps=neutral
Received: by mail-ot0-x230.google.com with SMTP id 65so32311628otq.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 05:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=k0Djzv8NvfTbFbKeB7meDTqI6rH1CcfO9rMnl/XPMps=;
 b=c+qpNczFWgrJ9CbC4Xys0bZzcNOwekNBtmVrCDCcre1xsptxT/4T8KfwOhuhwFcDvU
 y9gfMxPSwyk3b4xUwv8VzUcHaw2kBbc9aSA4NdNTVyBCWrY5ekYQiVOkhqzkC3UKwbPf
 bf8HMtWrWLuqwnHte/rvG3eBj1I5F8EW6PKOQfkpfZ/yfk22NtePk73zl2Gw+Gc6c3+n
 VAYJCk+NGJL9CQJHXsRVAvRLA8qKtAN45s69l9aj6aenk8u6k19xrwb3v3gGcZrzA+cD
 L9WLaocgfkje+VJmGo75BfWIPWLxpywsNALdtbkB0VO45SKHbZy4OIv8t/Z00opWdnns
 ynUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=k0Djzv8NvfTbFbKeB7meDTqI6rH1CcfO9rMnl/XPMps=;
 b=SlN232VI2rFxPXBjBTXQcZQQft1sCN0SDzOgUjMT7uNb0W9q4vSM1wQRYo2FL4ScbZ
 uNaZv1LKR9XDeTOqqMJN2UOQ5TNhnfr5b0NcIXX6YHKRWCKvtQMJo2DK8U9nFZWVmIzX
 1g2z48RNyzBuIcdmvuSBLAY/lkfB5OoTTvZhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=k0Djzv8NvfTbFbKeB7meDTqI6rH1CcfO9rMnl/XPMps=;
 b=VLPE12izM1YlBs7MIng+ghSC5gEuPLn8ad1Q1TR3Yd+J1Q8JafdeMsigkyoEEXmA/a
 iGdj1G/bUafa3Pb8PWIthwS4iv81TsuC5HXScNsJpA/ATJBUhdteFbWJbNvmXIdMHkfW
 1dQwMNjvWpqAyzB8Z/NYenm1qhm2f9hk+ENthcjBeD5WqzFlMMdd41q/RmNWUVbw2LGk
 Yo/ABefZHUPgSBYAKjAKHvR7EEYt3xcUI3ZrJQoMyZSZNMdNzfG1xJA6nfFfEwqUTBm7
 wDqSfJI/QQ3gbCbwhQ8vfM7831HfHMUs79VpKxQ8dk9TW/bhG/ZQjpwYqtFN3epGhLfz
 60gQ==
X-Gm-Message-State: AIkVDXLHwlvje3nt9X5+dy7hMKTHp9sZzNvf1JIdSd6G+bsdVem2z11zCZbjnpb6PQuMA7gqTLrb/gjh12I7zTKy
X-Received: by 10.157.7.193 with SMTP id 59mr4031875oto.191.1484834289289;
 Thu, 19 Jan 2017 05:58:09 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.60.230 with HTTP; Thu, 19 Jan 2017 05:57:48 -0800 (PST)
In-Reply-To: <CAPLgG=n4YJXe65oirFCsBHPU5v+5BXqJ4W9JjAA6hhVdP0ZCiA@mail.gmail.com>
References: <20170112021328.27200-3-raltherr@google.com>
 <CACPK8Xd3LtSZ3i_r19AZtVMxRLxXnQwOw8oQc+eS7b5iJvWS9A@mail.gmail.com>
 <CAPLgG=n4YJXe65oirFCsBHPU5v+5BXqJ4W9JjAA6hhVdP0ZCiA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 19 Jan 2017 06:57:48 -0700
X-Google-Sender-Auth: 9EkFEhp4LLGhZNQCk2ibULADRCI
Message-ID: <CAPnjgZ1Ls8fc9r=FxUDnOv6RsbrOi73ja6En6CWPShPzjCHCNw@mail.gmail.com>
Subject: Re: [U-Boot,2/2] aspeed: use FIT-provided ramdisk if available
To: Rick Altherr <raltherr@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Jan 2017 13:58:12 -0000

On 17 January 2017 at 16:33, Rick Altherr <raltherr@google.com> wrote:
> I couldn't find any prior examples.  I'll ask upstream what they think.
>
> On Mon, Jan 16, 2017 at 4:33 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Thu, Jan 12, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
>> > If the kernel FIT specifies a ramdisk, use it.  Otherwise, expect a
>> > ramdisk at 0x20300000.
>> >
>> > Signed-off-by: Rick Altherr <raltherr@google.com>
>> > ---
>> >
>> >  include/configs/ast-common.h | 6 +++++-
>> >  1 file changed, 5 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
>> > index b39ea33ce7..110c780070 100644
>> > --- a/include/configs/ast-common.h
>> > +++ b/include/configs/ast-common.h
>> > @@ -96,7 +96,11 @@
>> >  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts
>> > here  */
>> >  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of
>> > Environment Sector */
>> >
>> > -#define CONFIG_BOOTCOMMAND     "bootm 20080000 20300000"
>> > +#define CONFIG_BOOTCOMMAND     \
>> > +       "fdt addr 20080000; " \
>> > +       "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk;
>> > then " \
>> > +       "    bootm 20080000; else bootm 20080000 20300000; " \
>> > +       "fi"
>>
>> This feels a little clunky. Is this the method upstream suggests to
>> solve this problem?
>>

Clunky, but it works. In general people don't mind too much what you
put in your own board scripts.

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon
