Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCV63yJzDvjR
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UUG8RYcu"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id u15so1448088oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=bcSlIsZmWkxDFxWAIas5ZJyhr0BZMPg/BLfVOVcjukg=;
 b=UUG8RYcuygHkRtXe/fzn5uTl8HBTa/1GI5IB7hFkU65G2r9JNbiWt9r/hY55Fmr/vW
 8Ir/TdkIuYzKpHdLwOcyS6kSY3dQwQOWx3RwEZHIXnpEO8RyHHdn/TYg7BP66kkvdneE
 hHmicn/31lcuA9Ky54ZBfbG0Tv24h4DCkGCjliPsUv/QaE3sjKoGEVVbdiK7o359H35r
 JOKibyOT6yO2RFKLYPe7Q1IxOGImCz2hC4yZoTuIaEAa07bqoBZQZ6fKF61nmKpTL/ge
 iMAy9hoMwm6jGoUNcGhhJ5bfpkVTMOpDalbo+PlC8OJbgX/yiUGd2tvEnpWW5A0xNdmt
 r8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=bcSlIsZmWkxDFxWAIas5ZJyhr0BZMPg/BLfVOVcjukg=;
 b=D6cNC9UElYkygXscSCJ8KidIB0kc4vwoEkCceag4/tpu2OHwvK4gj7SGNj8NR0FQgv
 b47xuqjfLRdp3IV0Ok8pgIcWrdx7plzqVqr30lbXcwawThRuCre+DBZWXiHe6XaooUsu
 m3IXxCivO8zr6cYtDvSrYIqf+YR1r+7Jss3C1iUF7f2Qzexb+B8mTNKv/OkCZkKa4bX9
 pinSvI60ZkEwyRFreP43nfx9JFeP4iYFor2ls5yMnxJOPNqRXnA/lUKNt0OaWUL+lp1U
 o3F1LLet5KR+Ildc732ORo29ejxnBJs64M1kN9wkSto1+Dr9pdk54+LE/mJHMQ5r7vBR
 n34w==
X-Gm-Message-State: AKaTC00WQ90T9BSegC6F9JhNEGG0U2Hc6UlldAybQWcHLSo3Td3/owCe17Bs78Phir8ql56VTk4ehFCgajCP+w==
X-Received: by 10.202.253.208 with SMTP id b199mr4469795oii.142.1479713221146; 
 Sun, 20 Nov 2016 23:27:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:40 -0800 (PST)
In-Reply-To: <1479478938-13267-9-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-9-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:40 +1030
X-Google-Sender-Auth: va5LQ4dxRxuoXJh5peLX0ff2KME
Message-ID: <CACPK8Xfrb+O6RB9oaV1JUuBfCYizJMPRiYPD=_iq4ee4r6F8Dg@mail.gmail.com>
Subject: Re: [PATCH qemu 08/38] aspeed: change SoC revision of the
 palmetto-bmc machine
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:03 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The palmetto BMC machine uses a AST2400 revision A1 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
