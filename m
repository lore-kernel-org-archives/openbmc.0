Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Bdd6y279"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vFy71Rm2zF3HS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 16:08:14 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id w204so17436616qka.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 21:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uvjwPUvkisYWKODAAyuz7NrEGTOVTUIH3U0ny+A/f2U=;
 b=Bdd6y279MTaipmo6Og7RIJEKyA/vCkdjO/DFrPwQE8IwxuWC9sqhjJiDSw25zxJaD8
 1DLWgM4kifVgUjSSDdrbHic+MAFl/BbCQnR1iunYdxX4S6SFyiU73afB4w10ca+q5+y0
 gtZyO2I6RZ766ASS4rZ0pXCwlBE4oqEjs5Q68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uvjwPUvkisYWKODAAyuz7NrEGTOVTUIH3U0ny+A/f2U=;
 b=No/m83FrjsKDPeKvzLgIyu6gQ+sb0VeTHKf8qiASc1/MPhr0RiZy+3pRXPmDW+YY3J
 AWn2Ltw7HY98WUC9ZbZsWsuBEFTzOAtk0u6QqswRlompmzT68QxZqOyxraf7x41QTpRE
 MIXr8e4TpZMDjLmwZtlIVpmUyTIucX2Re6IDRxAeag9NR7DucfaeB6RJi+t9oQn4bL8N
 4DHoMXFlEQTbjry1ab73+xFPX/Iv7+4R9orSEaGLvTtsnn74GAmXq9+epyeLUkNlr3FB
 p+HWmcAF7xslhNcMKnggnT4ZLktAj4OKmU9PhOrctbHszEa8164I6+iUbRzPLJ807d9I
 dLaQ==
X-Gm-Message-State: AGRZ1gLCS96CAL1824tgwL2JNdpqGFrQsM0oMOVjHwItLU81ihJrA+N7
 B+W80AzyN/YKrZbMN7UEXrJP1oJMpXXKFa090uw=
X-Google-Smtp-Source: AJdET5eyWnFoYekmZNuhV+C8/6YKa4IWujWRJa9PNMkFDK0yBrQam5HVyG26hzBy2Q+Lsymsl0SkJAzXQo3Z0jlQgZA=
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr3522325qkg.127.1542085691809; 
 Mon, 12 Nov 2018 21:08:11 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Nov 2018 15:38:00 +1030
Message-ID: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
Subject: Disabling ppc64le hosts for Qemu tests
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 13 Nov 2018 05:08:15 -0000

Hello Andrew,

I've been trying to get to the bottom of the slow-booting qemu issue
for a few weeks now. We commited a fix that resolve the issue on x86
hosts, but when running the same Qemu build on ppc64le it still has
the "go slow" behaviour.

 https://github.com/openbmc/qemu/issues/14

I propose we run the Romulus Qemu boot test on x86-only build slaves
while we work this out. That will allow us to unblock the kernel
security bumps, which have been pending for a few weeks.

I'll continue working on fixing Qemu in the future, but I don't have
time for the next two weeks due to some higher priority work.

Cheers,

Joel
