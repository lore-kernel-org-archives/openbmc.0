Return-Path: <sjg@google.com>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkv3nnwzDq93
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cTwcLWKB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xx2wuYqe";
 dkim-atps=neutral
Received: by mail-vk0-x232.google.com with SMTP id r69so314700vke.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JlAjKcx6Z3ft0hgxW8AWPcEoZZioKm1cjrfkkuvjAXo=;
 b=cTwcLWKBzqKhUhfxt95oJuC4TGjMF7CWArv3sbbXTBRMlx4N6sJhagrwUQhW7RhS89
 BbhPUhmw4eoX95Wv6K6xz1xmQFfBTxnvNgHKrYD0twkDTxiaQ5ZC2WPtYLbmR40pObL2
 Tju4EmHXvxCFsQKZO8HIgnEvEgaZU8xXtMICsSTfnzyC8SU4pB24N8qZBAmXExXFmTD1
 eZroenVqINSrrgHGbWXzhKZVh8PdOafGpxGLN3r+yYmwRfUsfOmcbxa2hYmShujGPMw6
 mNML1lLHkOKm6WsFouV5UdFz0I2KrcwS31MQAa8ytH8biQ5bn374pWM8gXEPRcbgOeNY
 XwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JlAjKcx6Z3ft0hgxW8AWPcEoZZioKm1cjrfkkuvjAXo=;
 b=Xx2wuYqeu9i8YdYMWy3fNaLfZHktij8nsS3o1/z3h0frdn3Bh+OSK5tfH+CTCzNwNS
 CuCUYqyaYqlFvH0RK9sjBaz7MGumpEK9b1ZJXmTvZBBnO3kRPuHYQYWKkIqeovRvPD7N
 E/jaCrQJomFcEdSwycs2WHwVK1dqcrTZf8YJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JlAjKcx6Z3ft0hgxW8AWPcEoZZioKm1cjrfkkuvjAXo=;
 b=DfERMX3DuG5z5W7ywnXtKeBtlf5tOY8oxjbaGPOxW94aapA5G4JqcT0m02dIYx81MT
 NB2KDYR2dUUiutjw+vnuvvAte0zzFQgdxCU06lAvJKaEi5ZIC+Hmz2mJge5Vueijt3r+
 yj0dhgDlzj8EJSV9SWDrt2lsTdtBImCjhg3UD9f3QjlpAWnOL2kPLILPbxTYesYtrh1Y
 /DH2PtZ72Dak/zf712m4r3HD99dAhM+vDnpWnOwsZ8RyRMGVsUmG8eFEKQftd+unDBju
 X67uWpmquEMTRRE+oD0AliOp4rnVJDEMIfhvC/IXENrijob19+jfUfTQste8oQKZpxnA
 9Yeg==
X-Gm-Message-State: AFeK/H0vlAE5X0j9Vg9xhZX7xTVkZwxn7D7xvtIngO6moLOPEU7tVkZ3ldYTTeSZuYLEQe8SOHSpblTFDXTFjTAF
X-Received: by 10.31.96.69 with SMTP id u66mr12802053vkb.80.1490138565116;
 Tue, 21 Mar 2017 16:22:45 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:24 -0700 (PDT)
In-Reply-To: <20170316213624.140344-9-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-9-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:24 -0600
X-Google-Sender-Auth: CdbeKX9imqBV8T-swsDJYSpS9YY
Message-ID: <CAPnjgZ36BqPSTuPg9YyCuo94uZs9K80CF-bYL-Q2AQAkr7mi0A@mail.gmail.com>
Subject: Re: [PATCH 08/17] aspeed: AST2500 Pinctrl Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Thomas Abraham <thomas.ab@samsung.com>,
 Konstantin Porotchkin <kostap@marvell.com>, 
 Wills Wang <wills.wang@live.com>, Kever Yang <kever.yang@rock-chips.com>, 
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Stefan Roese <sr@denx.de>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Minkyu Kang <mk7.kang@samsung.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, 
 Wenyou Yang <wenyou.yang@atmel.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:47 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> This driver uses Generic Pinctrl framework and is compatible with
> the Linux driver for ast2500: it uses the same device tree
> configuration.
>
> Not all pins are supported by the driver at the moment, so it actually
> compatible with ast2400. In general, however, there are differences that
> in the future would be easier to maintain separately.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++++++++++
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  19 ++++
>  drivers/pinctrl/Kconfig                        |   9 ++
>  drivers/pinctrl/Makefile                       |   1 +
>  drivers/pinctrl/aspeed/Makefile                |   1 +
>  drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 +++++++++++++++++++++++++
>  6 files changed, 209 insertions(+)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
>  create mode 100644 drivers/pinctrl/aspeed/Makefile
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c
>

Reviewed-by: Simon Glass <sjg@chromium.org>
