Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UxzHV0pk"; 
 dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jdQQ5g7rzDqDC
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 05:11:26 +1000 (AEST)
Received: by mail-vs1-xe33.google.com with SMTP id o10so10102247vsp.12
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f8EjsXDyhPhOgU8QE6IFxKsq+X/JOEV83YOwflreb3E=;
 b=UxzHV0pkumR1AN2UprsFcrCAnjDQxeoJ+4/0ZhG+Y2jQYIw3C10m1gahTJ0El9KwHV
 OLylgYpkEJZpu9wMDlenByBhHsZnTurttH00k2Em0JdoYTspw/0gaEAe5PpAmh9smloY
 0V9G3i1AHZ1GPxnB1AqvZaARZwoaD04mJSKo1oLq0l6Z6Xh7P4y0IkyAauz+t96v18pQ
 wtv4WznMGcpjqX513PLWWAYqxFeRuS0gcAarCUc4XXa3cIrWL3cFQVCVSOnV/Dzfq6A9
 JTRdTMMdZuSkTGao4DZptf5T85AimrygZmhFvVAOXnUz7HlD5MeZQXfoUk2mXXAfPaV6
 1euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f8EjsXDyhPhOgU8QE6IFxKsq+X/JOEV83YOwflreb3E=;
 b=NXuEepn9dDmxmR6xTefVAM0tRzK0PGunDe/JpzwiTWnlDUzjeWVOg+8cOVZrG2/iQR
 o2++WYPEWZMyRFdO5rgcp6YGfGFaRmMCoQYRj57YbErd0B2DdcrqaOBmvN3R/cCnNhMq
 704lMsZVFu3pVDSs56PuCY3y2dKUY+ZtovRaheqA6qwfDLwt9AE2VIbrpj0UPd4dxy+w
 3nkKwud6mcDlr6lkEl8KYKQQbzxYUXGok73NXec6xt15zbHfDJD2dQ1fETT/rm2lLO5n
 ABZNbOimu1kuCAI0pCFC/djQSjKPP82qbdxavXMxhImsj9gCpbhDhPcLp+ouVs33Qtjr
 UPxA==
X-Gm-Message-State: APjAAAVw/8SamYv8eJFv23/6ONWDPdPXcIxMRnq2fRlbn+ArJcxjpa3f
 josBriXLSHM4hEAeAMdHxPpoRsz/mpde7MsxGzDtYSzc
X-Google-Smtp-Source: APXvYqzbG2lkb1aWnQMI5Z4uCRVHYqCULpQ8y2BJU1/LnrRAJkaey9JEjpnaresZnksk84ieO1b0uNTSGozsEG08Ugk=
X-Received: by 2002:a05:6102:147:: with SMTP id
 a7mr36850980vsr.210.1555355483042; 
 Mon, 15 Apr 2019 12:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <cfdea58494de44aa8e30b18799b24aa3@Eltsrv03.Eltan.local>
In-Reply-To: <cfdea58494de44aa8e30b18799b24aa3@Eltsrv03.Eltan.local>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 15 Apr 2019 14:11:11 -0500
Message-ID: <CAG5Oiwj5a15Bm6i9SzJe-_zPO=9KRJfMdqDEopxznqj=UQ49fA@mail.gmail.com>
Subject: Re: which licenses are allowed for OpenBMC projects
To: Wim Vervoorn <wvervoorn@eltan.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 15 Apr 2019 19:11:27 -0000

The best answer is: it depends. I would recommend checking with your
legal team on what you will be able to do for your custom product
implementation.

Disclaimer: I am not a lawyer, but generally speaking, you can pull in
other "packages" without worry about them being viral infected. The
term "parts" can mean many things, you will need to figure out whether
just code is being pulled into a existing tree with a different
license, or if you are talking about shipping an additional package
with your product.

Open source licenses and their viral effects:
https://en.wikipedia.org/wiki/Viral_license
https://en.wikipedia.org/wiki/Permissive_software_license
https://www.toptal.com/open-source/developers-guide-to-open-source-licenses

Kurt Taylor (krtaylor)

On Mon, Apr 15, 2019 at 4:51 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
>
> Hello,
>
>
>
> I have a non-technical question about the OpenBMC project.
>
>
>
> If we create a custom implementation for an OpenBMC project which we deli=
ver to a customer can we include parts that are under a BSD or a proprietar=
y license? In this case the Yocto files would be in the tree but the code p=
ulled in could be binary or a BSD repository?
>
>
>
> For us it=E2=80=99s important to make sure we understand correctly what t=
he possibilities are.
>
>
>
> Best regards,
>
>
> Wim Vervoorn
>
>
