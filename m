Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EVU3rCkY"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FseEXQAu"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4112jK3wHvzF30l
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 19:01:40 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id y31-v6so5537296qty.9
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WOIoI8nPm/UVXNb4VO8GBd/SnnthyFsaFGb9IfcMrfA=;
 b=EVU3rCkYgOWjyZ+FF/jbpG3B/6oGsnrzOz/Z6c43LXwlvZKURDkG563EPrjpSyr25P
 cvQWpbujKeD3WpXc5M5xbSMSaYn3Px+awjbcMwfImVf6VodmGVPyGCncHNPjLXNeTWyx
 es5nNPeUP85ZfXvFIxYcUOgLTlic2OLPb8AoJq+1FzdGWDQcSUjFUwaiidKyP/aLt6Q3
 eqSFOIFziBJnx7rCpYaVutR49fjFZC+Li5aP1jPjbyHhXxjDg0THoX8XGq57hI+XBbht
 HZqdnswOIlP45ThEk0w+IsD+X1zcpycuzTYnOzNdrclgQQnV40HXQfc7j7qhwetMrdln
 c4NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WOIoI8nPm/UVXNb4VO8GBd/SnnthyFsaFGb9IfcMrfA=;
 b=FseEXQAuAUoOwOWcxS3+LOteNfBO9bW9WQIDn0GPrNVt0h2Fu5yU/I1dra1ZGtU8RN
 6E4aLWfqXxDyvDzVZN2/3+oghHyUKmtZIVnzp6llFQfU5Hr6WJyW8ksS91qIh/S7JmvO
 Kzs9VygsJcvWDH+nmsbGGEdegKipaf372LhIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WOIoI8nPm/UVXNb4VO8GBd/SnnthyFsaFGb9IfcMrfA=;
 b=Hhx+gQtcXXtlFHdRgmdj2KxfI0EQELdEJfdwHTsFjZhFJlr/XHeYre5lPM7Is2FZBr
 SJ0WpErz0OH/EohIBIZHK6EhAzEYy0PI7RP/O7M99ZE3BgPCtJrYQn1UVDGg+qtMQILh
 feEvuncJu+H+VjZohdNTWOreXNi9Sx5KiE6i0wnaCPfmqbzXl2nGHOMWR0uOjBroq2uI
 927CBxiWaky2z7oTzG6n4A/m1swgqLO38EZhhG/k2nZmn+FlAvYGDOvw45rtdUksCE39
 4wstPnQ69YgtTFoji0kHf++aqyaXT5GbKe3rnQLvlP4XlcOZu2sY43ZB7PmhtUgEZw0L
 DRyA==
X-Gm-Message-State: APt69E1yMgFB1tuSrnnWPXw1QpGylBdXvoY3SLBVGOsQs27YKo+Fb+Tq
 qLuaem76doXmyY4YvRntHlEKLAl9Cw/tJWAFal4=
X-Google-Smtp-Source: ADUXVKLlVgMRYFXj0z2hmw4eZmVYvdAZEzC6KWLBlpNE9SEUZvF1AHSJdw20ifrieHfdopSfCIf3QdKwtSoS3ylaj9o=
X-Received: by 2002:ac8:3b49:: with SMTP id
 r9-v6mr1961884qtf.368.1528275698068; 
 Wed, 06 Jun 2018 02:01:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 02:01:17 -0700 (PDT)
In-Reply-To: <CAG9c7cD0NLPVeoBzX3hVO226=EwBM-vypz5FJkUrteCabG-kSQ@mail.gmail.com>
References: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
 <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
 <CAG9c7cD0NLPVeoBzX3hVO226=EwBM-vypz5FJkUrteCabG-kSQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jun 2018 18:31:17 +0930
X-Google-Sender-Auth: jD4HUoVpm20LZ-bW6FJq0qcU8Ks
Message-ID: <CACPK8Xc5Zdd9LM+Ao-3Ly4c3_WDz76K-S6Xq0fky5T8m3zFyBA@mail.gmail.com>
Subject: Re: How to configure Clock Stop Control Register
To: Henbin Chang <henbinchang@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Jun 2018 09:01:42 -0000

Hello Henbin,

tldr: you need to ensure mboxd has run so the aspeed-lpc-ctrl ioctl
has been performed.

See below for my explanation.

On 6 June 2018 at 14:32, Henbin Chang <henbinchang@gmail.com> wrote:
>> What kernel tree are you building/booting? Can you provide a link?
>> Currently we've tied the LCLK to enabling LPC2AHB bridge:
>>
>> https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts/aspeed-g5.dtsi#L302
>> You may need to add the following to your dts if you've developed your
>> own:
>> ```
>> &lpc_ctrl {
>>         status = "okay";
>> };
>
> I use dev-4.13 branch (the last commit is
> aca92be80c008bceeb6fb62fd1d450b5be5d0a4f).
>
> The aspeed-g5.dtsi I use is the same with the one in your link.
>
> I follow your suggestion and add the following to my dts but the SCU0C[8] is
> still 1b'.
>
> &lpc_ctrl {
>         status = "okay";
> };
>
> Even I directly change the status of lpc_ctrl to 'okay'  in the
> aspeed-g5.dtsi,  the SCU0C[8] is still 1b'.
> lpc_ctrl: lpc-ctrl@0 {
>      compatible = "aspeed,ast2500-lpc-ctrl";
>      reg = <0x0 0x80>;
>      clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>      status = "okay";
>  };

Doing these two are equivalent. But it never hurts to try when things
aren't working :)

>
> devmem 0x1e6e200c 32
> 0xFFCDBF8B

If you take a look a the driver, you will see this snippet:

drivers/misc/aspeed-lpc-ctrl.c

static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
                unsigned long param)
{
                /*
                 * Enable LPC FHW cycles. This is required for the host to
                 * access the regions specified.
                 */
                return regmap_update_bits(lpc_ctrl->regmap, HICR5,
                                HICR5_ENFWH | HICR5_ENL2H,
                                HICR5_ENFWH | HICR5_ENL2H);


The driver is designed to only enable the bridge (ENL2H) when the
configuration registers have been programmed by an ioctl() from
userspace.

This is to ensure the window is pointing at an area of memory that has
been chosen by the system integrator, and not accidentally exposing
some BMC RAM to the host. So the ioctl for programming the window will
automatically enable the FWH and L2H bits (bits 10 and 8).

On OpenPower systems, the tool that performs the ioctl is 'mboxd'. If
you are using an OpenPower system, where the host firmware talks the
mbox protocol (hostboot and skiboot do this), then you should run
mboxd.

If you're running on another platform, you could write a small utility
to do this ioctl from userspace. I wrote one in Rust a few months ago,
but you probably want to use C instead.

Cheers,

Joel
