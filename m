Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pxJg0h6+"; 
 dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TKJW6nw6zDqD5
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 05:23:39 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id t28so15785438qte.6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=21TaYyAt37MS8dbGKFh0O85PwEg5TUocZgf00+JGctE=;
 b=pxJg0h6+zGTg5Gy1Hy/GxMjWtkCvknUxuXue90HV/CpUcRvpSMJb5Lg0j6bS6X4r2l
 5cc0840/0W74t3AD3E5QYA2Qm/GBkS72zkhYcRT0k0pfk8uE71MsjrwQd5Sh2Qnvu8h2
 PSJExpliI1qWjncwtF8p5sxfJ54vDGaA+P9oAH0gvLR9dmHozCWV1fS8u4Lx934xcyWW
 ZzynbSC8yMMBqWi9BurFH8lMq6CzEaVDebuqDO3S+NyorL89gdBEENvL3GJpjLVMT1NN
 kCSrHvW6lRLMQ2N0Ga1nKCUiOGIpPfRLJ376gcpdol5MozN0+6K+IzT1fy6yhcKmKhQm
 f3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=21TaYyAt37MS8dbGKFh0O85PwEg5TUocZgf00+JGctE=;
 b=qsSfz+gwj5IUH2TykLApVIl6sA+q9nijFXQARgubCYt7dg+VxVblWNCzx1OkBJvtwe
 6c4MK1nkabg7T25G4kKfWK+ZD1FYDyekko9iFS6UzSLdHp6I12dvUZQt+J42kSFLw9/U
 8+HPj9iKDroEwt5I1QnggaybcTbmxyAXlYKRmDLSgnt6PwIY9AjmFFZmBH+7JoL1ITNw
 ADm8qOOttWRMlJP8a3AFl4LLE/DCz2j5fmWAJd++MRf9kdMcbKSVyLGcgWYnjfnyp0pI
 rpQzKT7DtH0T7pziGUddMoP0o+Eh1Ge1k1VcCT5qvBf914xWldrQdcxbN9kK3+Wj5ohm
 G2kQ==
X-Gm-Message-State: APjAAAWqMpTaoZNdYbzUWbxpiXJSG5IZeX4zNzhFsfpNW2hv5inkhU7+
 IQdSC8HVcJwykM4q0+G946xwqIVQapNUxIwDe8pXBpzqSEty6Q==
X-Google-Smtp-Source: APXvYqwA7JYMZlVMwkbzhq56oPhwfv2FQcjbxm/6AvETKxboJEqRS5JunZZgFJGIAVuDR+CzmffQ6tcrdejHzfWQuWs=
X-Received: by 2002:aed:3b14:: with SMTP id p20mr27405233qte.240.1553624615667; 
 Tue, 26 Mar 2019 11:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <e031e16dfaee4709825bce55601317c2@quantatw.com>
In-Reply-To: <e031e16dfaee4709825bce55601317c2@quantatw.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 26 Mar 2019 11:23:24 -0700
Message-ID: <CAJoAoZ=b1MZsqBrE1vNEEpBPsNtta5D6qJuqDp-QOk=DROMZJQ@mail.gmail.com>
Subject: Re: discuss buildjson code
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
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
X-List-Received-Date: Tue, 26 Mar 2019 18:23:41 -0000

Hank,

It looks like you're talking about this file:
https://github.com/openbmc/phosphor-pid-control/blob/master/pid/buildjson.c=
pp

Please include at least the project name and even better the source
code link in the future. OpenBMC has >100 individual repositories and
it's a lot to ask someone to identify a piece of code by the relative
filepath within a project.

You can also use the Blame button within github to show who made the
changes at the lines you're worried about. I can see that pstrinkle
(venture@google.com) just made the fix after reading your email today,
though. https://github.com/openbmc/phosphor-pid-control/commit/e3eeef45a722=
b57d4c3bb379df165e0bd14993bd

As a rule of thumb, in the future when you write the list, please give
as much information as you can to make it easier on people reading :)

Emily

On Mon, Mar 25, 2019 at 11:34 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <H=
ank.Liou@quantatw.com> wrote:
>
> Hi all,
>
> I am reading at the source code of /pid/buildjson.cpp. Is there an error =
in line 59 and 69? To be precise, I think j should be p since only p has el=
ements positiveHysteresis and negativeHysteresis.
>
> Sincerely,
>
> Hank Liou
> Quanta Computer Inc.



--=20
Emily Shaffer
