Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyw501VH0zDqN5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 14:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dWFCGTAN"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 23so4143842vkc.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 19:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l0wOqf49GyN84VDGooKn9fpzDGUpYF+wvEPICPVZI/w=;
 b=dWFCGTANXSjIy+6NFKD5stws+yON2MCf6E+njmMDqdIf9TXsdob/X/p1Wahn6P3nLV
 22w+ICeQPIwayu8CYTcxo7ks0DGFz7ateGZne/xlEtCbJTJpRiBi45GOYJ71IuUZEF8Z
 5x63LG6fLWxyCzgJB27r/d+bVdvfeAXqMUUQfZYEOxoQqliR3QkUsK1iORWc0wTJTrHr
 MDNzB6IUO53oVfGcn+R8cH6ss91kpfOKSfusK/KJ+m2MdpdrDeJmnyovWyq8/rl6SW94
 AlnB5WBndGlZESGbh8N+WT/nRlATYbUFmLQhuGuTN62CvvtoBrnvViPQWqZpoo3+oyzT
 tDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l0wOqf49GyN84VDGooKn9fpzDGUpYF+wvEPICPVZI/w=;
 b=DvwBeY0PXY4RpAjw9qizlrF/TnSPHNA9TRK0Q4i+diVV2fE65yXMR5MuiH6hYr3mAK
 NJI4wUDiyUc8cu4jD5in+TWmGvsAEySxdHQHBylzoRtw9dV70FEAU6ejMzLZgcZFjIRC
 zYl+7B8NnSb1WjXuFXCiBA2p3L7CUu4Fn4TxXShQEyPWwQo4E3h+m2+38cRXVOXg9VjY
 ddqB7Ow3jZJCSVj69g5SPzI+ApC39hvtA5ZRuX4NCl/48GUJj/4LNJnl4731TOS1Ryg+
 Bfc/ZywzE3hRwQ75ShzEi+knVEJ1tEnvBQkJxgboqWGzLiMbWiCQfOCjsyUN8KPXv6Vs
 9SrA==
X-Gm-Message-State: AIkVDXL8QO512DIFBWoqW8IqGZt9RgHY+H6t16bcgs37SiBhmHmKhwfkSIsSeaX8+zbCobJhMpecUbTFag5z0g==
X-Received: by 10.31.47.82 with SMTP id v79mr3260169vkv.2.1484106881941; Tue,
 10 Jan 2017 19:54:41 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.73 with HTTP; Tue, 10 Jan 2017 19:54:21 -0800 (PST)
In-Reply-To: <CACPK8XcEuN6mF5Ex0bPExkYnTYVL9Yz5M=rYbojDRicHLwjf1A@mail.gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
 <20170110090640.12608-6-cyrilbur@gmail.com>
 <CACPK8XcEuN6mF5Ex0bPExkYnTYVL9Yz5M=rYbojDRicHLwjf1A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jan 2017 14:54:21 +1100
X-Google-Sender-Auth: 1SolYhsC7cfjQUQeXIMd83wKrpc
Message-ID: <CACPK8Xdo3g9_vOV3PHfnLuO43dAdR2w56q5rrtTQYuQw_hW1_g@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 11 Jan 2017 03:54:44 -0000

On Wed, Jan 11, 2017 at 11:33 AM, Joel Stanley <joel@jms.id.au> wrote:
>> +       if ((file->f_flags & O_NONBLOCK) &&
>> +               !(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
>> +                       return -EAGAIN;
>> +       else if (wait_event_interruptible(mbox->queue,
>> +                        mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
>
> You read MBOX_BMC_CTRL twice. Is that intentional?

In fact, you keep reading it forever thanks to the magic of the
wait_event_interruptible macro.

Carry on.

Cheers,

Joel
