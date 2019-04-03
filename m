Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::131; helo=mail-it1-x131.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bv+l5g9G"; 
 dkim-atps=neutral
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YsW369Q9zDqPy
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 14:48:31 +1100 (AEDT)
Received: by mail-it1-x131.google.com with SMTP id w15so9055188itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 20:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ABalFz4T080jmAugl++0wAu2YXdjl9SHJCVVZx5d2cs=;
 b=Bv+l5g9GmLrZya/XZykX3JbYz1SpHaMtXaT5feGS1WlF81FZ8syujkwNOEdela6o1B
 A8QzMbPQh6vyjDly9g+NDkfr6nrc42lhrRMzozUSes7Dh9Nzsg+iTIwlsB12hvFNGFri
 ekd1GCRjOl8DZfFJqKpN3YWJAzwX8EXk7tae2jKiS1swtKkhiXg7ujuoGgr1muq9yaBO
 23bFnC6fOkFofBItMvnwwXM5WM0iKcky+7QQVPyV4yGREsTyKHL5wo2t0PtgrEOshJmp
 khlxeTCK94Wuxu3Hrk1kIxisZxdOhyzE/6Dp0k1GYSxILOXC1hsijKTTUD0+g+8wH0UB
 u2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ABalFz4T080jmAugl++0wAu2YXdjl9SHJCVVZx5d2cs=;
 b=nCrDorye6DnxzVwHTK3UCBw2CJ39qod90aArn3m4co7IqxKoy7scyS44ZDDWc8N4fd
 3LslzQ+3Y8pRsjakD4+MjGXqesSy0U7KezCAtcy87Ufvs4VyuFPB/fRV2oIt4ESgEq69
 C72onJKEC3+F42Wg6iuzfmN3iNr96CriX9qsf6pF73YBM7n1GxN19oMP/V12TWTmHspt
 tSuFZCrhfDkXN21aufxCx99vhOUCoSAhmoZy7lRQmiN681fcq5PrtbVtSirKmMAQeH7x
 /a193PKFJ3SgZwBJ7oZpiqz2d0IkqpUiG0rC62FQ7/I578UEJlZrUF0rQj5M8i3y5S1z
 kvrA==
X-Gm-Message-State: APjAAAULwP4VC5Y5FlYJQhZGSsP0FwI9Rbnq8AQ1VuH17se4IrkEybBI
 jy7brEcYu5slQlurtqRB0ZiD11NJ8PqRt/vipz4gnJ2xbYo=
X-Google-Smtp-Source: APXvYqz5GYvSOxcLGCz9ek79TcP3XZiWZN6usDhC/f9WsszAmWXprqOEAhGRVSPAF66I2THeqBBVryEhv3w1cMC8+u0=
X-Received: by 2002:a24:6fce:: with SMTP id x197mr266061itb.108.1554263307998; 
 Tue, 02 Apr 2019 20:48:27 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Wed, 3 Apr 2019 11:48:03 +0800
Message-ID: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
Subject: Proposal for removing legacy code update services
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 03 Apr 2019 03:48:32 -0000

Hi All,

With 3ba97559e, OpenBMC supports PNOR code update by
org.open_power.Software.Host.Updater.service, with the steps described in
[host-code-update.md][1]

And before that OpenBMC already supports BMC code update by
xyz.openbmc_project.Software.BMC.Updater.service as well, with the steps
described in [ubi-code-update.md][2]

So it's time to remove the legacy services that could be replaced:
- org.openbmc.control.BmcFlash.service
- org.openbmc.control.Flash.service
- org.openbmc.managers.Download.service

What do you think?

Thanks!

[1]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
[2]: https://github.com/openbmc/docs/blob/master/code-update/ubi-code-update.md
