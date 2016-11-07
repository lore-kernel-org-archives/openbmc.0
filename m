Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxCY0ZRhzDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:26:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ygsf4N50"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id b123so1632688itb.2
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=peJ5ANBv+UJPUqiLKagZTQf1xy+yL9sagCvnDqJ76hI=;
 b=Ygsf4N50Ba4oORSGpHfz1QZu+8w9tHZ7lv1j+lJNUg+c874uWqxDEUiAmg5Mi7h06d
 vR3YF8rwGvdAcF3++nJt1kq0O32BE8oDwEr1B7i1j8PlbtvNv+codibptYuU9KP/W/UC
 iuCC4UtjHQiE4aZBJeScLmB8Xn3iGdFo2kWUmU++/adDUMVpH3iT0vEQa0NpzI4Qv2EL
 kYvzfTyPnuu67+XrNQkcdm/Rr/cqSpZyI/Empmp4/It+KilBv/ZxOVj9Kbau2TqVf705
 DN6mb7VrDJ27X4uixYK3Nelib/Sy1F5jlLBvXjWrigLy/Cc0q1vt0huLtqFIjXQx3vUw
 +Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=peJ5ANBv+UJPUqiLKagZTQf1xy+yL9sagCvnDqJ76hI=;
 b=l01q9U283AGb0x6YY8YWlRQSSZy3zw01311jOrcPtj5rxwDrWmZyfRlhvFBF1tgznR
 kF/Q28b0p3pksPWWL3GoX8NVEpcJSBH8irh5e/4RLRKPnwd0r6v4fMvo4Vdqm+vdv9JV
 yu2Um0xeffZvGVSp5vsHM5ER2cCDDGRZlKrBP6vhEmFhpqsTcaAWjtpmYTSXiAYlqI81
 fNz29ZuIiqz9zH0+mqGFsRYaN0xnPcqSHU394651eaOPOktkKeFbFlJkvL++FmrF2pwH
 jS66QMFB4OQP+8sqhMksucmtO2NLDpuO6QNfdeLLZUZhE1TtiEoUn01P/bm9EfLso+P/
 G8Eg==
X-Gm-Message-State: ABUngvfQ4i38XFLXhS8G9zcw9vLkoYdaD9HbKdA47nyY1I5W84UQUksXNOlclhCBPXV4EtPpGU6+5J9Z/Gb4WQ==
X-Received: by 10.157.22.200 with SMTP id s8mr2090709ots.14.1478485607429;
 Sun, 06 Nov 2016 18:26:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:26:27 -0800 (PST)
In-Reply-To: <1478278847-9164-5-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:56:27 +1030
X-Google-Sender-Auth: NPVOwesj20BDtUhoITFLZRwRxOI
Message-ID: <CACPK8Xee0mLKK-7hKitEag1WE2Yp7506tST=BGtnRaU=JYKObQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 4/8] mtd: spi-nor: aspeed: add some logging
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
X-List-Received-Date: Mon, 07 Nov 2016 02:26:49 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
