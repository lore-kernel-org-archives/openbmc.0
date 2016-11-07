Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxJ91RQwzDsrT
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E53NIRq0"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id q124so6898519itd.1
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=rnFM9GmA4ga7wRbbOTAy5ekI1kGUMdaxgUq2xF3sjrI=;
 b=E53NIRq0ygLv1mViI5fD2Fw3rfVFlU27e7JnInvWXYq33vy+g5tREq7GMy/l0y6t/o
 ZXIncek4/eQY5/pKR2LKEi83skeSZ1CC4vptKSdIkMw47Szw6751PpgSnPBkv2m4SUsc
 0w1bW5ymAn2h0taEDn53fqAVvZQLpReNW/CrhgMqnPaP2EAqTI0Pdz5FEBcj43BGBrSH
 ZbbSTUh5BuJ/yS1NpqUAGMS2qEJ8Yd6VxmR6WXD6ygFA2Skgo5GXaitumNNWrNq729Wd
 u/cAPXltoo/e09y01gB3MrZdLvy4TFsPcgjlujZ4pFQHJueBuFt8D0tfNToCk0QSYj8N
 wEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=rnFM9GmA4ga7wRbbOTAy5ekI1kGUMdaxgUq2xF3sjrI=;
 b=P8Kn1+hFOm96efrmgm0YZJ/9PF4cjgkAH8BkI0eUVJyPb2cOQG/FhwX8hzeTPYez4+
 W5WvkjS1f+wTZX0+f9guczMqjJapI1yfy08xhSmsCD4vv1rDcBv08fmXBw3G3QdSHvW9
 TtR0tDNvawIwnUyUd4lNp9RyhS3ULUwoz7O26fmhTFWxI5j/CbIRzo/nn1QTh2KG10um
 Cu2q/jayTAnI5azir/49Ip5cwdUxDdrsb5tkS0TvBqGCQOKdXh6j1s8IetgG2PmID49+
 A+Q2PlXDbcU0Wl2mzTncXMN1Hv6WvFuYIynOxsFWIDilqf+KiQOCO8xe79Ya15dP75jH
 imeA==
X-Gm-Message-State: ABUngveLtyjc+TEJJ5u6Rts44hNAP71CHy5BoZSe4BzRqusZjpjk3AG4dOamNEF118QjsYuJDl4kerhGZwy6sQ==
X-Received: by 10.157.20.176 with SMTP id d45mr2486793ote.2.1478485847567;
 Sun, 06 Nov 2016 18:30:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:30:27 -0800 (PST)
In-Reply-To: <1478278847-9164-8-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-8-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 13:00:27 +1030
X-Google-Sender-Auth: wZWlogyxyjf2VE5eXvRfBQmAGEY
Message-ID: <CACPK8XdEzXnHnFyExakwnAk2UpcHrxaQUFSjauzFU4pBxNuzjg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 7/8] mtd: spi-nor: aspeed: rework io routines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 07 Nov 2016 02:30:49 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The IO accessors from pflash are shorter and simpler.

Nice.

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 110 +++++++++++++--------------------=
------
>  1 file changed, 36 insertions(+), 74 deletions(-)
>
