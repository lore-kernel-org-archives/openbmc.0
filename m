Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgDD2vryzDvj0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ipSZ2Ek0"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id m75so2042387oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=as++xru2iQW5wrfLoo9LvsWGI8VN482QdIKex6VivW4=;
 b=ipSZ2Ek0J78W44tRHIQAPWqKPBU3q70gubJiZaJ6TLRcTBOlbNCwwuNaJBNG3pWU+7
 f/ICz54CJ/r3h67fCVU4T6Fp8vH7a9edSyKwbpPtiWvvX8dj+1gFs1YPZWK6d8zjP+sj
 hEiOaLhKbp6jXXJlpppSa7USre51Ly0Me6ZB+MMx2uGylOrLISrTWNNvp+64gQrjJrrl
 0jiBar8jOSfpFtM1OANPFC4cY/4o6qOGI2zX7zNx6uDNDF6A7Izzl+nDI5614fgCx0R+
 nIPkoXjAhbR+pVdhR85kdtuDTnoz01N5VA8rgaUCuFjswt/vxcwgd+SzhmPhcphyEx8t
 vneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=as++xru2iQW5wrfLoo9LvsWGI8VN482QdIKex6VivW4=;
 b=bqWhgLMd+CIg8tMWi8So2r5kjuM0j9oq1yq8s/GecGQaZt+240p6b4lsjWAUXkiX+0
 FH8S8y8/cyvH2x6qycG9gmoShSzHrFoV5iDyt5xUMOLcKGtMeHP4UCsuG2uBAmP5CwFV
 ekCVJMZ0NTuOrEbG4U3BVAIR20lpklJ0nfXxdZTP2xFJ0gTdCB5HX25I0tslDb4O9MFd
 FT8CtknbmNLPQN2TM9oOWU/uVbt4y32/hEZp7odAsGH0WI8laFEg/oQULEHdN4gWjkp9
 Cc/6XvU1OYy171LIFhbr5p9j95+F22WqrQE27OfrsEQd8F+zBO7bPmiRpFBBM5snZo+L
 kzhg==
X-Gm-Message-State: AKaTC01Cw6bugTFYWN1pBf3ZoOLbMo9mOsiRub7bqOqeV+Sgm4COefXwO4BS8rK8fcX/hoNKqnRvoSeMcFAkJQ==
X-Received: by 10.202.80.203 with SMTP id e194mr7730447oib.188.1479713258598; 
 Sun, 20 Nov 2016 23:27:38 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:27:18 -0800 (PST)
In-Reply-To: <1479478938-13267-32-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-32-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:57:18 +1030
X-Google-Sender-Auth: GsyUBV32jvOmvZlQYfpCoHUrjao
Message-ID: <CACPK8XcHgj5RVLCWdyxWLPTaPadm+9VU1u_QXpgAyBTQdhUmpw@mail.gmail.com>
Subject: Re: [PATCH qemu 31/38] aspeed: add a watchdog controller
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:41 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:

I assume with this we can reboot the guest? Might be worth mentioning
in the commit message.

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c         | 13 +++++++++++++
>  include/hw/arm/aspeed_soc.h |  2 ++
>  2 files changed, 15 insertions(+)
