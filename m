Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBZ5r1XzDvhp
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D88Z9Nl7"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id f201so17132450oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=J+Yk4apVHBSSERRzBwkjGaTHLOulo/YE3D8cBkATAwM=;
 b=D88Z9Nl7iS4+Tyfs7nyhcXrO0OB9/oKsCT2a5C8oK7sZ6QCvU/HQfoeCVbexeTOmET
 YQttS7qZlZEDlA8FyMLveby9qh9CYcpf2IsBzkRNNrPRXB078ocOQmhC3rvD7xRLRskb
 97SF2tOd845J3IbFDJDHzzTraa5xIAPY2ZYpgHRXzBr0pY96CQiTnZM8+EVZgmqehJg6
 tXX3aUQEyx0Oa50YnIYc3ArNbRF7OgbcKV8Y88FjO4pCxSa+XoaFsIdK1okNqvw2jSf+
 iTA+2cp0UBT/5kLQXri+MIjP1GyNJx1PF/mw7pPsHVZ3oWGardq/P5BL+iWRQ649LCtS
 1aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=J+Yk4apVHBSSERRzBwkjGaTHLOulo/YE3D8cBkATAwM=;
 b=dz711/B2cm9vuaM6HwkwSYWRbk5tNIT+2N3ovY/XZ6jn30qCYHbOmTSNL18p9RhInq
 VKlfdpgAjHb8HVL6snZ55GCy3hF1SXsR+5fCQMPfjvyGH9UoArxycm4d0TucwDeCGq1I
 SAE2eUmJdxWNjqyL3875isNpLMlzA70PEg9ifBRyQZj/hy8Auoviwgkp0XiE/qEVhLmO
 Mhm5YXXsPiqA0A7x3zt9Gg9DEpBLBGwxaSdrkQumd5GA7LpaSnZw11D+msh8otP3uBRY
 2Q+mrOtqKqa76u9WgWWBK/KkIBHXBBrzkPTaNn0nrXW4H8gNROQV00ZttsMMeJWAT7xP
 XfVg==
X-Gm-Message-State: AKaTC03YiHjUbqrBR5alSTvMDeovCpCEoB2OtK/6yhlUFCBJQ3s9ca6VD5AiMKcYG/9oqnCMoO2K7/RQIzTJGg==
X-Received: by 10.202.220.139 with SMTP id t133mr7695925oig.82.1479713173117; 
 Sun, 20 Nov 2016 23:26:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:52 -0800 (PST)
In-Reply-To: <1479478938-13267-25-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-25-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:52 +1030
X-Google-Sender-Auth: _gMjO2U4tv6FZJxyhAvIX8lI6EU
Message-ID: <CACPK8XfHPRLggBB13t20dsmq2ncMmD=H47izjUFOMuxvoa7wnw@mail.gmail.com>
Subject: Re: [PATCH qemu 24/38] aspeed/smc: use flash model option
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:15 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> so that we can change the flash model from the command line.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
