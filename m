Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22e; helo=mail-qt0-x22e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rfz3D2py"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="U475jhP4"; 
 dkim-atps=neutral
Received: from mail-qt0-x22e.google.com (mail-qt0-x22e.google.com
 [IPv6:2607:f8b0:400d:c0d::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRFl0lcVzF1Lb;
 Thu, 28 Jun 2018 14:12:42 +1000 (AEST)
Received: by mail-qt0-x22e.google.com with SMTP id l10-v6so3633650qtj.0;
 Wed, 27 Jun 2018 21:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fN8hCwxtQwEM6xRNMJUxbh7l5EF16hTHzBycvduYrGA=;
 b=Rfz3D2pyyX7gBwMqLUD7RE2kuBT9rMczP4f/l33bLlWsy1ZBKhBmnhZi0PgsZ+gkS0
 Oaz4+hWly7jp/jEKXPM+ooDKbAlJ5ZNGn8YR+oLJS/GUjsCGCb9TA/B44m0LDd2f4Zu2
 uxt1Yv636RG1M16gulZi6OWd2KqTN0RYy6zEu/0xm1Uk4JFOHuQnppYOFolAZqQyHxOh
 rae4GDoSV+EmnyAMeonFhS1ktqYv06ZzBe1LjA4/uB6Pw11noUhyJv5WlaM9QAY3oPcf
 CSBOoBBaKTdbZGD8E/L0dUQInWYPuuMRKiND29XPTf3gCxqpQvcg6Bw4b2++wBtTDmmV
 T/fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fN8hCwxtQwEM6xRNMJUxbh7l5EF16hTHzBycvduYrGA=;
 b=U475jhP4QUNj1xTqyXcGkSZobXKZunjTrXRYLKa//P3ol06KN/S9BTKNh+D69UrQtM
 J1G9xVg81dCnSw6BZ5EYtNyknUApc1XP/74iwOowSZxNJebDbm2FpSvH1yp8Y4XUgHBU
 91UBBpljl9bTpk4cY7Zvw0MUWcd4T9dBt1evc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fN8hCwxtQwEM6xRNMJUxbh7l5EF16hTHzBycvduYrGA=;
 b=fv9ZRsTcg65fkr/goyA8Iw03pNllxg1b+8dVZuBEhOV2Ps1AoPvgBIBMeTGD8WNDpM
 KN8Fg278yzQpU3OOBsGkFbYB4Gklhyxp7LOUSYUXb+CUDx/fB1woY6QlX8kZ+Bog3HQg
 bmx1OQCWnNX7kw3nDS3Yg3Si9A3iFWXi/5sjYMHZ3lKi7N/yDJBA2ev+2zoGBz8ZSzWP
 bDiTyNub4kR3yea+4+eCYWq2ma21e7j7Z1N1YDR761oaYbk7c4LYdrP0x7ETtDwyy+Iv
 92Pe+iIy9Z442rL82zZPAXL+WNkBt/kH+LrzXtjqJebagSDF1BKg42xIrlUjIkoRlSVN
 FPdw==
X-Gm-Message-State: APt69E0y/tLHbnjx7ktI/N1FL6KRpwkIQdrtb21NRXf8QDjqsg8yHAQz
 506RHJ42ljp+9cNjBMDCtZtZINtlLgI9l0JsApo=
X-Google-Smtp-Source: AAOMgpdPdpGNacQ/5cuAnNpW1MUBieTj4rI4VIV4z3RqxcEdzS4E0e56TsoOPNIG2BMLh4B+gtKtPZCKwWk4Asyui60=
X-Received: by 2002:a0c:b892:: with SMTP id
 y18-v6mr7759523qvf.188.1530159160620; 
 Wed, 27 Jun 2018 21:12:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:12:20
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-12-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-12-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:42:20 +0930
X-Google-Sender-Auth: gwVSt078kkl2v3vegZs74cOOf9E
Message-ID: <CACPK8Xc6zRXUzEyde=A2m8U2mzaeNMu8w=XFW77-5_uJgW3EgQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] dt-bindings: fsi: Document binding for the
 fsi-master-ast-cf "device"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2018 04:12:43 -0000

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This isn't per-se a real device, it's a pseudo-device that
> represents the use of the Aspeed built-in ColdFire to
> implement the FSI protocol by bitbanging the GPIOs instead
> of doing it from the ARM core.
>
> Thus it's a drop-in replacement for the existing
> fsi-master-gpio pseudo-device for use on systems for which
> a corresponding firmware file exists. It has most of the
> same properties, plus some more needed to operate the
> coprocessor.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Acked-by: Joel Stanley <joel@jms.id.au>
