Return-Path: <openbmc+bounces-2531-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E187DC624D6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 03:23:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb4gG3gKlz2y8d;
	Thu, 03 Sep 2026 13:23:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1130" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788404900;
	cv=pass; b=nRx4DFNJ00w2WEdwhCSjNGU80afGA6jhOhe4g/Cv3/4I9yE93pIsNwjLbDTFSepUCXt8JrtXM2qNkmZ7AAjA7H6rgXO8bkg4p0xfEc+NtCe6DJX2hmMsEoHJeE19Z8mVtiiXRdamqycldJFpboIg6ElO/2RPdd94qaT7uLBzha0llp8KtVoeh6NkDqEo41icEnujG7YV641xUtN/0YC/rkS6A6nE1bQkoZapThzNrQXnQubP5M7Wu62+ULgvNsX9kfGlPpHirNXir239F5eBS+eoAbDe/8BSRVYZBrBiwkYwFnO7oyyIbdCXHDy3Vg1X/dnZvqVzAsXPCfk2qL7Ngw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788404900; c=relaxed/relaxed;
	bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbuzW7rcATz+vRiJW0wuAGBLo+arijNFX/HboUtddGKpwG74q2Hp7GYp9VTqY5lXL60y/msDzBJ5cLXryP1NjWna8PDtYtsn8pUaXqb65tIU47+iS1yEn/+iwbMDR+r5SKTpi+5XlR5Q6fzkSf+A++NKvD3iqOAd2BZ1PG7USc0YkbSi6b1sGIdOKjM1v17DtcwSQpVxfk6GFfYkLyULBnzb/GyiZdVrcSXXtddUmV5QW4c2KOr6YSUnQR74+LWuyHm4rF28/21/llcVjweUWaI+Y1O6HlFgqjHtaLXz3Onbn31a2oMksaFC1EVw+znxhFrlnthHj0buLFF9WCOXSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fqY5s8o3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fqY5s8o3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hb4Kt3jMgz2y2W
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 13:08:17 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8588583a7c3so23665537b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404895; cv=none;
        d=google.com; s=arc-20260327;
        b=lTs0dQnqL4oOZ9B4QLHJc5t3p7+tG7wHNUF2QCLbej8WUINNnFiloRZbUWpzpCGvE4
         dXreNA8dEK6YR6dnll2iVZv20VwGRFtAXesTnKfbdXgjUC0W7WbbtrcVbeU0gCVKdQMX
         eaEX+IbbqItoKkpHCVxdMRhWsxJCWhRp0EUCYBV9P6/XF2xRvXOCaOKTGEtMrNrbna+j
         aixI21XVNEYvKM1dcgML3Xkc8Z9GBa5ZauDP9iF1PjN4NsLSv87weYgrRYt2fwK2c08d
         vBR4wmVg3PyuNfJD+YVvXm2rZ7PqN9jiCZ23/6lbQw+VkuJXvgqS/dOFp6b4Zdqvv5s+
         WJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=+3su5mXqlmcodk9HRFcPiY9mrFvnwu8ZxJrCRbzcjKI=;
        b=SYG40VhQjwBuILSzJ5bV1fn2gAEy05wVsbcfc1CMnQKmfU79l2g8lMOKd5gcmlzEaP
         BxPhNR/Q5vwNssFwXYmJoLiRQcw2kRGA9kmMRagLrH9LYmvTRI31tXNElUXsOdQ3IaKA
         YzH8tkRinYHUhQ5h3CU6/Eu1V/8SV5F27Cwv7JQHqnmHGxxIDO6xZgaSu/7um7darGNP
         IRKGGQa/Z0y4s51/+ZyuyaQhc/c1TtfIG69tJydjIn+jY01NR5DZ2i1ooUtK2apgGpf4
         VwnhkvoaIt51UqsTAf9PL/5LqrI4flIYHTdwdCU8421EPGj5pYE5Ut++J4lIZkOle1Kk
         VJ9w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404895; x=1789009695; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=fqY5s8o3HJD5ycu0UFJx0awULRq0IQIClEaaQixNTfW2/rARC/vqKMv0zv2b7bqoDM
         EHTKgVLsUlrQScF2oIXKpFgM8VBiwrDzlpYhB5zGaei6sA4Tt+/2vlHk4X28407jjZbW
         2MSc4UKi3t0d4E3p5Xli3k7ljxDBy5mgZ/FVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404895; x=1789009695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=aTMem8pbsspl5B2Uv1rYA158RGJUicsbr4gHTAOPDWIW10cVcDB4D869wyKPn29Co+
         bDmOfIYJkynEY6O9/QWCVbWZrMs8q6OfLuO0A+e6vbXH93tJR7AKcYKzC5o8zqGY2rvp
         sZi6WGUVhuoInua44CbdZopydMcweSCgQUHjII0gDiQK4sv3rOPLUWcKaTEH/E4U6K25
         FCMJLW0GvzAi9YAtQnTZ9ZkLpLAtBaJSWvmMfpQ1drQNewJwq8RWm7NI3L1La7aUaAFJ
         hoZ0rVuEvcsgYKM/Vz+c1696uS8k2gro5OlQF6XfPhYuUe6kxAT8p02GQBrnwtegg82s
         nlkA==
X-Forwarded-Encrypted: i=1; AKwUvBw8bsxjTbpMcJx9gJebgC54nLq5AhPh37QzrpHyDx7quMJrNsSFXz7U/xOzwwP3HElI5Tq2+shQ@lists.ozlabs.org
X-Gm-Message-State: AFuF++lwl0TVd7q8MG+ed7UUqTpX2jJ4USDNqnY0BdSTWauIzazRkem0
	ekPAm10N6fq8tvCrYOzJGsBPAeR+9wYJVUCINuRsS9aRId0PQ4NtYj/+2eef9dvJJcjtCKuqj+7
	5pxGNQR6focgWqpzaIy9wyGTux+RhF3jo+rmCMrkb
X-Gm-Gg: AYBFou2kxShCvv3nJP/fUeU7iqoMQrThmAu9s0KG6mpji74E0S0beRjRniAwCaH2/cp
	rVOoYkyZL8PvQ16jjo7ipBXjvuHX5/K+b+JW2uhpu2ibUcwx7xArnckw8xbs20SvoEsf1NyYW3M
	Mj0JrNCJ4uT5cBdCG8XGET4ulI2EvSmDkoNO0biaAiumqESpicNHa1fX0SjwbWg/mW/DmbxaMSY
	EPYCSK/kiACyMil9Xos5g3L4ZM2JhN2pFUq5XfB8/mWGQ6SmqooyrRfsWWcN+vkN54tAgenCQOW
	yyI+gMYlLudl8jNcnlHbwlZ7lBBGu82tGPRwT6neU+GWf9XKse6NZSoZE6ITnemmwy+NZwF00Qc
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>

