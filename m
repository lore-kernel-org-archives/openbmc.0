Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgC71gtqzDvjh
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LDHPStY9"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so20837684oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Ba4yJc9qaW0N+LZimRCb4S52zyLGOhDFPqAlIFOBLS0=;
 b=LDHPStY9PE/9zfOp7y2QLPih6M0u+4gvEc+RFJC8iREUIAU1+iDv9RrWD7iXUx3nD7
 GHjlv/m0Hu+qsJ7gceKsdmSqYo36nyt3KL4Z3v2DHJHJ/sjo4oKT0O+0k6Kafhh6+d+2
 Fpafd1ja6qPxxYGa+3CsDoMLAKHCjQFsnq3PX25XXjm68UBHVbu2pVQlyUtB0IN0pI77
 Ct/7E/QfYHbkWjOp4rjTNi65eO13DYeLU7odBdORQpysZrFgilvBcBnvAyz2Dyx59UZl
 K4kHQMaCUoDocAKY+OyZClNkfg89u8tISOgfvhEywOXFZPctlNWzklWmPdBaE/QdNsjv
 lRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Ba4yJc9qaW0N+LZimRCb4S52zyLGOhDFPqAlIFOBLS0=;
 b=ENkudLb7C491L9LWUW7+nRHMTaLezXD9Wzc7IuJ3+FJLftVvYr0FrvTj86WpTVfmNH
 VU9nw1T8gV71gRwn/BhqC5XBs9az1JfI6PLCD2hyRk/ycLdIsSsiRkakNTPwQFRtrMlm
 stfSNQHec7kTWtfLVrdLzqQfa/IhMpxtHVVimn/PpLGRACumCGMjjBcO8Y/yoWw1+FXD
 8VImDNxgwvOVaWXg10WD7ug7scqjaGfV8GO4fGfpdeV+g+3PLUEjWmeN/U23LcnDDCfb
 ZpuEquEBhOZz9blE8Lnc64nFtcXXa5z2yqhXD0pNfSEtq+Fz48lAYxy5mZD+aeYlKvvl
 LPjw==
X-Gm-Message-State: AKaTC00uYqf6Q7r5M48nHW/0JDwLteLDmJQ/0y+gbt/rPwVH3tBBurLvAWHkac+c28pZ6aIRFElXGu6yQ9UuFg==
X-Received: by 10.202.55.70 with SMTP id e67mr7703955oia.51.1479713201541;
 Sun, 20 Nov 2016 23:26:41 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:21 -0800 (PST)
In-Reply-To: <1479478938-13267-37-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-37-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:21 +1030
X-Google-Sender-Auth: jcCMynJLInQVZveBLPpSX2pzG08
Message-ID: <CACPK8Xc_hEtODJaDrRxuS9XOT+PwCNr95ejm6tJSf_NAmz9ofA@mail.gmail.com>
Subject: Re: [PATCH qemu 36/38] ast2400: add a FTGMAC100 nic
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:43 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Only the first nic, but the second shouldn't be too complex to add if
> needed.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c         | 21 +++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h |  2 ++
>  2 files changed, 23 insertions(+)
