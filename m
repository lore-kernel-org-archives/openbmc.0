Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vZDCEGtl"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ckdbIXAQ"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GMfS2PT9zF1Hf
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 11:30:23 +1000 (AEST)
Received: by mail-qt0-x234.google.com with SMTP id s47-v6so3389465qth.7
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Cwy30a6UkOw36HJd8X0udwApsjX4Q1mU60T1GGfL2Ws=;
 b=vZDCEGtlTmkP893X8LMQHgHsYgLiV7XRPm5S3W8xl0hGte/Rumes+IrcjcdWuL7fpg
 g1tdh5kl9DaNNel8lAqOpWWKUvhJp8hKmE2JpT/YUfFaU7SpblRK+OSXnxs3QbSraz3c
 5xfihJKIvrCxmp2xGWVufkgwMS8hYnLTtdJpp4CNW7imAGtkTlalGVA0WJwNE6ji5jja
 EYsklWHETozIKnG/y3Gz4g/bf081kka9e8Y7URzwHSKbC9vB193v+z9rhA3Nm7YkRpj8
 BlJ5pUwQQ6prIkVMeObBGNzQZnBi1NEdPiwmjKHpou7TqlKRAWPycZBSK3K0uW2PsWsh
 7p7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Cwy30a6UkOw36HJd8X0udwApsjX4Q1mU60T1GGfL2Ws=;
 b=ckdbIXAQnZiZnwi9k2UugpCz5N/b/QIJJFhmKMP/Aiow1tJfW48b6SBDTgIvakTvID
 WOUknyk7SOKSsqRoCHHTlsifdnmevAQaLOWWqVDbhNiDtkWdvmB3q1NDgvs37wsfzz1O
 bh1/33KdQEgI5TYrhE/70jxml9EUEjJqvz5GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Cwy30a6UkOw36HJd8X0udwApsjX4Q1mU60T1GGfL2Ws=;
 b=hIe3tKq6KA/puNk8Jn67naPcHZB5T6nBrdOkiVHU7Mu3f73eVJIAwoj74Bq17MTYMz
 ct8Y5ojLP1jiWTO/gWUWk/JVoEN8XCssceaZyyhjJpBTIUPz5BxbhS0y2y9vahUrGVSs
 yLtrEln6kNrIVgbPRARdqXwQ/spCzWYD/AN6HBmW87WIKiG9C/wvTqwuOmuylmPKDQY0
 jgY+bQIvuasFzgm5TbG6K8P5zqvhHcBlwYNtKEeC2FroBfLyAina4dWMjacr7QJm7Gwk
 5+4fQqH0mJtCBSwtGSSE7hXiQJlMM+s+7oNmnR/sOSNlerRsbfuvJP2+LFW2h7ttaNuh
 Xukw==
X-Gm-Message-State: APt69E1Gd/F57PCaBFar/uW+BkdfcLUxS+W5gQA7WVW61k4smTQnvHxr
 g838a6QVPGWeGu3qwUq/c98lWzAGR+OPZFalZwA=
X-Google-Smtp-Source: AAOMgpcXZpG1ciKLAiFYTuc44QiW/ZIrkRCjfSEZoZDnOH6+koMByh13lrkhJhZNNWNte6W+DLqeEJYo0/p/+kThW/0=
X-Received: by 2002:ac8:679a:: with SMTP id
 b26-v6mr590655qtp.347.1530149421418; 
 Wed, 27 Jun 2018 18:30:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 18:30:00
 -0700 (PDT)
In-Reply-To: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 11:00:00 +0930
X-Google-Sender-Auth: 2MimWPkt48xI6LbYpjXy9cOjU-U
Message-ID: <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 28 Jun 2018 01:30:26 -0000

On 27 June 2018 at 01:49, Patrick Venture <venture@google.com> wrote:

> Hit any key to stop autoboot:  0
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
> ## Loading kernel from FIT Image at 20080000 ...
>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x20080124
>      Data Size:    1723192 Bytes = 1.6 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>    Verifying Hash Integrity ... sha1+ OK
> Wrong Ramdisk Image Format
> Ramdisk image is corrupt or invalid
> """
>
> I figured I'd reach out first as I'm sure this will be familiar to someone :D

This is due to a change Brad made to the u-boot setup. If you change
your bootcmd to simply be 'bootm 20080000' you might be fine.

Cheers,

Joel
