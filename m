Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQcMkO2m"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NKmF6RmszDqHl
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 02:26:51 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id c16so3382219otn.4
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGvcasr5Zxw3AEvT0E3Qo4b8A66wAZ/VgNdyufB/k9Y=;
 b=MQcMkO2mLW511jn10kbyAGXgqtlqQuXxPZwe6Dnw2KGKZXsP8+qfFKUHVLqivuuPPK
 g2gbENWNTGhQujy1i6AuTgth2H1OfcYr0qV3YYnM4fi5Ug/hPyC0k4CYUJbLXpTYclaP
 4y/XN1AUIIembgxjkhx/8mzht4tjhq0iAvMyEtKo1tGu/r0pQtI2ZgMnWfOCuuRYV016
 zA1vylLZVTeJsgRRZPefmPLWSxF+zhfrvhjLUIBrJwzV/r9optdDIiAniI2IOIv+6xFZ
 zrvg9S4jyvqxh6mrnfPINr+5yR9RNOW0f+b5GrUf8UnNmUTNL6wnCkOpORb2GmsGzm6L
 rb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGvcasr5Zxw3AEvT0E3Qo4b8A66wAZ/VgNdyufB/k9Y=;
 b=pBYr9nFq+zhWbi23NAAgxgXvgeDlHNClAqllpAjFJYtyjdo3o+9x54nizPliqDcaKW
 K2yfYNL4c0wHvGj1Cj5kDhZoHRy3QnyfXAvVHnc+zQd8p/msSJuhSQ9NRUiOQt6xOgAG
 rxUbiRd4Mlam68q9k7uYv41GWYJGvOIN/2MycW0wBPF8Xk/DzoIJYzBKvB7QfeHm+mn3
 dnuXhgKdVx0FoMPYN3w97zywI+qDClQCFQVCGUdLNQepd+jLx03iwfBs/DYX/HvGubcd
 BoM1+g53YsNjQOHVwjpa9vNtC7/lukGDoog/f1hQBpylcUBrT6NcqDU9K7KxEWMZXAYw
 ho1g==
X-Gm-Message-State: APjAAAUeJ+mVs55NGmyjmtYglGpYlJHJ8/mIdOYhcd8kEgglVcK3+od5
 GsI6NTgpoTzSFU4kXAzit9wTYGSfD1Llk8C9g3s=
X-Google-Smtp-Source: APXvYqzogVaee1j9rgDeKa4IzxvT6tAMQffXO/PQJxdX5XV6xjcjrDxjMzuaff2f29wdY+xRNp6r2iQ9exYp5bCzX6M=
X-Received: by 2002:a9d:4914:: with SMTP id e20mr8684320otf.18.1552922808284; 
 Mon, 18 Mar 2019 08:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=rz5Mvohzhavhm+D3Q8g=EZGVyubi+rsMZ3CFV_PHUfPg@mail.gmail.com>
 <CAARXrtmFGBc1dLHSuFY71E=J2RwepmG0Ko=qFTBHT5W0Gv23sQ@mail.gmail.com>
In-Reply-To: <CAARXrtmFGBc1dLHSuFY71E=J2RwepmG0Ko=qFTBHT5W0Gv23sQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 18 Mar 2019 10:26:27 -0500
Message-ID: <CALLMt=q6LDSGK=BhV4R66uSUj3UkMjB1J1gSf1GLbpFcj8G1zQ@mail.gmail.com>
Subject: Re: New Gerrit Upgrade Coming - 2.16.6
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 18 Mar 2019 15:26:55 -0000

On Mon, Mar 11, 2019 at 8:59 PM Lei YU <mine260309@gmail.com> wrote:
>
> > Gerrit 2.16 has moved to the new polygerrit based view by default. It
> > has some neat new features, although does take a little time to get used
> > to.
>
> It looks modern, and has better notification, that when I login to the new
> gerrit, it gives me below message.
>
>    You have draft comments on closed changes. (view all)
>
> It helps me to find that I have some comments drafted, but forgot to send.
> This is really good!

Thanks for taking a look Lei. My plan is to do the upgrade tomorrow morning,
3/19, 7-9am US Central time.

Andrew
