Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKGeCbo3"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrN1w2jFhzDrp4
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 11:30:28 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id t197so21264866lfe.7
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 16:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=buIFHVGdHOJi4s1hzVIfqEK4aPXGVeYsRSiAEPF5r8M=;
 b=hKGeCbo36vd9p9glFWOqtlxHCGZxvojvkiXkyElojh428Fyu2rStW3CWHZCjVLgkCT
 VB2/4efycCjvx0ErPPg11kShdJ38EMv6MiWi19v/RdSRDTFJNbPzS2T6LSGiIzPEzXvl
 pZhWvKKOha2aMf07O+blZLzaVcOe7RHhaOFVkYaWLJucMOcNUXRd+l5qI0sSFRga0w0f
 9KI3pv+0aJe/2Uad/4LL5Gzcjk7vWtKwM0rlAYgvQrfm6BG19rT+21iYSZ6bgAWhPwpu
 fQ8lqPt0OYavhNzr0vmf4wljrJxq0qMajdCWGtdvpAatUqPmNQQOXtboGDtkLr4FeCYH
 Hl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=buIFHVGdHOJi4s1hzVIfqEK4aPXGVeYsRSiAEPF5r8M=;
 b=DdxaWNs7bVAyGiEu7QS9yrfh+ATvl6eXGhQPYvZMlCmGKb3GTmlSnfyWbohmmjAKec
 ZS+yJzvbMMJLR32eyiJPPGHRYOJpUFcnhXCSh38LSQYE/O7+hD7+O8Qzcp+gT2ndRjtg
 SabfXQOvBaEa+sc/dH459p4eGxDnaN/qN9BuxC5xRdPel8wwjTeHfVPS0YvVBFA0Wov0
 UlpyGEbO2ILnLdCfdaI+v3yjg1NBxB06c8Nc65ZuNiR3gS8/5r7j3Ry4TY1nuU+LehWU
 gd1GUss64n4z0Erb2CSAvajS+ImSMe/Foqd+R6N5Ux1tSaM6plETNWtOwG+Kppm1ZTOh
 vgOQ==
X-Gm-Message-State: AJaThX4MB9nlvwWvcXuh08lgqjv420YDh8ECO9N00NA+4KsFe+i2kaHD
 a4V6VFwzk41NfT02Okevh/FDpJrntHwC0TEeO7Q=
X-Google-Smtp-Source: AGs4zMZHKmrfWJhYg8+blCU1BFg7W9xy9R9Xr8DUR0C+zX0+f7YmeVPy31DDIyeoNlEioBQYEnpdFgB1QiUSDmALGSc=
X-Received: by 10.25.203.17 with SMTP id b17mr7858102lfg.5.1512433824958; Mon,
 04 Dec 2017 16:30:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 4 Dec 2017 16:30:04 -0800 (PST)
In-Reply-To: <20171204165600.111462-1-venture@google.com>
References: <20171204165600.111462-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Dec 2017 11:00:04 +1030
X-Google-Sender-Auth: 01rqPf5sC-v8lpDdPMjErOcjJlw
Message-ID: <CACPK8Xd_th4vMBbTqNXzLA+nYM_kDkdfbhNbKbEaOPcoKAHTcg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: add aliases for
 i2c pcie
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Dec 2017 00:30:29 -0000

On Tue, Dec 5, 2017 at 3:26 AM, Patrick Venture <venture@google.com> wrote:
> Provide aliases to each i2c bus per labels added for
> each PCIe slot, etc, that are downstream beyond a mux.
>
> Signed-off-by: Patrick Venture <venture@google.com>

The i2c numbering situation is quite messy. However, with the current
i2c core, I don't think there's anything we can do other than come up
with per-machine aliases as you have done here.

Applied to dev-4.10.

Cheers,

Joel
