Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FxHpF9UG"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrzTn6Q1vzDr3H
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 19:07:57 +1000 (AEST)
Received: by mail-lf0-x241.google.com with SMTP id m199so5042157lfe.5
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=TBbTr5EMuy7hRUyVPtDzLuEyuxJC+9Zy2ruZZBZw5AA=;
 b=FxHpF9UGUSyY6+YD6XI+qGmDRLVN+9NKYiQVRg8CQiuf5zE6E2iD9NjTjJzSNjsAmu
 +SIwwgXLsoimnv6ukr2S1A4pKVroq2Ypp/f8JAr+H4EmM723CzZ19mCrK8CwFYc53ajF
 +D6UEFQ0sM+UjNGoctRZJDvIldYRVMbDirXD0Ta8wDDDFD89DBn2r6z86+5t0BtqDR1R
 80+zqCOc1/rEaGRBSROhLL/kbwB+ck652SyuJ14emaIXXzgoL7Yt+CL/DNx0UXOltogc
 S18OpVW5JBzWZWH8zHLkz2qkl9RUrc32MVBgVEOJCWUI40Sow7VzPd+1jtkkkSW5IshP
 FfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=TBbTr5EMuy7hRUyVPtDzLuEyuxJC+9Zy2ruZZBZw5AA=;
 b=Gdgt0m9SYfRErdDkgg7dbexVeUkFCdKgG2WhMcgdFgSCrnUjXvtsIloYK4tPWrVnJI
 h/Wm2SbkXnYj/1pBL5MKqeMeWrKTNIbcBNCtdZyiL5NIlOavRB+8lRoE/3qaGHhZ2Sb+
 buJh5Bun5ZxMx0eo/11LAZlk2lgjJN1DbUkZKHfZaopW2dwuvLOCkPtUrQ+BnqxzE+oH
 UwpneOzM3qoyS49qPAXu3WlBKpXXPKSy3zp2kL/gFfUe42Ml9Yv7Gafv1qjAEegQOxTt
 kzpjxii8PhksabNWk5zD+3eF8KGmLstEmjFkqtT4cutEln4DUB0iJWzQDd2yaQidpVZc
 F8jw==
X-Gm-Message-State: AHPjjUgMuWA7JqdK2Cj9JdrD7JK1sgTibDJtX8cNd27c6yr798iPWOQ9
 ES7jD7zjvovfWnUWs2B4H4RRakzHu/axTko=
X-Google-Smtp-Source: AOwi7QAwKp2Psgl4C7vB8XkacnlSdEeUhP3T4cbMrxrZpbXl1PQNXCRyymoE+AhP4w0Rw4s9KRsKGKHhQ6bhSti6bnw=
X-Received: by 10.25.181.5 with SMTP id e5mr4139115lff.42.1505207274417; Tue,
 12 Sep 2017 02:07:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 02:07:33 -0700 (PDT)
In-Reply-To: <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
References: <1505200336.4080.3.camel@aj.id.au>
 <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 19:07:33 +1000
X-Google-Sender-Auth: 15dQRKpJemO3jq8mx_pyKHHRhkY
Message-ID: <CACPK8Xe2GqA+UwsTcGe3F5b6QWUT=GCOzxRYcaWes8hngXRpQQ@mail.gmail.com>
Subject: Re: QEMU 2.10.0
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 12 Sep 2017 09:07:58 -0000

On Tue, Sep 12, 2017 at 5:26 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 09/12/2017 09:12 AM, Andrew Jeffery wrote:
>> Hello,
>>
>> I've updated openbmc/qemu's master to 2.10.0. For anyone maintaining
>> patches on top of master I've merged the old master state into 2.10.0
>> with the --ours strategy, then applied the series C=C3=A9dric is maintai=
ning
>> on top. This means any patches you might have on top of master should
>> rebase easily due to shared history, whilst keeping our yet-to-be-
>> upstreamed patches in an easily identified set.
>
> Here are some updates on the QEMU wiki :
>
>         https://github.com/openbmc/qemu/wiki

Thanks Andrew and Cedric.

I built myself openbmc/qemu master and tried to boot a dev-4.10 kernel
with a simple busybox based userspace on it. It hangs at "Starting
network".

I was previously using Cedric's 'aspeed' branch from a long time ago.

This is my little qemu script that I use. Can you reproduce? Or tell
me what I'm doing wrong here?

 #!/bin/bash

: ${BMC_CS1:=3D/srv/tftp/flash-witherspoon}
: ${BMC_CS2:=3D${BMC_CS1}}
: ${PNOR:=3D/srv/tftp/witherspoon.pnor}

~/dev/qemu/openbmc/arm-softmmu/qemu-system-arm -m 512 -M witherspoon-bmc \
-nodefaults -nographic -serial stdio \
-net nic -net user,hostname=3Dqemu,hostfwd=3D::2222-:22,hostfwd=3D::2623-:6=
23 \
-drive file=3D${BMC_CS1},format=3Draw,if=3Dmtd \
-drive file=3D${BMC_CS2},format=3Draw,if=3Dmtd \
-drive file=3D${PNOR},format=3Draw,if=3Dmtd \
"$@"

Cheers,

Joel
