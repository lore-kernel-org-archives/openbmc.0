Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLXVR4nVTzDrJT
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 18:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1VWIUvW"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id n83so2324110ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=iXW5eE+6k2zw8+u6+fR445j6yjZu4YpBAswmvQ4ylS8=;
 b=D1VWIUvWRpoAfxyW1O92yX0sXhD/yLgUEHbGlUlIR0SDWPzV+p+GtKJ9M0XalyO7jm
 o17EmY6JsJn9qLJ197wms9rXPdBrUA787HegmdQKsUABoIqv3Tk0Ytzs94uMy/s+kPIy
 uqmrJQ9JFUi7b0jcYITA8v3tajx/B6su49GCi23qkB2IhvxwAUyZslpHqwwRtFBObskl
 HwU0A/AX+6qiPI/INONOUzyfkNyjZMw770loHWL0v406D9N23TZconPq/D2Z7vBJ5TcL
 RdLMXnvhBAikxC75y5mMyjhK58J4tX1B4iAgFXOnBUcFJ7Xt++MblATeZVbi69Ng/0dy
 iwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=iXW5eE+6k2zw8+u6+fR445j6yjZu4YpBAswmvQ4ylS8=;
 b=B8V2DwromivnDN2yHMMh+3qZTuNEHBF3gOTnGSHwCL6Zb6tsaGEDDmKJLHNkVIPFN2
 bE3uce2tny9uNeCa/GYc+GFtdaUuRm787P/FrjpXumkJGiT8egSLLKWhujZuH/Ps6u0w
 +Y3c7oNto6DrdluEGU26xERsCITYDhMJ/UnYvXNHMjuUEfS7jOiwr7DP4uLxVpbidx7g
 x3D8T0r+nfSHc8RLNXG5DtuYd9WmyPJgUA/yO0iNubyfo6f0ZwRlZDps7/ODq5qlgGpH
 haJqKTl828o0pNTrb/4SUGFZiR4GGqoC6yUZRllR9VKDtco55yH7tpHYtKtrpZAqoEHe
 KRDg==
X-Gm-Message-State: AIVw112TkmFav4vy/xS+z9BTEDn9z2sduFPmXZ76i2V5lYpwmcIIc3Gv
 +Bkk+YPLDokr/VmyoA+yoFhEuYj+36Qo
X-Received: by 10.13.240.4 with SMTP id z4mr12928685ywe.276.1501489309759;
 Mon, 31 Jul 2017 01:21:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 01:21:29 -0700 (PDT)
In-Reply-To: <1501487619-26582-1-git-send-email-clg@kaod.org>
References: <1501487619-26582-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 17:51:29 +0930
X-Google-Sender-Auth: q1hQanKe13HS4cZ8MrJX-wpJ9I8
Message-ID: <CACPK8Xe0Kg2SOuxAEQpjBuPw+z=g_eTL8aTKJ=9g2WP-hbKuuQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] leds: pca955x: fix typo
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 31 Jul 2017 08:21:52 -0000

On Mon, Jul 31, 2017 at 5:23 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Spotted by the 01 bot when compiling without OF support :
>
>    drivers/leds/leds-pca955x.c:319:1: note: expected 'struct pca963x_chip=
def *' but argument is of type 'struct pca955x_chipdef *'
>     pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipd=
ef *chip)
>     ^~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, applied to dev-4.10.

Cheers,

Joel

> ---
>  drivers/leds/leds-pca955x.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.10.git.orig/drivers/leds/leds-pca955x.c
> +++ linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
> @@ -383,7 +383,7 @@ static const struct of_device_id of_pca9
>  MODULE_DEVICE_TABLE(of, of_pca955x_match);
>  #else
>  static struct pca955x_platform_data *
> -pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef =
*chip)
> +pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef =
*chip)
>  {
>         return ERR_PTR(-ENODEV);
>  }
