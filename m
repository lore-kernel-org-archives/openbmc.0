Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBf2KlMzDvk7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="li/2Pz/W"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id u15so1446139oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=JMjtfd2bx7rNT6hATKy3U8jNDeQvePWMF6jokaK5wBo=;
 b=li/2Pz/WFEMzrMtB14ZpQSPdqZ0Iz489nyP4t+jyGhfPeCtAb1s07KLeoGnbkbrFbJ
 Uc5hGz5NiM6LU5z8uhlkq+UUWQrsOs29uBfarcswBlD62OpfkW1iIiIYbjDBIc1NlGFM
 FYa5t1rCvUr+BDlWwx9lzFt1+joAHA1O9cu6uNBfdoDuOkO1pD6lzsG8z5ijnrkV1+XN
 U09Ipj2m4JjRBi3zdYEQWB9iQWPUA5oMFlhGK4RZt5E9sc1TxDzCwBhyoZs+jVIDiC5C
 1tcnQDrRMJRF5ov3fYoGBlBQoxX+3R5tV35r0/0TFfu4+k1jYml2XQT8V+SkndwJMG//
 e6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=JMjtfd2bx7rNT6hATKy3U8jNDeQvePWMF6jokaK5wBo=;
 b=HgTOjrv0U1GLgmIB8N+9gMJzyNUBzfbzG7vMxUTboKc/Hq7BiGKO5mW7MSerPOWqe5
 cKu1jo6D7L10uU0sDDxkno/RXkmsM1Krt9ASDlGnIMYocOm9JSdKQD0qkYV/gGH7wHxH
 IGivfyPCKC9rO4Tqp37oKwMIPVsC8I7HDQQ5goPBZ9XVlebVsMUQqhybMCsefXpfWuDW
 ob6CBTwMuJ6Ph7OrxsAtVm2Fx8xJpUDECVDg+8n6g6tjw46NmbUMykscj7pY0mliFyF2
 19niFC6mJwM8fDw6S9CNHL7A5JCLs/244kC5Lj3vOImcwKoMiRDNls8ToQRWw+4JvMAo
 7YZA==
X-Gm-Message-State: AKaTC01XeXGFXNLdXJK5vCzT724w7OowIBbV1c48w7GQAeFHjN99JFWRLc6X1s3lwWEHkn2KSngMnnAGWu3s0A==
X-Received: by 10.202.55.70 with SMTP id e67mr7703204oia.51.1479713176626;
 Sun, 20 Nov 2016 23:26:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:56 -0800 (PST)
In-Reply-To: <1479478938-13267-26-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-26-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:56 +1030
X-Google-Sender-Auth: TybYpy9pP-AeZphMgQIZG6dAvRk
Message-ID: <CACPK8XdhqdOg2qs-QATrKdYBtU8UdRMqBxLnuwzwnHHq5it74Q@mail.gmail.com>
Subject: Re: [PATCH qemu 25/38] aspeed/sdmc: rework the locking register of
 the memory controller
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:18 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The lock register is unlocked with a write of a special value and
> locked with a write of any other value. When unlocked, reads return
> one and when locked a zero.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/misc/aspeed_sdmc.c         | 28 +++++++++++++++++++---------
>  include/hw/misc/aspeed_sdmc.h |  1 +
>  2 files changed, 20 insertions(+), 9 deletions(-)
