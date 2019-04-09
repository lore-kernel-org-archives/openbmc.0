Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hMlLISpe"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dvt10HzDzDqGW
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 03:48:54 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f36so5362864plb.5
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KPqYb2/MOnkA8/GFbPOUR+1Ib0GKn5UWCS0nbpLDCsM=;
 b=hMlLISpeOuIWHbpvnhjRhPT6VxKxv/kbP1fJ0H/uVWHl/UFWT72LihdDL3GFW1HyAw
 HddU2ERyTzDseXlJwYwOL9esYyvZTPwpDr9ziqdzeQE9wj8Te+cF4JF60BDe4e1Y/QGX
 y/8967Hi9c/p0OBNgXuVGjo7o97gADzr3wr7NDN+WvlhQMNw5WHmIW/91AQV03FkG4xV
 esOXUG7YtOViMfem04Hial9cr4OhUX67TTH2J2vrApouFMOQ/3UMxg4aG+Z836wCJhWH
 Qt1JlF5gFUIF0BNNbtMMHp8Ku6r/xW2bdgiVIvQB4TfTFK0K4tRpsK7vbzyTSq/wIX1x
 245g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KPqYb2/MOnkA8/GFbPOUR+1Ib0GKn5UWCS0nbpLDCsM=;
 b=l+Gg/Pc5m46wRkZxMJ6yfM8TyuvoAN280I55idEWYB6j6JCzHaZV7C0Cz69eFwHzvM
 wUcs3hPp9VSvZTAjzIJeIUdabvhm9o1CuOsT2kfEatrDIJuIOstpUEjTlmr7luTfPamo
 NLRMnDnroxQJFqgPkdSYoFI5MzULf6RwK1shflApLFoczB9UKMycxZuFjplkULQSMZnD
 1//gYp5XFh+0udZrV4H6SKoNfZjMT9qu9HtHcdli4ueZklimObXeOpc7hqUffTJEwTJe
 Pc6vtgh4BPgfzJ0NaVfEdZlxsxWjNFEHDrQP0KfCOu4tQKcDnLlA4qyGDdYNV4DDyKdO
 KD5w==
X-Gm-Message-State: APjAAAVUOBF9k1uYwnF//nVJaCe2yNcsPaFwuubT1XSHItb2MSc3XO9J
 x2UhJfRe6LAYSaeey3FCp0XeHrPjNYjj82jpCtMjudYqp4Y=
X-Google-Smtp-Source: APXvYqyIz2d5E6Ji+YBvCuMba8AU0YUq/FmTL34T3l6PEUqiWIWh57EFICUWrLV+TdM3LXt/nHAYXpCQkJG9HnfLqJc=
X-Received: by 2002:a17:902:407:: with SMTP id 7mr39161690ple.62.1554832130870; 
 Tue, 09 Apr 2019 10:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
In-Reply-To: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Apr 2019 10:48:39 -0700
Message-ID: <CAO=noty-q4O5Zdj3Rx0sJ7JFW6OzsTzW7u=8Sf7=j6A3Msn1yQ@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2019 17:48:58 -0000

On Tue, Apr 9, 2019 at 9:35 AM Patrick Venture <venture@google.com> wrote:
>
> HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.6
> with the quanta-q71l board.  More specifically now my host can't talk
> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, I
> can talk to ipmid file via dbus, and btbridge is running.
>
> Has anyone else run into weirdness?
>
> I am seeing:
>
> [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
> [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
>
> The dts file I'm using is basically identical to the upstream one, and
> my defconfig is also nearly identical to what's in meta-aspeed for the
> ast2400.

Verified that with the same software stack (reverted the
i2c-path-hwmon-config-change) works fine on 4.17.18.

>
> Patrick
