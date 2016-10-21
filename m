Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0XkQ5qLlzDvZk
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 15:29:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=R21EwT4e; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id k64so9382747itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 21:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WIfgMt/jV3MyBcs/6DIL9WXlb956gcEOm3ktF0Z8a8s=;
 b=R21EwT4edMJclhac03M4QBz5YPZzyeK0soovlU5K+0do7d5BYGDzJdJ+1kGnqXAiSt
 q/QGZ58o+LSGPPtiTnAxm/n3DEZsmEbli645ZYms2JQoFEJCR5qmZJgMrZlLsmiKn/2i
 bv3kq3X2HT7QsapsX3AqceT46wVv/di7DYiDLJXBsvDW4K64mypcV0HmFKbTDu5V9jz7
 KUAMLSOxmBC+LeQ0dlur1DBPRMzViQOSrpNhs09/w/3g33jJD9CWQizb8WteyjMkqNgO
 X5xC02UCNsIPu65UWzwPa6K/ibE7myS2DLzyQAcIEsfEu0OsNGWz+vMlMnLWmE9T/iGr
 qX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WIfgMt/jV3MyBcs/6DIL9WXlb956gcEOm3ktF0Z8a8s=;
 b=Plv0iPBY/JAYco3w99icdatGFCYNFM0m4BOTTz9EA5ohWjSZ5O1qTVO4gsLdJD+FDZ
 DvU00es/Hh3chyDthzx8IDrWE9pyt5E7REY1H8/Xy/hpwS0vnhR8uemA7re2RE/cz8be
 M3vtFymv1Y/sTh0GNu9iT9xlJWBU/mI8Fi8ABOOYox+13C2XV6o+2340UQV5mfJ/27F7
 KKt/2260JOQACEy/OQGfunhr4C1BJFxvt6ocfYdzQERkc/PYMiaSgx1TCKoOdqJMf42c
 VZb1IZXOZQffC6e6b9SMz36B6ueVJgCAHaP8Cq4RjEhxbZ/rrErMNGrCfGc+CiIzRSqX
 a1Dg==
X-Gm-Message-State: AA6/9RlZ1VGUeUIKv560aUtjw9QIup4XnsM94uliaMt1xoveChXKufqE2/0rcsBscnYQ8ylyaYF5BZh2L5rL1g==
X-Received: by 10.202.92.198 with SMTP id q189mr9520903oib.6.1477024140498;
 Thu, 20 Oct 2016 21:29:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.200.135 with HTTP; Thu, 20 Oct 2016 21:28:38 -0700 (PDT)
In-Reply-To: <1476971660-6106-1-git-send-email-clg@kaod.org>
References: <1476971660-6106-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 14:58:38 +1030
X-Google-Sender-Auth: sF8zM7Y4cCyKPdsFH96Il-aazFU
Message-ID: <CACPK8XcNJsGuRXGVj2vH0_jzR_uV70cbSebn4CMoi=BtnW73+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] aspeed: fix the debugfs write operation
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
X-List-Received-Date: Fri, 21 Oct 2016 04:29:03 -0000

On Fri, Oct 21, 2016 at 12:24 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> It was incompatible with the seq_file used in the read so the read
> operation was changed also. Now you can write to the debug file with:
>
>   # echo 0x1E630004=3D0x3DBB2081 > /sys/kernel/debug/aspeed/1e630000.spi
>   # cat /sys/kernel/debug/aspeed/1e630000.spi
>   0x1E630000: 0x00000002
>   0x1E630004: 0x3DBB2081
>   0x1E630008: 0x00000000
>   0x1E63000C: 0x00000000
>   0x1E630010: 0x00000000
>   0x1E630014: 0x00000000
>
> Some basic checks are done to not ruin the kernel but anyhow, this is
> not for upstream. It is just a useful devmem replacement.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, applied to dev-4.7 as 311440eef8fcd741337590ed2bc3311c719c02da.

Cheers,

Joel

> ---
>  arch/arm/mach-aspeed/debugfs.c |   69 +++++++++++++++++++++++++++-------=
-------
>  1 file changed, 47 insertions(+), 22 deletions(-)
