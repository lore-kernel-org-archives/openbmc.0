Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::234; helo=mail-it0-x234.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ITIFtU7Y"; 
 dkim-atps=neutral
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1NkN6CjszDxCH
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 03:33:16 +1100 (AEDT)
Received: by mail-it0-x234.google.com with SMTP id 68so3450461ite.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 08:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=weuh0JKHqd9hkq17pHotBgp1pFcqt76DF1fiGHsAcw8=;
 b=ITIFtU7YchiDjo/mcKfAM06itswxuZo6eHPBofoPW0QSe1vQ4MmiY7vQP68LNBZYD5
 ITVTOPrSztycXEVfz2DJ9e7ipCrJ44TIPh6oP94jY0yRoDbSFm4kSGLCWYLKsm/uDkjG
 iemlgppUfxy/JPkaUAGdkKVGVEfGfQ/bjxwn9Meh1RDkcB6TPW4C29vOC1zXcYrtMWxy
 sD1t26EVOKzYRripT3Ht0naMcKGoOc7HoMtIIFHo/ECJEj4zJQF2Ryj0pyQJUJfTcdnF
 WVQVYZkQm5EfeCpB6tcXADYWidiJGlSyIckENoSCtXR1+Xw6X80muq2AWP4onPLn1W8S
 j7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=weuh0JKHqd9hkq17pHotBgp1pFcqt76DF1fiGHsAcw8=;
 b=jU7eDlqe+fE2fNH8c+0e0xXkPgvwwvlKbHU2AtYrxPxsxXSLXnxSyZOilw1AboAMmF
 JTTC2Kgo3spPbzcY7LMHgquo21acymSiKgLTDv0hiF49bpcxQgMy6al/kDz/WYUw3v9f
 F8mTjWWfOZNldEZ++3HB/DWRA5XXc0oN8KQn52pxS+kn4EQGA5F/q99g5aCJFIdudq94
 wtffdxFaBUkYUa+F4inQUyK/clTToO7fqddqpMdR+pvRhNwXcxs2yEp9EaRVY4kAvNaN
 z/LpV+ocC7LJWDkzHSSssv3cj3j6tdC7AfyJgu4SnnaMP6eNvp7GfdkfA06OYJAhftJe
 fvrQ==
X-Gm-Message-State: AKGB3mJ3+2DECMKsmDH34Bipv1vj0UFDgpj/kwMrKzswoSsfWIUlO3Ao
 3LoP36HiH7pYjjfgjxwjXdr+Ubhn5f2+lKD1jMalXg==
X-Google-Smtp-Source: ACJfBos7FR00lHUqXBE7rPnqM9TP9vZiLI/+keUCPahxuvYGAWC6CZ4hnBJ/rgk/GSSmeVdcaX1Erk86KjILw6EzobU=
X-Received: by 10.36.147.193 with SMTP id y184mr3674392itd.64.1513701193947;
 Tue, 19 Dec 2017 08:33:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.159.76 with HTTP; Tue, 19 Dec 2017 08:33:13 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 19 Dec 2017 10:33:13 -0600
Message-ID: <CALLMt=qTuFzUzibRxdmH-SQEou5vL1PwDHyCUe8OH4TLaCRTUw@mail.gmail.com>
Subject: Preventing a service from spamming the journal
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 19 Dec 2017 16:33:17 -0000

With the enablement of persistent journal (i.e. writing the journal to
a persistent location in the bmc filesystem) with witherspoon, we had
to configure a maximum size of 2.5MB.  This size can provide 2000+
entries but if you have a =E2=80=9Cbad=E2=80=9D service it can quickly wrap=
 out other
critical data.  The primary goal is always to fix those =E2=80=9Cbad=E2=80=
=9D services
but sometimes the solution is not easy, or you don=E2=80=99t discover the b=
ad
service until after you=E2=80=99ve lost your data.

Reading through
https://www.freedesktop.org/software/systemd/man/journald.conf.html
there are couple of solutions within journald, but none are ideal.

RateLimitIntervalSec=3D, RateLimitBurst=3D
These allow us to configure, how many entries a service can make
within a defined time limit.  I did a quick test on our system where I
set these to 60 sec and 10 entries max.  The journal was nice and
easily readable due to these 2 messages :)

Dec 19 15:35:48 witherspoon systemd-journald[2426]: Suppressed 71
messages from /init.scope
Dec 19 15:36:14 witherspoon systemd-journald[2426]: Suppressed 356
messages from /system.slice/phosphor-ipmi-host.service

The problem with this is it=E2=80=99s a very broad solution, there are def
times where we want certain services to be able to log more then the
limit we=E2=80=99d like to impose on other services.

Another possibility is to change MaxLevelStore=3D to something like
=E2=80=9Cnotice=E2=80=9D.  This means all info and debug logs are dropped. =
 Once
again, we have a lot of services that log things useful for debug in
the debug or info levels of journald.

So, thoughts or ideas are appreciated.  I=E2=80=99m thinking at a minimum, =
we
could tweak the defaults for RateLimit.  Currently they=E2=80=99re at 1000
messages every 30 seconds.  500 messages every 10 minutes seems more
reasonable to me in the openbmc env.

Andrew
