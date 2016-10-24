Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2KHV4YVlzDvZ6
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 13:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vAyVv6kW; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id e5so6654950ywc.3
 for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2016 19:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sUhwevrwuYOgaNoHrFmeGKN0b4VJAIRYFYqi8fIFA7c=;
 b=vAyVv6kW7iwMBM9W8I4+7BhTiO9WrLJFrcZ5o+rNvDbseZc0d554FqC9xNTN+YwbWi
 NopPFlGlXk/QcLz2r9wmRe8qEk6wveeEk10MJVxkyJzDODfKm97p+S5ryDdK7snKVhQq
 4ggwU8RVezbiPSWQiSsEiQO7Aw/UPIBKGqL+j832SD/TEsPsKwZMe8ZMrwC5BBtnm1gd
 0UFKzAmSQo7iBvlx3SuSCkxPviLOSrOt5RIExitmHBFxaXKJBatT6QMXnZA2tbX1LfLM
 78jLlgwIb6FiN0B8gVKtCfDuCNZG3YxxDCXzjRmtuQsrG2AnkuR941PsSC+fp4KHMMXm
 ePdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sUhwevrwuYOgaNoHrFmeGKN0b4VJAIRYFYqi8fIFA7c=;
 b=k1iQSrJu+z7UlM6h5rdhJ3lFRBckZwvf/IhSo2LqAZRrCqNQSHXPb3ekok5ZW0T4eQ
 GzEbPuNv58ti/f/vjX4B7dmAt0+JFFOTFh8/BB9dXMM3V+pAVDy30VhedNaRXcOqz+3x
 NoWFr5hMiEjQ2QXME88QTFleSuWeYU2AdxSI1AAQP0LHzRc34BfS362cQhK9FyOuJ1u8
 47Sb5HSFgSeubyRGF0B2UBDRlb+ujbAdPxbhLFKYp5Y23rzWu+5FeWfRq4xCG+WPw2dU
 BqLgKMPZWUosHWqDquzlazx8jICP8UEXgLJz/e5MJV+OSXA/9UOD9Nu6qG66Z+50WMXj
 HRmA==
X-Gm-Message-State: AA6/9Rl8GRgE9mSMcXaQYpO25bEFL3CJlthGPF1IRFo9xpDCAfjcKm4me3kAT8gjqSOEueFCtz/xUX+61hFlCA==
X-Received: by 10.202.81.204 with SMTP id f195mr11285531oib.137.1477274420288; 
 Sun, 23 Oct 2016 19:00:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Sun, 23 Oct 2016 18:59:59 -0700 (PDT)
In-Reply-To: <1477097158-139095-1-git-send-email-kunyi@google.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Oct 2016 12:29:59 +1030
X-Google-Sender-Auth: k4ZblagXhD6pvHHs93TalkKANSs
Message-ID: <CACPK8XfvnDMEpjZspR7mH-xusANYsvmhC4Y8PD0jOagXRMz=+w@mail.gmail.com>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
To: Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 24 Oct 2016 02:00:23 -0000

Hell Kun,

On Sat, Oct 22, 2016 at 11:15 AM, Kun Yi <kunyi@google.com> wrote:
> Hello,
>
> I'm looking for feedback on a simple Aspeed SPI1 mode control driver that does two things mainly:
> 1. Expose a sysfs interface for userland control of SPI1 interface.
> 2. Optionally override the SPI1 mode at probe if "start_mode" is configured in
>    device tree.

Why do you plan to override the mode at boot time? Is this for firmware updates?

We plan to move away from having the NOR flash accessible from both
the host and the BMC for all platforms. There's no good way to
indicate ownership, and the Linux mtd subsystem does not have a good
way of relinquishing nor reestablishing control. For instance, there's
no way to "unmount" the MTD device, and there's no way to force a
re-scan of partitions if you modify the layout.

I think there are some issues with your approach that break
pinctrl/pinmux that Andrew will highlight.

Cheers,

Joel

>
> Aspeed 24XX/25XX support three interface modes for their SPI1 interface,
> which can be configured via HW strap register. In the typical case of connecting
> a host flash chip SPI1 interface:
> - SPI master mode makes BMC the master to the host SPI flash
> - SPI pass-through mode make whichever external SPI interface connected to SYSSPI
>   be the master
> - There are also "disable" and "debug" modes. Aspeed 25XX specified the debug
>   mode is reserved though.
>
> In particular, SPI pass-through mode would enable an external SPI master to
> directly program host SPI chip and possibly serve as an alternative way to LPC
> for host CPU accessing SPI flash. I think by providing a sysfs handle, userspace
> applications can have a flexible way to mux host SPI flash ownership between
> BMC/external on the fly.
>
> Overriding the SPI mode at probe time can be useful to make sure 2500-smc flash
> controller always identifies the flash chip and create /dev/mtd files correctly.
>
> I wrote the driver as a standalone misc driver for the ease of initial implementation.
> There are other options such as merging the functionality into the SMC driver
> itself, possibly enabled by optional device tree arguments/nodes, but I just want to
> send the patches out first to gather comments on perceived usefulness of
> the feature and how you think the driver should be constructed.
>
> Feedback greatly appreciated!
>
> Regards,
> Kun
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
