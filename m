Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::233; helo=mail-qt0-x233.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="srGAUTSF"; 
 dkim-atps=neutral
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLgQ02BRVzF0W0
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 06:33:59 +1100 (AEDT)
Received: by mail-qt0-x233.google.com with SMTP id a16so19701102qtj.3
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 11:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=whSMFMS4EQwSULgri7SoJ8jTUSvtBkB0/pwQbgpGYD0=;
 b=srGAUTSFGiJgTmU4inXXb/MqXJZxQQ1Xj+ErjoJVxlqRttoRQT4aq9Ng/6Gc17mzF2
 0Y+i+qfqpaDQv+YI1Z74QiO5EBCwYkcLKPHYiNIjqVYGyXoT0TBvaon9sTWpICE1V4zO
 mtiEpKjoUDGsaCWpXXKP3YLDjo4bW5liP3im1NvcRU+Po2LUKP3W1IpQghz8VrnyZwhB
 pe05SuxxJJtSWxoobHSDCnVkLUbQ2pPJ/Jn0uGhosYw62bcuaCDln+jrEywJarMCO3gg
 JXALySUMavvQZtIiNKDZmA26all2xjl4Qk50kyNHr0JGHdtWblU0f2d0c0UdAMC+IzQJ
 dukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=whSMFMS4EQwSULgri7SoJ8jTUSvtBkB0/pwQbgpGYD0=;
 b=pDTiGPXH6NOyYkElRh2RciL9eYY83Jv7VTvxG6a/d/I6CPqUmJtS80foSE8npSdl+F
 Q78WtOFELbcrDEiIUV4Rg0rUtzyoDgogoP3CFiTCqqn6/1OcjrUAAia0ZsH3i0zzNS4U
 9MGjihqyvlM7aXL4Uobcfiv2c0V1lkySZOikXw6S2rTUdEmlhnVlYMhkV7FA0e+IpDw7
 dqUFW6OyZIbR8RSuVJ/4jiUWsQeq03R3TV6jnWOx0uYnQItJIrA7TSFUNrtlOXab+pq/
 dUPCEhnM32mAroRI/0RCQBalweYWTALAZixjnq4Fd8Flgk9rrAR4RVRsm7DB/K6EVxPQ
 TyVw==
X-Gm-Message-State: AKwxytekI3qwaVoWJ+nn1E5pKo+LOWHGMto1J1WTC3yd/M9FdvYuFkfv
 xIRwUZlkTPR1PKTgVn1f2jkQnJHIdjExf8ahDKg=
X-Google-Smtp-Source: ACJfBot75yWcN8lJijQ4VoGZtwlqybEUyjJyv/EZBnNBq5lh5cf3vxZrbMEfQsb3KpYQbklgTQhSKOZ8U0l9sCiSRNA=
X-Received: by 10.200.23.219 with SMTP id r27mr12493144qtk.314.1516131237465; 
 Tue, 16 Jan 2018 11:33:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 11:33:37 -0800 (PST)
In-Reply-To: <d1ba8d62a46a42899e9caba4c021f014@ausx13mpc109.AMER.DELL.COM>
References: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
 <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
 <d1ba8d62a46a42899e9caba4c021f014@ausx13mpc109.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 13:33:37 -0600
X-Google-Sender-Auth: Uzv5g1PRcMzN8eNLzz4bqzpLw04
Message-ID: <CACPK8XeU9weGFES-SFDoFSe9DMOOsfaEPpZHqfmEd98MgYtBPQ@mail.gmail.com>
Subject: Re: Issue with flash space overflow? Maybe?
To: Balaji.B.Rao@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 19:34:01 -0000

On Tue, Jan 16, 2018 at 9:14 AM,  <Balaji.B.Rao@dell.com> wrote:
> Joel,
>
> I didn=E2=80=99t change any build parameters, but the python packages. It=
 clearly builds well when the number of packages are lower. However as I ad=
d more packages, I see this issue. While I'd like to investigate JFFS2 kern=
el options as you suggested, I'm leaning toward flash space. Is there a way=
 to find if that is the case?

These warnings are commonly due to a mismatch between the options
enabled when creating the filesystem and the options that are enabled
when mounting it.

If you are certain that you are booting with exactly the same kernel
options as was used when first flashing the device, then you must have
corrupted the JFFS2 partition. I suggest reflashing your JFFS2
partition.

Here are some other suggestions:

 http://www.linux-mtd.infradead.org/faq/jffs2.html#L_magicnfound

We haven't had any other failures reported with the mtd driver, so I
do not think it's a problem with the mtd driver.
