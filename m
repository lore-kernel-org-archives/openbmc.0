Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5gl1mPPzDvJF
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fOFO10vT; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 2so7334568vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=3vzm2Ur9UChqAW93UKQIxsEfqEzVYX6q4cfxGbYQTyI=;
 b=fOFO10vTIikIpySy6bQuqf0XOgChO3+EZ3p5Xlq6izS6jHa8Be4jGdXrU0O0djr3J0
 djPCADhzOBX/p+p06JjUduLMlTRFVrw5NXPnn3jBbtrhTeVQE/L1kRh4PaXqS1t9ALWU
 HmBvZsLCfUWVyHPaIiFJBm29LSVoFYa5pl6178R06ABZ1bfT0uh3/7VNUX80uw9yNL1r
 A7l6VYtTRpJNC1v3y5zHpbPPSFkPxifObChG0VWXCXo8pR4yhvwDr7n/mmJndpTTmXj4
 yjcTzqrvmR3bhiyHU/L5IL1oIMi/qmUN4LJjqsTxb3JPtns0VJOPLgTNSqWqsLXM1e0z
 4HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=3vzm2Ur9UChqAW93UKQIxsEfqEzVYX6q4cfxGbYQTyI=;
 b=BvdyGkEeow2AVGCbuJX85aKCAwPDbADX5ybipNGAEk6HigrU9Kcjd8Wq+++yXMajQ+
 NTF47TZrokQMz6hYlhzlXhKSDx1OVFdE07g8NX+lI+PU3eg/NRPI06/NNqFdZaKDV8nC
 deAceXyCIQuzMngyCW/XKA/v8tDv38TAqiD8Pu3DBJB7ZdIs3hD0+vaeb/Rz10eDLQCj
 gqZF9qiWX708oa0qfGhfI57kKtDDSe1KvGE66EXcPLRj7vQhy1aU9fDdmFbs7ahixpds
 zCcUCC1Tr02HWDWKWMmrAMAGIV3Ql1bOgSPNBfv/rzptg74DgnOgKGW+ewaBsGNffdNS
 DW9g==
X-Gm-Message-State: AA6/9RnTNcXwgqgbXBoZYZrxPIprngn+eRot3t1/CLpEBhfZpsHMDTGhY2YJFX+0KotnwSas0UYfglIPVkajfw==
X-Received: by 10.31.102.6 with SMTP id a6mr13660506vkc.151.1476680592678;
 Sun, 16 Oct 2016 22:03:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:02:52 -0700 (PDT)
In-Reply-To: <1476448684-6149-4-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:32:52 +1030
X-Google-Sender-Auth: MKD1FPBFUmTaZKOENUnAUSOHrXk
Message-ID: <CACPK8XdoMn4gV8+L4s-deaa-p0bFrvQhPtwTb2rHh6fr-qHMCg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 03/12] mtd: spi-nor: Add Micronix mx66l1g45g
 spi flash
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:03:15 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Milton Miller <miltonm@us.ibm.com>
>
> These modules are used on the OpenPOWER Witherspoon systems to hold
> the POWER9 host firmware image.
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
