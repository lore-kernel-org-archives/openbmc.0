Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pBa+ZdWQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VLFv1ssHzDqCR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 06:09:38 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id c25so14957872pgb.4
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 11:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=13f0fijVTooVPnevDiVGjWmfNWCLjL+vqflID10cg/Y=;
 b=pBa+ZdWQPekmf5+J1Q4gSmJPr1kye6l+7y7NeCA8cRnHnQn9POnBR85kJEvUow/FMP
 9JiIToNzAmYZra5H+C9/igtoRxJBaUfPU9GdzeQbtbkyaiU6EF8OKEiMjd++HkKf7wm2
 FYpqv596dCETW0AWgn8BFbinZXYfZ6qiFF02m0+EXkxKiCo0APBbAMc60g2+KrXMP/vx
 QlyBZkisRX/Cp+J1miaSFZjKi/JBfxzaAcPktaX48zPt0Tv4GNforvQ+8UFVPpeH5fxO
 VC+0G+WSN2NAvCnerBXKuPOxcC2HcckleVDsAebwQO/ngbl+EXD9RGrkKB9PAQGZnMjg
 /g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=13f0fijVTooVPnevDiVGjWmfNWCLjL+vqflID10cg/Y=;
 b=jMr9rwuDAZyjGkZWXfF3nDRD5qMk2NJk1k2W7CD+OVZSCn88rrmQ3F674Ias8PujgD
 w2bX4LITq7gjJTQJLxJMUEXAULkglRmd5e/KgFvprV+FXjknKk29G0PU6Hsqb5QCfgNY
 r6Mg5/uGIt3tXj4pkoc7zp5Uw7RnaMM0dTV57R8cRPcUkW8KvFv08DXGQb6/IQTkpldS
 UmnFZd8oPJOCjSEwOYN9uUQaWKFmQMPYeqQtcU/Fv+kafpQtH+hYP2LSiCjrBz9zZpHf
 8rWlJCq4XzrzAgViTvSZ8relFA/017N1W8cifenyWH+8XKDGSeEWikurL5lfXwTCmywZ
 sQEw==
X-Gm-Message-State: AJcUukcH9nbcZHQ/GNIjG690aUyQsPU/t75a127pUPxS/7sHTqj0BF+l
 fHxf8rPip5V7aRO0rfg8IKVv75fCbVGDm/fslkYzWg==
X-Google-Smtp-Source: ALg8bN6Lue21e+meP00I10piYBGt+5thOSklcQTrAEmgpR9WG756sbrRRe+cRyP0OXn+Pzj0hp+pViJELeX5LQJolE0=
X-Received: by 2002:a63:4d:: with SMTP id 74mr14787459pga.248.1546456176258;
 Wed, 02 Jan 2019 11:09:36 -0800 (PST)
MIME-Version: 1.0
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
In-Reply-To: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Jan 2019 11:09:24 -0800
Message-ID: <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
Subject: Re: journal log messages are missing with latest version
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Li,
 Yong B" <yong.b.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2019 19:09:40 -0000

On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com> wrote:
>
>
>
> Hi Patrick,
>
>
>
> I encountered a problem after upgrade to the latest opnebmc version:
>
>
>
> These log messages in ipmid are missing with the =E2=80=9Cjournalctl -f=
=E2=80=9D.

Which log messages?

>
>
>
> My tests shows that the blow change is related, after I revert it, I can =
get these log messages.
>
>
>
> Did you meet such issue, or any suggestions/comments to narrow down this =
issue?
>
> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066baa6f37=
11c88d6a3b9a5c4d49
>
> add sdjournal interface to inject tests

There were some follow-on patches for phosphor-logging that you
shouldn't need -- it's

What SHA is for your https://github.com/openbmc/phosphor-host-ipmid ?
(so I know what version of that is in use by you).

Checking the HEAD version of
https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile.am,
I see it's including the proper libs to get the full phosphor-logging
objects.

>
>
>
> Thanks,
>
> Yong
