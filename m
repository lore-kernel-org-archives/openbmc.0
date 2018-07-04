Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="br+8aw2t"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L3Z128XtzF1QL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 11:39:20 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id v83-v6so5835045itc.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 18:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qhx7/6rcOFX3iSgaSdAyzhy5/cSqikSktvU4XJDHGDw=;
 b=br+8aw2tI/6xG1K0MUZjoUdjdD83iHlHQOid6PTCNLio2rt2H3R5c+nCZdjY/95Cxg
 wpF2iWodTuMv87XUNvl9Szh7+d8J4EV3JHJM1tU7oKrM9xzhIYV8x/jg/oesgoWrpZUF
 gORrJwq+Mnf/bkzGSTsW2JJNiYgiSpDmyp+skPdyiNxzpNsj30VTnUZPlaqslIvVsrdT
 ZEqul4vCbLqML0H8J0vz/nRYk5HcUWu+bwxcOP153FMzwIWxNr9N8AWMX3ABbmw0PrON
 YoIJJrBh/tC6FD6QA1N3z1hvtpEbReez7/I0VPE6LyqMmh64Wbc2HlYj7JiODE66Vv0F
 LHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qhx7/6rcOFX3iSgaSdAyzhy5/cSqikSktvU4XJDHGDw=;
 b=Ao+iIll/o6qnFRUrUrZ+nUA43SLSs9py1/bWSWNc8nBY9kQ9sBYM6F3junPVLKSB+s
 nbMfr2q8keaOukbMWDWZGKStMj51aPyhrPHMh9Kpj4jOPGA+Wjx/NNaqSn+7vrHdyR2d
 smlGdVRMxGTNedViNJSKKndQX9BiWpzRdS6y1eKqfmeDL/1t66uvk/wGASoXgxzIueoW
 93SA7hskUUcn7bE9M1cvB4aQHeXBuia+weKY1pHdy3z55z8P1SSpMb+5bfWU59OPEbW2
 5b++LKJ8/Rb9drJw5zBfP/KglOqsSp3jAwFc82TSQsDtOjOew8XjbJ+Ro3I3j8rn7AgO
 +vYA==
X-Gm-Message-State: APt69E1TPsJh3DhXVtCWs1CuQ+07j63SI43YRbblkWjH/iHUXy3se+R5
 gE0Jv7hshXTtH+1gQqNXzFc+N3dmppzi4Pc3fMI=
X-Google-Smtp-Source: AAOMgpeKYreGK3LBcWgpQJfSRCvY6qhSqqR4cSfBD5fgyqJCAR7KAYl+tCcywej3idOYGby+NBIoiADaJV/UNX/X+dU=
X-Received: by 2002:a24:e34d:: with SMTP id d74-v6mr337552ith.22.1530668358289; 
 Tue, 03 Jul 2018 18:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
In-Reply-To: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 4 Jul 2018 09:39:02 +0800
Message-ID: <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 01:39:22 -0000

> I would like to enable a specific Kernel config in my machine.
> I don't want to modify the 'defconfig'
>
> Could anyone tell me how to do?

Please refer to machine-layer recipes, e.g. meta-romulus' linux recipe:
https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-kernel/linux
