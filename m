Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::233; helo=mail-qk0-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bcaAyAbQ"; 
 dkim-atps=neutral
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgSjq0kx2zF0wB
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 14:30:51 +1100 (AEDT)
Received: by mail-qk0-x233.google.com with SMTP id o7so6590079qkc.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 19:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NJApHhd7ZiCYQDWAVT7ROrxDTP/z7JWuWbeuQy9A85s=;
 b=bcaAyAbQ1euY7HLVl9sQFFtZgEgQHZFe4TcZoMQt8CBF2hWV0zjZayBUhjCOnZE4XL
 4aQFi8STBrj3SJs8l7KToYJ3z4ZZTiVFqdxt9W0hMkdsqzwR573ZTKqTsD/B/jgNj6er
 7vs/4saw/xmGDsOtH0owZdCNWNOi8/aaOt8/cq8xlY2Wt79cI12OkSDw/1rQ9RpD+9o9
 ajDNElBGKQ2ooiKI54PPBATP/yG153kUbIxX7/+wX5jYNntDMnbfFL9iRZImA4ANg7Jb
 CazZzQ7aOLAn8arpoBC+TIXAlad7MDdoKy8aK+fQCK+bNxje5h2Q63fuitDe+4+iBOCK
 XNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NJApHhd7ZiCYQDWAVT7ROrxDTP/z7JWuWbeuQy9A85s=;
 b=DftUcnhQkqe7cSFRn4sAGCAbao2599V/t8lJ2UzTnI8vQb+zDC/1QXjogBdRUvGToo
 Rrft3oFsPSV7WXarXNrrNqAF75u4opanZNNm/qJ5pGIpT7GpitYLaIficDpoY18aqUQd
 pP7wk7FcKDfVZpRMfH1oCHM60bLJIELRxmx1FISsTLVmflCnml2ddEnm+gSR/G9262VY
 f7wNTWFY5ulJgye3OdfEsyPn61GdPDolJb/kTqkd2rS1tCdpqTWnHMA+AZdSUo/Qkm+T
 vf+MAzKd5yarXiCxevaO5EwqNSaGC8S0VTwHVxUNPzg3KQVzdJuX9Sv5AU8EyNZ0F+jJ
 Zviw==
X-Gm-Message-State: APf1xPDgXdxA6k2M/jrn0IwsWIefnddzoBLRgVhcxAHxrNvn6cmL7HVQ
 W6/8ZdXSINXi29GAJyemiahIINNu50TqxqetHegWAA==
X-Google-Smtp-Source: AH8x224z6gs0NF+svEEPrYuzfMe89tZIPe1eV8SEyCRoIsQdUuZAHOfrxhQKEWJYA06WTfyDPOy36URnyRA1ukEGzN0=
X-Received: by 10.55.73.139 with SMTP id w133mr21233915qka.21.1518492648584;
 Mon, 12 Feb 2018 19:30:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.76 with HTTP; Mon, 12 Feb 2018 19:30:48 -0800 (PST)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 12 Feb 2018 21:30:48 -0600
Message-ID: <CAG5OiwjqhO1PTP71K4qv=oJxsVc42Of1kL8eQdc=a5o5f8r+6Q@mail.gmail.com>
Subject: OpenBMC weekly community telecon - wiki agenda page
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114a9d78e9c28105650f9e2a"
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
X-List-Received-Date: Tue, 13 Feb 2018 03:30:56 -0000

--001a114a9d78e9c28105650f9e2a
Content-Type: text/plain; charset="UTF-8"

I created a page for adding weekly agenda topics, let's give that a go:
https://github.com/openbmc/openbmc/wiki/Weekly-Community-Telecon

How about we add topics and keep the week prior for carry over
conversations or recap?

Kurt Taylor (krtaylor)

--001a114a9d78e9c28105650f9e2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I created a page for adding weekly agenda topics=
, let&#39;s give that a go:<br><a href=3D"https://github.com/openbmc/openbm=
c/wiki/Weekly-Community-Telecon">https://github.com/openbmc/openbmc/wiki/We=
ekly-Community-Telecon</a><br><br></div>How about we add topics and keep th=
e week prior for carry over conversations or recap?<br><br></div>Kurt Taylo=
r (krtaylor)<br></div>

--001a114a9d78e9c28105650f9e2a--
