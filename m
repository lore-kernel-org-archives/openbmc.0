Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22d; helo=mail-lf0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r1ExH8OU"; 
 dkim-atps=neutral
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com
 [IPv6:2a00:1450:4010:c07::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWvGq0J3kzDr62
 for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2017 15:59:29 +1100 (AEDT)
Received: by mail-lf0-x22d.google.com with SMTP id r135so1633573lfe.5
 for <openbmc@lists.ozlabs.org>; Tue, 07 Nov 2017 20:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/LOtGSwiJbUQZzXC1ig2UMqbYK65lXdGJ9dED6O0T+c=;
 b=r1ExH8OUR9G4RE7hn21px65/Nsc139FT5dyI12MVya8pPEIhxfa5Vy3NpIcZ1Z2fiD
 Xa7rTiB+GQcbY4EQSvq6BxC1ETzzZS/T1xVq82vMmDbXiCVXTVgNxvjS8K0+InZG55gx
 X5GouM+C+WGALDZWYezRERjHqb3oK0XmLXA4VbVU1NSFHWlIqTJpGZGEmnv/8cvH5Xm0
 awAmROqQ/f8+lYjDXMqbiSKkpEbdW7c6Nb2IAmQkOZJ/gyxRCTltR0oUugTtRe9PbVsQ
 wXx3oKFQtJEpbgWL7PF5UrbmmqHNl49lYf7U+FkM01hFTE2fMl/U7pURgwGU8wDZbGMg
 AjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/LOtGSwiJbUQZzXC1ig2UMqbYK65lXdGJ9dED6O0T+c=;
 b=INmFuLD1parLOks8GlaBisbxnlTaFW2DmkOqbWgqB5+69q8LJFpjVkb1eaVapv/ULq
 Auf0mKdwJwihOAxd+mVXpY/kkuI5/gDbc2Kq9HsQsi1RZ8K+HeaNKPSsS2zoXKlnOM7t
 Z4N0fnf4zTDBZlm59Zd9B8iRoRF04fhe8v1S12JMDBEsGpKaQrO6InNb3DakvCsPKQRf
 lMnPilB5j9I/KMVD7ykjVjG3oJ8RjKuYJ9khCdQhCl+s/1SsZnk9nDDP0LJrnOJHPJf4
 2oskQNMMPNlZLtK4QnABMvkn+1AIfM3ybReibAyhJFmDbbJiY9tH/6XWjr2zmQQjtwJV
 GIuQ==
X-Gm-Message-State: AJaThX4zBusXw6Ai2IYyFCTJhjP7TpkWeFElLLnwIi/Z43+MkFGDx1HY
 hTOUvbO7ZNQHXY2VGEfweF6+sRh+Wqwv0k+1PJg=
X-Google-Smtp-Source: ABhQp+QqyVEV7ia6Xqd9ezrqyQ0ZQSnghAICQiMj//ETfY7gB7CgndNRpfbH9R8zvBK51qsFhaw58uWiTLduE9CZfrg=
X-Received: by 10.46.93.75 with SMTP id r72mr389042ljb.182.1510117165234; Tue,
 07 Nov 2017 20:59:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Tue, 7 Nov 2017 20:59:04 -0800 (PST)
In-Reply-To: <1509605861-20215-1-git-send-email-mine260309@gmail.com>
References: <1509605861-20215-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Nov 2017 15:29:04 +1030
X-Google-Sender-Auth: 8MrLYflNukNH3tkipanPogeBEoc
Message-ID: <CACPK8XdKdgJQR=vbhxpfQCzPHU1xYqHz7F6WtXaq-rOAXTrXGg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Fix identify LED
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 08 Nov 2017 04:59:32 -0000

On Thu, Nov 2, 2017 at 5:27 PM, Lei YU <mine260309@gmail.com> wrote:
> The identify LED is different from other LEDs and shall be
> ACTIVE_HIGH.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Merged to dev-4.10.

Cheers,

Joel
