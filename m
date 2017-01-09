Return-Path: <xow@google.com>
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ty9rJ3xqHzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 10:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n7P0AceE"; 
 dkim-atps=neutral
Received: by mail-qt0-x232.google.com with SMTP id k15so380296294qtg.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 15:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=t06i4bkKwnkxXrjGU0hoOkbHfTtatnFv049hEZ961uI=;
 b=n7P0AceEagkyyk610tWDOWhlYC4lYqMzPcjf1zflXXzac8EZio3Q9chrfThgxlE/1i
 rReRVngh6XHvzaVOjEq3egdLGFlNS1lKbtCHq6L6b5MbAB6uqDQ5g73qAxA9iBTAcCGb
 Dv2g/GzB4pBdR/oOxkStWTXeSGBfwslE6OexcNvjJDpiGEj0piNcWnDW1jsL2nzaTJI4
 F9haRKDXwwqeSSb7lrXfjtuTldkjNGmoklcXQeMShywV+KGaJ/dliUoGQhRTZRNcRB1E
 ynxFSzXz6VXqF4APq1iVfQ7arif09npjWKgOJbNgMAInzKLuLmKuFNyvU/nuyVdHQNQ7
 1tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=t06i4bkKwnkxXrjGU0hoOkbHfTtatnFv049hEZ961uI=;
 b=kxKZyqIjsnB3sXxuwYbpVeJ3wkxok1pTvuxlsjveJNyenPNqA1QM0V8OyTlGJ2tuR4
 LFZyGmONDIIEh3MXQwVEiN7JGVepeVUg6DmaZU+y9LW7DIxyx28Uyiuvqq6KnJsuz3jJ
 B4LDY3qWyEUVEtKFR3WudR+wHETahd5CNcpuBf3ToD4LAOR0E2WIu8/RvlraJIwD1JCU
 +cFPnAl+4wCZtu4rizlCalmhHF0/XyhK/5RfR33HTOnk8ia0Kkb7khtf5LV5rNyuB2PY
 BzTBBBpGQXHTfd0bE/iKMJJl0zvn+XwkLnjU0bU7P2VNFDOOLVPSGHiw2cK7HigAcCzc
 IsMA==
X-Gm-Message-State: AIkVDXKvXQ36hNd8hzx4LSFUMJbWW5p3XHwedSa6ci6CgZmSkbu0Y4BFSxAcJRkWWELSZSN0moa+oRp5GonOA3lO
X-Received: by 10.237.60.49 with SMTP id t46mr155078qte.140.1484003469755;
 Mon, 09 Jan 2017 15:11:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.18 with HTTP; Mon, 9 Jan 2017 15:11:09 -0800 (PST)
In-Reply-To: <20161110013556.8542-1-andrew@aj.id.au>
References: <20161110013556.8542-1-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Mon, 9 Jan 2017 15:11:09 -0800
Message-ID: <CAPH-5w7O7+65OWEWARC7ihwhoPnqBRe8z_4R3KWRS-nNHsBw-w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/4] SuperIO and Host Interface Controllers
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
X-List-Received-Date: Mon, 09 Jan 2017 23:11:14 -0000

Hi folks,

On Wed, Nov 9, 2016 at 5:35 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> This series adds some sysfs drivers exposing parts of the LPC controller. The
> patches are pretty bare-bones in that they provide zero sanity checking and
> leave decisions entirely to userspace. They're also slightly tedious, so I
> expect (hope) their current form will be short-lived.
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (4):
>   misc: Expose Aspeed SuperIO scratch registers (SCRxSIO)
>   misc: Add partial Aspeed LPC Host Interface Control (HIC) driver
>   arm: aspeed: dt: Add SuperIO scratch register nodes
>   arm: aspeed: dt: Add LPC Host Interface Controller nodes
>
>  arch/arm/boot/dts/aspeed-g4.dtsi |  10 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi |  10 ++
>  drivers/misc/Kconfig             |  14 +++
>  drivers/misc/Makefile            |   2 +
>  drivers/misc/aspeed-hic.c        | 198 +++++++++++++++++++++++++++++++++++++++
>  drivers/misc/aspeed-scrsio.c     | 141 ++++++++++++++++++++++++++++
>  6 files changed, 375 insertions(+)
>  create mode 100644 drivers/misc/aspeed-hic.c
>  create mode 100644 drivers/misc/aspeed-scrsio.c
>
> --
> 2.9.3
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

I noticed that this driver wasn't merged. Was there a change of plan
to how LPC controller functionality should be exported?

This is still useful for us to set up memboot and to listen for port
80 post codes.

cheers
xo
