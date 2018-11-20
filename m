Return-Path: <shivahshankar.snr@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=shivahshankar.snr@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="osHKNiKz"; 
 dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42zj1N70jJzF3S4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 21:41:28 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id u6-v6so1209677ljd.1
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 02:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lfglwUzvESOhx21v066vyJb3Mf6yMIJptB6qRDF+cBI=;
 b=osHKNiKzK9KNvYQzEWAV3MlWKrj3V1I/VvEBHdHNljobYYK5N619wUxynnnU9l2D7y
 rzHPGzQNp3T3vQ7tu810CZi2+h40D/B64yxore7bCgqvUJpDJj0ttOS9BOMKkMhFkHAf
 MRIuE2dbisK6KKNCQNswEn4L0aKLYQyd1zs1CXuoxi7S7qanZxPPbcu1eXPDf1X/TRrR
 YPPn5tqMlw/JAqEppB3D9knDn0RZzYm8nbC9aE9HAE/Ypjivuoep9kEW6vq12LhW13Zx
 5q2V8Hwycl0F9dxSHAyCHtZuq5YKOnu9KSHfVs5SNo4jTSkelpKXIfUlbRcdI/e4z3EM
 8qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lfglwUzvESOhx21v066vyJb3Mf6yMIJptB6qRDF+cBI=;
 b=qJawU4bRRSxTEYV8fDR+6JpTjJDDgRgvBAixdQ0L1WYHjaL3yA+HW4gLWtAw27wDHY
 1JNXtpXEuYXv6BF2/0JR7Mz24eMQg81lLpLcsqdKo1FX8ef3DkWhcYtodJ8TUuterAYN
 sqxufQmNwZ1DVzx8unkz/PmzExBoAzLGQV5bICV6BNN+5TiQq9j6dF6JyYg9yuhSmUgN
 RPHxAsB3XomdLQRHglY7OPOSqodwU7MjLLYdd/thGonF9jh1acU02eBHvu7v6pRu1hUR
 zx6ew/FY9H49nMz0RqRui3cH+PxnE+JZ1FgaQd7Ijv0ALWy0CWFC3xAIzxurmpr0Z65x
 +M4A==
X-Gm-Message-State: AA+aEWYNq7EGqJL6giiGnrAK4JFrUq+AWzjNn4eQ9L7CskCfddMHHFll
 xA8y2Jb1VS0SY9pUcztgwMN0eQ8gZf26RREQ6ROJKw==
X-Google-Smtp-Source: AFSGD/WpUi8z6VoS/Eezmb547Fznv4AVWfMRo2LoUZ/5zHLaGoLG10i8kNUFBq7TaFgdztbYmUwfTd5paaX6wWS/ftU=
X-Received: by 2002:a2e:8945:: with SMTP id b5-v6mr897711ljk.55.1542710484966; 
 Tue, 20 Nov 2018 02:41:24 -0800 (PST)
MIME-Version: 1.0
From: Shiva Shankar <shivahshankar.snr@gmail.com>
Date: Tue, 20 Nov 2018 16:11:15 +0530
Message-ID: <CAKLXnT4TDTLN-1B8rOdCfeRy916N21VHhKffQVrJWJS5nRWZAA@mail.gmail.com>
Subject: Linux kernel version under openbmc/linux
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000072a248057b1646b8"
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
X-List-Received-Date: Tue, 20 Nov 2018 10:41:30 -0000

--00000000000072a248057b1646b8
Content-Type: text/plain; charset="UTF-8"

HI
I notice that the latest dev version on openbmc/linux is dev-4.18, wanted
to know if there is a plan to move the 4.19 anytime soon.

regards,
shivas

--00000000000072a248057b1646b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI=C2=A0<div>I notice that the latest dev version on openb=
mc/linux is dev-4.18, wanted to know if there is a plan to move the 4.19 an=
ytime soon.</div><div><br></div><div>regards,<br></div><div>shivas</div></d=
iv>

--00000000000072a248057b1646b8--
