Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBw5dbpzDvWg
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1ADRra5"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id v84so20837242oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=X+NyS3b4Ch5svopoaCm5cE/8x53mT1PvlQuaXBfqTb0=;
 b=H1ADRra5sr0ByaQjB3cU8CYVsO03a9r0JbRNFEvT+MV1UzwtC7mSax6cLdwTkZeea+
 cQdbb81dvC/Eo1KxSZZGdU6fxorusLgo+sH6iMfc0rrBbiVCgIl0kocKvXgBSomjshIr
 AKnrKvXcurfCr76SYasdHdmxWHM986iPGEoj3ueP8BTw17GaMs31neQ0IX13xEztpK+W
 MVLWKRp0hq0HfUbKYcWrDEfcjH44IlokKAkoHKpyORxV5z7UEpavs2x0oV2IsfnWaZay
 OdbG/FQ8LNYVYN3n5hZmLK4ga/Ci0aM1nTnn2inQbjeUfOlgYaAD8nIQ+kuNvUZr8w8E
 gzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=X+NyS3b4Ch5svopoaCm5cE/8x53mT1PvlQuaXBfqTb0=;
 b=F2Cm8ykpagMgF7vpnJg8YgOtUjfqVxYVugliT+8yObR1hp9Ra8ZnVeWbIkpXmrO61u
 tye2uKNZmYyHfYMPpEYnu9xXv+1er3Amw++PXsF6CQxjKFYLw4vzaqS8QMn0zL1boNNm
 tdBZ0dgcfYBKQN0Rzzp3OEFoW12wi+yLw8gMa3ixUNwTBJHBw20n4Dv1ARTty2AHQQyB
 W8mOHGAlxaGrca9vY7Km7cSd0SPQPwY65Hey/DeiMmMHaspBdSz9aq2bnYJMzfFzzcCs
 /oFoRqEV9XpnMd1gwYUQBx4byjCrD6jxHsDRS28vFAH4DDTtWS/SIt/S1KC6PrH6ry+K
 zkCA==
X-Gm-Message-State: AKaTC03/PuC83XUeaJt6jsd8fN66+JBjJBjVp5jfGMCqxLAy+Z3w8zJkJWoMjYPyh6CzQ1LsuSEEa81+mIHv0w==
X-Received: by 10.202.78.140 with SMTP id c134mr7049083oib.198.1479713191080; 
 Sun, 20 Nov 2016 23:26:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:10 -0800 (PST)
In-Reply-To: <1479478938-13267-33-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-33-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:10 +1030
X-Google-Sender-Auth: zD1-57cw1vMfEJ_IWpZCY3LEVFg
Message-ID: <CACPK8XeMK5=xen0-cKzohY6AKSSo_A9bXOmudwrNb1jobrpmOQ@mail.gmail.com>
Subject: Re: [PATCH qemu 32/38] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:33 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Andrew Jeffery <andrew@aj.id.au>
>
> The implementation was incorrectly scaling the reload value by
> nanoseconds per second. In reality the span represented by the reload
> value is determined by the selected clock, either APB or 1MHz.
>
> Test the selected clock and apply the appropriate scaling, then
> convert to nanoseconds for the timer infrastructure. Note that the APB
> rate is hard-coded and reflects the value used by the timer
> controller, and isn't necessarily an accurate representation of the
> clock configuration programmed in the SCU.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/watchdog/wdt_aspeed.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
