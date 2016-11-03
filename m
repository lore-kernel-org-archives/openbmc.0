Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t91h00nBnzDvbr
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 10:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NO8A5gR1; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id 128so9478653oih.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 16:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ce7rjhQ93O5Ss9oiLLdWpY2GnytvxuriuKj2Xjliles=;
 b=NO8A5gR1kYzMm088iMZEJ6KoQ2s7wl5TYhqe7lC1c9gfjpHHQC/2N3pJzMbKg9Ip4f
 nLunmXFij1cEr+ZefHL+x+Ia8A4GK2OthR3Fqb6ElR0ASgy+MQLevoy1BJzcpi3HUKZ2
 /IV4aj6b9fZTwQgycyvgFDVhX9SVn0vUPhBO+mCGO5ReZxJNUTJLcprDvItJ0brP0Y5V
 84TO0+bPbCfgkr9Pv5/Hiu2Wkvl9mqmRhY9jiSEUyBdaaUetbqaQgz4A+F+AYhdJfcA+
 pBKKGERO+uX/KkcMPBvQ+BRAt1k1PE+MXaRj2PrQnZriRo4hCgcnnSf5w2bzYyZzpq18
 h+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ce7rjhQ93O5Ss9oiLLdWpY2GnytvxuriuKj2Xjliles=;
 b=dAg0Lfqz2pTUNFBEERQDTkpMT6cjLmEUIR//GCAAXbWWZzDWbf8bpG7jSKWsInCM2F
 s87LJ8Ptd1iJ0Rr5GuALqasjNcCuzaAv0qB/0YjmxhVwZqk6oDuH4BAZ8IDyDsnWbpYQ
 yrEFS+dpLkHikld6v8Wlgf6vEuehBzrx5pM6yYF+ojC5ZxLi5RhbTUGc5WkrWY/AYVFl
 avWWeMcOhNiUsOfNgLzURVNhyc5cq6QJ+HksfrkCeHaNDZ5ga4+sW9wkfRMrHag9rLsG
 tVvIz68gpqf1fh9944UFsnD2i4v95wnKu6aOULkKp5E2ay+mQL1L0xbkbgJt1NeKF1r4
 0zDQ==
X-Gm-Message-State: ABUngvfa0hA3wAQtVbUwOIzeBw/qRxRLyg1bcnbK/ZzCoS35p4eWNu3TSxSGCTVpDVQvu4phACXkx7c7u0q9bw==
X-Received: by 10.157.54.5 with SMTP id w5mr7602775otb.211.1478216478233; Thu,
 03 Nov 2016 16:41:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 16:40:57 -0700 (PDT)
In-Reply-To: <1478195018-132099-1-git-send-email-kunyi@google.com>
References: <1478195018-132099-1-git-send-email-kunyi@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 10:10:57 +1030
X-Google-Sender-Auth: w_AI2-jagohIVzoz_FyiJa5BgVk
Message-ID: <CACPK8XdU_2Hb+NWDU4eO41Eqk5B_oBn=Z5Z9tDLsuL2gsFfoWQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 0/1] Enable pinctrl to modify SPI1 strap
 bits
To: Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 23:41:20 -0000

On Fri, Nov 4, 2016 at 4:13 AM, Kun Yi <kunyi@google.com> wrote:
> Hi,
>
> Context: re. Andrew's suggestion to a previous RFC proposal[1].
>
> To modify SPI1 mode at runtime, pinctrl subsystem will need to add exception to
> the read-only HWSTRAP rule. This patch does precisely that.
>
> Sending this out as a standalone patch since it seems to me this change could
> also make boot time SPI1 mode configuration easier. Instead of configuring
> the strap bits in mach-aspeed/aspeed.c AND make sure device tree pinctrl
> settings match what was configured, with this change device tree entry
> should dictate default SPI1 mode regardless of what's set previously. E.g.
> following node will be able to configure spi1 in master mode.
>
> &spi1 {
>         status = "okay";
>
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_spi1_default>;
> };
>
> I saw Joel sent out a patch that configures SPI1 to master for every AST2500
> machine, do we not have any uses currently for other modes?
>
> [1] https://lists.ozlabs.org/pipermail/openbmc/2016-October/005194.html

Not presently. All of the other systems have the BMC as the owner of
the flash, and any operations go through the software on the BMC.

For instance, booting will be done by copying the relevant parts of
flash into SDRAM and pointing the LPC mapping at this location. We
call that 'memboot'.

I like your patches; it's much cleaner to put the desired
configuration in the device tree and have the software do the right
thing than to have hacks in the board file. If Andrew and yourself can
agree on an implmeentaiton, I will remove the setting of the mux from
the board file and go with your patch instead.

Cheers,

Joel
>
> Thanks,
> Kun
>
> Changes since v1:
>
> - Allowed modifying partial bits of SPI1 strap bitmask instead of strictly
>   allowing only bitmask == BIT[13:12] to go through
> - Rename HW_STRAP_RESET to HW_STRAP_CLEAR and removed (to be obsoleted) macro
>
> Kun Yi (1):
>   pinctrl: aspeed: Enable ASPEED pinctrl driver to modify SPI1 strap
>     bits
>
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
>  2 files changed, 21 insertions(+), 3 deletions(-)
>
> --
> 2.8.0.rc3.226.g39d4020
>
