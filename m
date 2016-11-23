Return-Path: <sjg@google.com>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPDQV5pmxzDw02
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:26:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HYBdxIij"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="X4wRSFPK";
 dkim-atps=neutral
Received: by mail-oi0-x234.google.com with SMTP id b126so28570290oia.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=93N1KBZoBw2IQYG6UiViZJVDq4S1Qwb2SgUhT9bQCK0=;
 b=HYBdxIij/h/X42dFTrUHxU2vww9vvfij3GNrkAOl3+40sj/p7OCvu6lOe1eSpSXmDj
 bIIhofSYFgOwzLzD9sQSd4mck9BiaAEtd7sUG//370y+bZNkzMfPPYzYH3yD3OQGbVY1
 YHT2l3fP+Ty6rlltbQ5RNuLqRYlEosof59fyLKP8VI96dHAOj09r1kGbnd+M6LPly5hk
 x01cfKcsHmKnvjfqJ0cbC20Nqb9GPup5KtKF2/YXNRIsNfKKK/m+FP461VntVGBWSBsq
 pMLDy3esK9EcFlVIwnQBYCFSZRrjwmWJ0JyDxPtwBOO4wwdeAcYwjV0ZUVV85BUXTYBd
 yLdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=93N1KBZoBw2IQYG6UiViZJVDq4S1Qwb2SgUhT9bQCK0=;
 b=X4wRSFPKwoO9NqG6gvC9rFM32V0vVCEw96aQkWEb51Zu9iYf9/W2wVXaPM/Dr2YTx4
 0DeJhfScEza5KWBgf8kYTQDKr+/0qmUxQ1Nj1m/DmabdP0LrMXe8wc9tIZO0tBM8cHVc
 ESBVVRJVR7jtmQ3PqswrQr/0bYA50GG9mkH5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=93N1KBZoBw2IQYG6UiViZJVDq4S1Qwb2SgUhT9bQCK0=;
 b=NDz0IhM7WuLk0Y+9t/eulobTeYbWl9U6UrX/ZkXJiKzfvhbmkPv0FqoDt5Ltved/hh
 xdTSqLtWNymY1QMJDrWQo5NHfo7TvxbuMROqfz0IYBDbeibiP0GnQjjUEYq5OiFRd4R3
 e+idVUqwxLzWx8Qu/Zv3ycrthGmhSBZzMV9l/5miW199O78U/2RjBV9rArJ3+LbhRSf6
 uKNmGEIKjoX3cr4v0kNQ4Ob9thrRRiNS+CSoGpNH04YlXNERIDcYfRDLYyI0T6gayNiV
 324UG6z6R53C1ZCdtQQDwr7Yrnm5SYud9p5ylM0hZ/JhpHT13BnP+8wJqQ80cMUYTGQG
 KBcA==
X-Gm-Message-State: AKaTC00pYMEdXS0vlXXDwpmMfYkR/6WHeSnHopGqGhkByFmqNxPXl2qPwNrQY0lKdCQn86T75fmZt39HrP72JtxV
X-Received: by 10.157.5.209 with SMTP id 75mr3101526otd.229.1479932816644;
 Wed, 23 Nov 2016 12:26:56 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 12:26:36 -0800 (PST)
In-Reply-To: <1479930602-91012-4-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
 <1479930602-91012-4-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 13:26:36 -0700
X-Google-Sender-Auth: JdDDRD37RBasKZMedIGGxzUvDTc
Message-ID: <CAPnjgZ0PqmMzJzToDoXFxVz2J8spV2ob6RF8Rz4ybprviGC62g@mail.gmail.com>
Subject: Re: [PATCH u-boot v1 4/6] aspeed: Add function to calculate APB Clock
 frequency
To: Maxim Sloyko <maxims@google.com>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 23 Nov 2016 20:26:59 -0000

On 23 November 2016 at 12:50, Maxim Sloyko <maxims@google.com> wrote:
> This is needed by I2C driver.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  4 ++++
>  arch/arm/mach-aspeed/ast-scu.c             | 13 +++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

As discussed this should be a clock driver when it gets to mainline.

- Simon
