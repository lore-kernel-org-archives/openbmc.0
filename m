Return-Path: <yuenn@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFHx439qhzDvkh
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 09:37:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ot3Y1Wbp"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id t79so60481034wmt.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 14:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=owm+CMqus9KA4HuYIGFfoaeZ7yoqVbjcsC3OBQsgZ8E=;
 b=Ot3Y1Wbp7YRwAXMyBpXPC8EBj1qj8v7GuMjiwTSUeidCCxOAax9ht2pzvioCe1nbGO
 OeRlLX7iQrjc3OpDyIfCiZ0rQMTrdbxt9BPA0p63Nb8SLQuMkQUKBaWWhDXTTMvLNjlL
 6M4/bGqK6YzIJo27AoylWVOMx32CQRfEts4450cW6Ova3XC+hMcba4sd/nb+9eCG2lHa
 YYb4b8q0og9wHXQhjE1wD2H6f+bcqH2XIyRw9d53zjox51y9KmeQyuARPd1s+DRpVxih
 y0DOfK5P9552zsuBxJebcUS49+nifRFx7iqg4hPSqh1osc2TjgJV9xR9E3ilUmoorMSW
 HCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=owm+CMqus9KA4HuYIGFfoaeZ7yoqVbjcsC3OBQsgZ8E=;
 b=ODE/kjLl/j/SW1oSa2TMcCJPi57JcZJjLIjDI6dahQahXsEx1RyQ6ugR9chw8zNlhN
 ubXbdq0MYZZaYuTWThPygIl44UtrUifO0Hrgj9ASWVbgGX/n6KqFqkWu2nk1GeS7wUsD
 7DEZDQAhOIs6vEBYpr1pzdjUXhcQCzahVQ53e5Ug0sYSbqIeRi8WHQMktgxNrMkjBC/f
 33ZDSTxJxXkPIuUZXw+971dNAntLtBIh/r2pEvX0NwMrFhzTQXcm43in9ynAnk6K68pk
 kISU/33Q0IBOLkFcvq2nDmGIyVmjzcoPmY2v+bdb41PjGmilWrVasgj/nFmgocXnbMjo
 Lk/Q==
X-Gm-Message-State: ABUngvdjDJviOlsv8PSN+X47YSEa8K6RfY4APrRv9XjpeXJvbzg1pLwjn8gCkdj+3ISdbOKw4+gUYP1QJLn03fCR
X-Received: by 10.28.67.69 with SMTP id q66mr9156489wma.22.1478817445416; Thu,
 10 Nov 2016 14:37:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Thu, 10 Nov 2016 14:36:44 -0800 (PST)
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 10 Nov 2016 14:36:44 -0800
Message-ID: <CADfYTpHjti40QXSwPHGvgBUTZO9mK8t5h2dvTCnE+1BUAUi1xA@mail.gmail.com>
Subject: AUTHORS files
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0d458285e6080540fa0432
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
X-List-Received-Date: Thu, 10 Nov 2016 22:37:29 -0000

--94eb2c0d458285e6080540fa0432
Content-Type: text/plain; charset=UTF-8

The open source policy at Google requires that any repo on GitHub we
contribute to contain an AUTHORS file listing all contributing
companies/people including Google.

Any objection if I send out patches for AUTHORS files for each of the
openbmc repos, listing Google in the ones where we've contributed?

----------
Nancy

--94eb2c0d458285e6080540fa0432
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The open source policy at Google requires that any repo on=
 GitHub we contribute to contain an AUTHORS file listing all contributing c=
ompanies/people including Google.<div><br></div><div>Any objection if I sen=
d out patches for AUTHORS files for each of the openbmc repos, listing Goog=
le in the ones where we&#39;ve contributed?</div><div><br></div><div><div><=
div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">----------=
<br>Nancy</div></div>
</div></div>

--94eb2c0d458285e6080540fa0432--
