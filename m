Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBs4VQJzDvjm
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o8ODubC7"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id f201so17133117oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IwH+QTDIWW5OI+0dmyVot+JzdimHu34qi10vLX2jQRU=;
 b=o8ODubC7bC2GIPkHRLEPWEB3Nul84J0RF0M3ekD0PCk0RSbnKjcrARTHLjbJbo0aqC
 lFEEclaSuWFsg8p6/iTtre8wDXDcAY+7o3as3YW2Kr+YLlJBmp3ukSvSuxV2GFfNOC0u
 10JS/mNO1atlH20qMZpP6cosH3OWL/qDPWrXb8qOcRqEc6ybDocwTRZvUSUz+EZfbOZd
 mW+n2NOCXKvcQkiYwH1k0oBnHuskRQnniRB5T7zh7YH87rMG4FujN4RoE7KsNkcy0MaF
 94zOTj8k4VpiqL/xb5MKQaX9JinNeuDhrM5VEWV5Bo72CDol8F7rxrTB4LVg6w5ix5pQ
 hZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IwH+QTDIWW5OI+0dmyVot+JzdimHu34qi10vLX2jQRU=;
 b=h5SwoePdGi771PJwi3ujDMT4aiAhZZHFoVPOTbZ12gRIniDKTOW5O8amv40sIcKFE7
 oYg3w+becVhlYubuxQKCfWSiQzEGjCBURZCxD+Ikyw0xlK0E/Tb0lDyiExLxhkAIlYoQ
 PvvbsRe2/GXjBFkuJWzFjSFt2TQwPxczQUrE1gJ++DNAC7zX9IXTL82Vxny4hnFQE5N4
 dmUPd0S9iiQbyZu6kOq0iK6988mlc24WfS6m4S7MFuc2p4yvjttekYwKyrK3xlUDbVcC
 2iQ0z2xYsbTMjcrtiM/XnIGpdZn8FaWMeA8NNoNZU30C1D7X/ukt2hLO1AJj+Tmibo38
 jmrA==
X-Gm-Message-State: AKaTC02F2qXMySkXWNFni8UZDz3SXqlciACDPkuBBmkMnwXStE9DtILjwRii7JSrpW09EYhqBOUWM+jcd9VNew==
X-Received: by 10.202.0.205 with SMTP id 196mr7833135oia.44.1479713187928;
 Sun, 20 Nov 2016 23:26:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:07 -0800 (PST)
In-Reply-To: <1479478938-13267-29-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-29-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:07 +1030
X-Google-Sender-Auth: huKlZUQZzLIZhmi0TcMGj_Ho2Lk
Message-ID: <CACPK8XcptTBCpJBSpkFP3Gg7Em4X8nXroGsuXBwzu=QTdBSmBg@mail.gmail.com>
Subject: Re: [PATCH qemu 28/38] aspeed: add a temp sensor device on I2C bus 3
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:30 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Temperatures can be changed from the monitor with :
>
>         (qemu) qom-set /machine/unattached/device[2] temperature0 12000
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
