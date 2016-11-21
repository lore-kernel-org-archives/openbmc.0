Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCM0HvGzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cOT3hHu+"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so20838153oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=yGeI9rI7xOcKzCi8H4YU4B6jhuQCXgNbLMEwNwWO7PU=;
 b=cOT3hHu+dei7/01pAv+IerCVcpOSKQ15yLmNqRMkUofXkICgGRU4vgnrxhWmJNofp5
 VXLG5ddxdm+BSOwAbMyVw/MTISEdaxpqjwOutGJxCL6HYh22K9J4rXaLWZ4GO8fXRzFx
 9ke4W2wM3NOpsIfAMebvGae19wunSzxs+68whmsa4SMn/87obeNuwaQd8e0315QjT2dK
 h4fZAYV/W0DIa6pNdzuLNCFzw18LoyDiGnA5QdR4PFQ86pO5y7UMdrd+eLwkI6yq40T7
 +aNuNj/Ll9/vxNB+H2rgb17coA2Szhf8OMWFzhYjVzbabpn2AVm9fFMVsVA16gV6vGa8
 YztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=yGeI9rI7xOcKzCi8H4YU4B6jhuQCXgNbLMEwNwWO7PU=;
 b=Lfy3eXdVI9RadhjxsX05mmiJ2hg3rWW9qEaXYhoHJTvKtDZ92w7OxcTWf4CKoepoB4
 4XBGr5pjhvpRMT1wq7nZqG7dThc0r5VBuMK+Fo+sM5pjE1YVZejoquOfGUBxM+SbG1Wm
 G0KDLLb8iucAsgV8RwWakABwd2bo3Sc1L4NTsyAbns+SjN85Mh8DKY2En14FhAXNpiiw
 vz8TuMpPEixURimEEsridtBskBkV2ZrCdLzu9+pxgwUhH2RKIrMWT10ykLvU4JCGYx3s
 NF/GH5PQyZA1955cx+jy8UPuEfr3aTmlRHHBwGLH18VcDjbW8Twn7h6UVa50KXSL4YEl
 LqIw==
X-Gm-Message-State: AKaTC01/ron7hWe8foHrVNwEfgbgt+RLcp5p7ruck1/3R17PJikvh7pC5YG1C0m/FV2D3x5Y2Ol7NsCRwMC75Q==
X-Received: by 10.157.35.195 with SMTP id t61mr7231560otb.263.1479713213338;
 Sun, 20 Nov 2016 23:26:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:32 -0800 (PST)
In-Reply-To: <1479478938-13267-12-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:32 +1030
X-Google-Sender-Auth: -mjgtMkkZ2IeRi-Zqph3jk7op0M
Message-ID: <CACPK8Xeo7f9rJ9JdR9GGYtfPFu67ONEZKK8V6xq9+hRSuEvc=g@mail.gmail.com>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:55 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> If the second watchdog is activated, a second flash module is
> available. It should be of the same model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Nice. We should enable WDT2 in u-boot and the device tree for ast2500 syste=
ms.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
