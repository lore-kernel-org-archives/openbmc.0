Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtg1D5KslzDqJV
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 07:52:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hawpjFoD"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id p22so24114461qka.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aDqSTogkNEafUOQi5XuYIgIY29vXg0q0NgrsV40Qbpg=;
 b=hawpjFoD9c8RlFzGCFQdrWW43RcXTtuPJdMN8GS7/B81LaX5EyotXiNMTuYqZz36Ty
 4Ngvyzmhcw0/AU9UoXFdvy2Zi43Pk1x2J/5dqTRGtv35H5Cg3TEUdMFB+6Y1daD6IRBb
 JoL7L7dQxKlHcZPFQKalxZwkwqywHCiuVOpYBs6zyKUy9Cm1LFcZy2QDNUUglrqFYjSk
 HGM7tPHQ/3PfAUZg0r0InzRsbV8U5yL07LxCNxs3KDQAgepwLbxQKKPIBBmYZna/xVTk
 kr7bQLcxZtiEiUrJgMpakpuRRB9WxJlqjxaqJSFMdthG8YBKAo1eJdEl0GMCPTE6u/x/
 hAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aDqSTogkNEafUOQi5XuYIgIY29vXg0q0NgrsV40Qbpg=;
 b=jwrxnm3sVPKrOJZJLZRwODxb22z/A6VCpkWtDQWvEQNowJ3gexI3962t4h4mulPN2d
 PvdwOSFr8asVMSB+5l2AjenU7tE3Rp1lrTy+4qwlLuMfmnqXJevuzsvzNwwqIOSgvRD8
 GTz22YYEO7deg6zkl5Pb62Ulk/In5rjtbjDDse3oWO0HuQEcRNu5XhQZ0pMFjCi3rNf+
 8WoTL9ugBPlEJ4PvmhU7kYVTMyZxxQDLkIPZ8PMktTsJxlKWtJhyLeVnQX97688EDRW4
 oRCvXA1kKf57WTrjfyfk/fmsH1DNrxGK59Owms5A0EJvDl3bHiX61ncUsObsHgA5OBAo
 0VCw==
X-Gm-Message-State: AFeK/H07SpZjhCy/lTYej9M5wfX3/JzcCmhZbn7xG9K6uxwycsIIvk2PXVuQguzUvxBicYLpaHlrqNBHhxY2A5Tf
X-Received: by 10.55.1.202 with SMTP id u71mr2712263qkg.163.1490820717977;
 Wed, 29 Mar 2017 13:51:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 13:51:57 -0700 (PDT)
In-Reply-To: <1490789505.3177.184.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-2-brendanhiggins@google.com>
 <1490690980.3177.108.camel@kernel.crashing.org>
 <CAFd5g47Pij6TxkmS6akWoAL0FZ2WLh+FWUrr099RiabWn+pneQ@mail.gmail.com>
 <1490789505.3177.184.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 13:51:57 -0700
Message-ID: <CAFd5g460U4c3rMtKphxnu=OADTfD=oe8Z+JPn-H82zpHKJUqfw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Wed, 29 Mar 2017 20:52:01 -0000

> Regarding the other comment about the "fast mode", my main worry here
> is that somebody might come up with a 2Mhz capable device, we'll hit
> your 1Mhz test, enable fast mode, and shoot it with 3.4Mhz which it
> might not be happy at all about...
>
> I think the cut-off for switching to the "fast" mode should basically
> be the fast speed mode frequency (which isn't clear from the spec but
> seems to be 3.4Mhz). Otherwise people will end up with higher speeds
> than what they asked for and that's bad.

Ah, but see the documentation only says that high speed mode sets the
Base Clock divisor to zero; is does not say anything about tCKHigh or
tCKLow (clk_high and clk_low in my code respectively), which are the
only parameters which are manipulated for speeds greater than or equal
to 1.5MHz since:

# I forgot the "APB_freq /" part in the comment on my
aspeed_i2c_get_clk_reg_val(...)
# My function still does the computation correctly, I just forgot this
in the comment.
SCL_freq = APB_freq / (1 << base_clk) * (clk_high + 1 + clk_low + 1)

so if base_clk = 0, clk_high = 15, clk_low = 15, APB_freq = 50MHz

SCL_freq = APB_freq / (1 << base_clk) * (clk_high + 1 + clk_low + 1)
                = 50000000 / (1 << 0) * (15 + 1 + 15 + 1)
                = 50000000 / 32
                = 1562500Hz
                = ~1.5MHz

so maybe instead of setting a hard limit like I did, maybe the best
thing is to just check and see what the base_clk gets set to and if it
gets set to zero, we turn on high speed mode. What do you think?

Cheers
