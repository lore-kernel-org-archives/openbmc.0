Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EHq0I0dO"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HxKX7cFv"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418Tzs64xVzF0dj
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 21:55:04 +1000 (AEST)
Received: by mail-qt0-x234.google.com with SMTP id x34-v6so14784731qtk.5
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=YtcI4nSi95V61km8WEUn8hkdYpKoPhkEYyTVNsMUYYE=;
 b=EHq0I0dOpZwUMEk31VEE8Mb25CnW4v87mjDay6JdGkH529aOPG1KWPmmossz3/+FI2
 gGB4fv0jKvt2ZQvxyjKmimemfy+ThC/0+C3NjIaVZKt8wT5TdoTMpJdCm4vI31ePoZwy
 8qiOJcwEZMXvdWDqvOyy/IGgI1q4t4tIA66t0/Y5t4Hpxd0UewF4UKmUGp+ocmgvj3xz
 RvbayezwuqYG2PNcrjCwGAXD+VZK4DmkPbuonXuJ55r1//c337wMMx/rKizc1TadhpYo
 3CzBOe1Mb8/l20lqhx6ALpVqdMg6gz4iXZnE2PrSQ02VFYd139JqdYTOStK2NgnZw3wI
 /qLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=YtcI4nSi95V61km8WEUn8hkdYpKoPhkEYyTVNsMUYYE=;
 b=HxKX7cFvUv65aQpCEAHvMEEy4yiq+V7TJeV1wt2U9m2Vy2hzzZWAyGHqsvJ7elY3uC
 UBopKDg4PDhVz/uw8XHtRo1zdPpYlquoj2MYcHoUKyJEtqtnh3mJvj4/06rC8ai91+DQ
 Gvtbo54iAX0WxU5ncpPuQO8OAjZzEhjhfMR7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=YtcI4nSi95V61km8WEUn8hkdYpKoPhkEYyTVNsMUYYE=;
 b=q0Dh/QDjWlZmjGNRVzkFN5dNKbo0lyXo+ckPzJroA3QouJe4DgqQXBKgPfOCFEEgDo
 pgtPwL4VTjIYrUkLG15t2FXCh6W/qJMujMOmQ7Jz3VgvtE93e2s/ja177Oea6QUwJc8L
 CjoZHtaUWiCdnNVtJoEvxPypa5672M2w0Ei5PJUJtRDUbaTyoVQoKtOOhSwAc3cxH/Ow
 q+S0vbnGZIhDcJjkyzKfiyQRxWvhzAgZmGVSuhO4gV8cQf36C7T/uuSsqoj/n4vZs090
 VJoK/PfEvsfzZ656jAzvB0lz0NLYzXer4Nl/s+ASe5E6L8SAFqNlVYLkilcLqKt88tID
 RNtQ==
X-Gm-Message-State: APt69E1jlF5sAIPRyeQUjZYca6I/90Dp4XxxF+qQc90kh1GWftYudnZ6
 mxAkIGPDg3sO3d5yjkcnVlBeJacd+XANw23P+o8=
X-Google-Smtp-Source: ADUXVKLvcYyAB0uV4fZ8JupEcitWXX6YNFQ2+7EHcvvxbPMryFeFklA34C942d+/OexJeZkNhip9dM6VGflFg2EjJS8=
X-Received: by 2002:a0c:f24e:: with SMTP id
 z14-v6mr10238823qvl.208.1529322901618; 
 Mon, 18 Jun 2018 04:55:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 04:54:41
 -0700 (PDT)
In-Reply-To: <0BBFBB96-82ED-4623-A820-EC08A819BFFA@fb.com>
References: <0BBFBB96-82ED-4623-A820-EC08A819BFFA@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Jun 2018 21:24:41 +0930
X-Google-Sender-Auth: _OwCQnRnmOhNn8ZVhgUHuAi81Ks
Message-ID: <CACPK8Xej43LHYgoG1jmdLMLe9ThkDAEEm82-Pn3u0+Yk+SAyHA@mail.gmail.com>
Subject: Re: move to 4.17-based kernel?
To: Tao Ren <taoren@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Jun 2018 11:55:07 -0000

Hi Tao,

On 18 June 2018 at 21:21, Tao Ren <taoren@fb.com> wrote:
> Not sure if I missed anything during communication, but I just want to kn=
ow
> if we have already moved to 4.17-based kernel or we are still working on =
it?
> I checked github.com:openbmc/linux.git and didn=E2=80=99t find 4.17 branc=
h, and
> that=E2=80=99s why I=E2=80=99m asking.

It's not published yet, but testing has gone well and I intend to
publish it in the next day or two. I'll send an announcement to the
list when I do so.

Cheers,

Joel
