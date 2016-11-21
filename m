Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgB75GwqzDvjR
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFWbu/BX"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id v84so20835082oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=/CiH9tO0bPaSTVmw8KSH8H/3/YvMjZt3KmItSAI0cOo=;
 b=FFWbu/BXi3tcWlrx+Ue/HRws5NCjZ/ilYF+mM/rm+AUiWujNQ2uiBfknUMNO6dtllY
 qbvWIN/KwU5qlKvyvYTpcA6UZjy1yzYbO0u5uDgAPBxiI7lpXbofs4pEf+zaNcmFziIL
 sOqzYpSuKfTxavPMG9BCvk2LSLEyWfY69KqE6mAnnekqG2IWRGZ9dvvlW/eYmuZhiUCn
 VJwkqtOWlhAoyW7JGH9nuiRdSb1laocGaJ4tZ9oP101ZDdPulWP+E13RQVfvB5PJWkNy
 TLLoe34o5MgM0TftRh24nd4WLZ/UITYmixkdmjanESslX2w5sAQjr6gyk7DK2QPrTN87
 gTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=/CiH9tO0bPaSTVmw8KSH8H/3/YvMjZt3KmItSAI0cOo=;
 b=dhcVurDSRkeKMxhBQ7aXrwKvRzK/extZpBBI8Kzi7kOjl6bjFI0Y0uga7jx1w+53v4
 PE07MeUnfS28Fx6524M3pRTK8Ld/gU1/Bl4lKBm1MsjpcBDaa4IeRJYf5erWKBRneVQ/
 8Q7xl8y+yBXCGlP5zY2VHzYFuaC2OcdnXlUpI5n3rucQKEQjRy838KL7k01BA7XJyErx
 esDRm7LK8ViXGVgk4DDOQCb0pajqbMJIMZo+yyxyZ3cILkORYCUnQP/VAuEoFuNR8EF4
 jLZ0R+PDTlfXDZXgXV8WvA8er0Lp35jnmjDhHd3C+BgyUMG2TRb85tsal1MEWZhCrSH0
 QMbQ==
X-Gm-Message-State: AKaTC00hB7XsjaREIrgl0C3yxqc/96g/eK/ZP5zkz2Oycjvzn46y6V/x2vRkGSI1DxEWEAMo9N5nMZ+GwGKBCQ==
X-Received: by 10.202.80.203 with SMTP id e194mr7727062oib.188.1479713150044; 
 Sun, 20 Nov 2016 23:25:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:29 -0800 (PST)
In-Reply-To: <1479478938-13267-15-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-15-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:29 +1030
X-Google-Sender-Auth: 1b_QJbIo_ODmSJMoQpBfR1I5ibo
Message-ID: <CACPK8XdxL7Ss3CFGV8Vftp_em8d8duvN4ZBynA77peOnqCx2Pw@mail.gmail.com>
Subject: Re: [PATCH qemu 14/38] aspeed/smc: autostrap CE0/1 configuration
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:52 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> HW autodetect type and size of the first and second flash modules of
> the FMC controller.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
