Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCH5WrTzDvk7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvMy2+L9"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so20837976oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=2fZA2XpXr5eT+97okljtxcFOSxe27Hv+wj+WeBL3tmQ=;
 b=YvMy2+L9zybKIJInIoegJY3dK57L2TVQoxaWxFLTr1iPvAi4xk3npxMz0aBpLpMaIj
 V/dIQcA1+nZuweIlcCAlFnYR+ETa0Dg6p+KPawZ8CjCG/oO4PB2rUBO9iPKVPXaN0v2p
 k+YnM+AhuGB2izEwpfwoGfzVE7sQHw51M3QWAJuOZhj0yGJbNPx0XMH5X1jcjMfcZHW1
 +iD9cHmMg2Tpa6y/noLL1itnz0yjOuEcwGKAlMVh5wSYYhakbYYZ0VNXHBqjmz5W6con
 0hBq6tcqs/w2z8uqjQnnDrSUbPzgN629yyyHK9vsZZkCJU3FNrhPAnYmrHERt0kaT0UJ
 ZaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=2fZA2XpXr5eT+97okljtxcFOSxe27Hv+wj+WeBL3tmQ=;
 b=U+95bULgbiuCigdid91u5IOVWsXY5YEqNdo4ENWRFeCLgkbJX6mWvw6C6SnD5SFmNc
 dPlCtraJ7WA+JRQ7lkf4G84MoRldJGrE/vR8uqLqS/vd+1IBgNSeVUbs4T5HraIsUt4C
 z4dwUCWsz2l8MnMn9wNhP3MFpz1vuMiUGs5ZAMg9rmHaemRb6E9ObyKfEmdFKF3q/mUM
 +SEXzTFkgQN4csJqBDi+20mUJKI+4RWZYasoA+uKnz26KMN+kJxVMGmfTK4RajMuzITb
 zQQkfau0deeL+MREk9Mq+WJr6brOiFvBaEXzmjW6JlTNSdmMgghqnGugbqBSGTGNBnkv
 mBbA==
X-Gm-Message-State: AKaTC01LW+svBolg+HxsCZc1O/MCIy69WOXQzXfsSYWNmoVaQ3DLnrRoimxqP43BPqlrMtQ9BjgdyyyHrUak3Q==
X-Received: by 10.157.24.41 with SMTP id b38mr7377643ote.117.1479713210072;
 Sun, 20 Nov 2016 23:26:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:29 -0800 (PST)
In-Reply-To: <1479478938-13267-8-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-8-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:29 +1030
X-Google-Sender-Auth: rnrmcWRRbJuUz4tcWss-2Q_MRWk
Message-ID: <CACPK8Xe_Zj1PpyTnbhG=0gvssHiOG1M9U8EY_9e0Oma3oE-HPQ@mail.gmail.com>
Subject: Re: [PATCH qemu 07/38] aspeed: add the definitions for the AST2400 A1
 SoC
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:52 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> There is not much differences with the A0 revision a part from the DDR
> calibration.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c          | 10 ++++++++++
>  hw/misc/aspeed_scu.c         |  2 ++
>  hw/misc/aspeed_sdmc.c        |  3 +++
>  include/hw/misc/aspeed_scu.h |  1 +
>  4 files changed, 16 insertions(+)
