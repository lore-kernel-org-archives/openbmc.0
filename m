Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNFTm1dkQzDw34
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 17:11:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FEY/TG2F"; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id x186so731393vkd.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=p3rfA0i2PvObQtiCVf02dGstJzz+UXtOT+bZifsHwfg=;
 b=FEY/TG2FwD79WCb614vwl7yGyF7vYjca/A+CsGLu0QcKWU668+x/UKHYi8fjowwhz+
 iOBSuq88U4oiLIkl9qAC1UwZRcMn88zEG5a3nq19pijrP8uJ3yuSrmAU5s/vKcMjHmux
 ORRUV5FxMqcu1rqVzGRt7xJeAG1ogZSORlbs2qPGiclfhpWyDlmdcxkFdNGx/w0UOKlm
 993/HRmhpXjdD+/EOxzfuO0/sumnZUNvVI8MFnXZy8hF7wklar3UCBivYZEvW3NzU94k
 KqCynkjdI8mBhrmyJZrGwZwsnnnnLHSvhzpCLmy2h6F+87HQHiVWikseAJNPP+sWvFf+
 clhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=p3rfA0i2PvObQtiCVf02dGstJzz+UXtOT+bZifsHwfg=;
 b=eAhacnBR3VqYZuAbwEt1zLqa1MDjRyfH9vvLISWjzyEU97u8U/u/+rWVWHcQFmIxjP
 b2fYYXegJvilfeJ2Sz8BUiO4nNigkJmrEq/es9EZ+qEyJSFcAkCurEMhhLhGL7fPMvt3
 N/onyMIWE1xmOhYO4Ul+eyQFuZOFvg0nxi6jdgWRr2/wUKj0E7bWlazmMs7O7fw8+9Qh
 fMZHCTKIl9ozlNOX7TkRO8a4hl1ZL+q9lnrjV/qVKGyGxB9VuAJqdxmomSfUhsWSLm/b
 1ytvqSMgJEV5q8VP9O2kmJ2D02QGMyevbB7KqZuXVGsGVUNJEFRrSVVKYpm+/LvIrpD/
 9rVA==
X-Gm-Message-State: AKaTC003KrG9pCwSZfjG6+LxwL6Aubxhavurlj6MxxNxnZuolUvfE0Y9aTttZCMoXFEmwj73cSMYNe8l1TIOxQ==
X-Received: by 10.31.52.145 with SMTP id b139mr1534198vka.151.1479795082208;
 Mon, 21 Nov 2016 22:11:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Mon, 21 Nov 2016 22:11:01 -0800 (PST)
In-Reply-To: <20161118070635.17708-1-andrew@aj.id.au>
References: <20161118070635.17708-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2016 16:41:01 +1030
X-Google-Sender-Auth: S0IvNEYWJD-qzMVE0LpinnnH15U
Message-ID: <CACPK8Xf4koJaMq_RWZXYB_uiOY28BSrXp4FZz3rSKZ2aenHsgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Add parentheses to HW_STRAP test
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 06:11:25 -0000

On Fri, Nov 18, 2016 at 5:36 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Squashes a warning:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function =E2=80=98aspeed_sig_=
expr_set=E2=80=99:
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:210:24: warning: suggest parenthe=
ses around =E2=80=98&&=E2=80=99 within =E2=80=98||=E2=80=99 [-Wparentheses]
>     offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
>     ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index ce1399dd8b68..387b75aebc25 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -207,7 +207,7 @@ static bool aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
>                  * all descriptor bits.
>                  */
>                 if (is_scu && (offset =3D=3D HW_STRAP2 ||
> -                       offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_RE=
G_MASK)))
> +                       (offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_R=
EG_MASK))))
>                         continue;
>
>                 /*
> --
> 2.9.3
>
