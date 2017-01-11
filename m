Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tywLy05n0zDqN7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 15:06:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oc0NDX9I"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id f144so12960213pfa.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y6SIdYCaBCwkA/NUUjqoji7jlEJKHswr3PrsPY6uP3U=;
 b=oc0NDX9I2yhTfGRnrI14kuVhhGHKvBwYQ8Lf439U/GZtz52kmHFivoO4fGIfacyD7j
 JJZVWd7Vxh44WAI7B0E1Yyvq37g48Wf4xkvCQuAMzY+LW6PzHGtynUc0tjRGeUf/opwV
 DnXnv5TEM7eXKhZ4R6qfrec1lUMKCw63NZPcKjcrd+ghJvRJksotS50EyZbkDUOZZ2/V
 XY7HceYr86Evua9WGLOiu7PX7HnG2WKGetwhJXYB5ZqyDix5FccCyAgrDMQmeBO9u0j6
 M0t+yVt6BZA+2EcFInypnDjc6S2E9NiL5AT4nEV7VZASYQT2TzP9LuvTbByyoHTkFWlZ
 6peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6SIdYCaBCwkA/NUUjqoji7jlEJKHswr3PrsPY6uP3U=;
 b=C4tnyctyR2xoOQbmT1+sjHtIBrVvJGJl/F+v2rusQJvDIT95wKL1tCXEvjsSs6GxKE
 yK/J6P5a5rGx04kaFBilTx4fJ8llPHr1Lf0w5iJxpEeVvWRDcaHy/+rwweGjTaTURwbI
 ZKd4i8FjgSSIFPSiVzxCkScD9574P2soUGkxYHKjeVw8ur3vcFdJIOckCXkw/UVjmt3O
 vmVx7hPbdzusrkgqGNkb4JWqdc7vqo5OZ7EOZcQnRcSFsql/lAZenwtTLGhjJ5N8emVj
 5y7oTH/OnuJPNVi5gNIpSkYF/84BriHulDBGv68zHjoPwGnFt1cOGCYTY0TukV3egkfw
 YrpQ==
X-Gm-Message-State: AIkVDXJNvuJJsK+dv9C0JDXhN7tcbQCAkzfRi3QQiAU98bUpiRNuk04vkzryDUiAumaw6Q==
X-Received: by 10.98.208.70 with SMTP id p67mr7943962pfg.15.1484107608188;
 Tue, 10 Jan 2017 20:06:48 -0800 (PST)
Received: from [10.192.255.231] ([202.81.18.29])
 by smtp.googlemail.com with ESMTPSA id a2sm9168868pgn.24.2017.01.10.20.06.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Jan 2017 20:06:47 -0800 (PST)
Message-ID: <1484107562.2182.0.camel@gmail.com>
Subject: Re: [PATCH v3 5/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 11 Jan 2017 15:06:02 +1100
In-Reply-To: <CACPK8Xdo3g9_vOV3PHfnLuO43dAdR2w56q5rrtTQYuQw_hW1_g@mail.gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
 <20170110090640.12608-6-cyrilbur@gmail.com>
 <CACPK8XcEuN6mF5Ex0bPExkYnTYVL9Yz5M=rYbojDRicHLwjf1A@mail.gmail.com>
 <CACPK8Xdo3g9_vOV3PHfnLuO43dAdR2w56q5rrtTQYuQw_hW1_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 11 Jan 2017 04:06:50 -0000

On Wed, 2017-01-11 at 14:54 +1100, Joel Stanley wrote:
> On Wed, Jan 11, 2017 at 11:33 AM, Joel Stanley <joel@jms.id.au> wrote:
> > > +       if ((file->f_flags & O_NONBLOCK) &&
> > > +               !(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > > +                       return -EAGAIN;
> > > +       else if (wait_event_interruptible(mbox->queue,
> > > +                        mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > 
> > You read MBOX_BMC_CTRL twice. Is that intentional?
> 
> In fact, you keep reading it forever thanks to the magic of the
> wait_event_interruptible macro.
> 

Heh, yes. Although your spidey senses were correct the if condition is
wrong.

> Carry on.
> 
> Cheers,
> 
> Joel
