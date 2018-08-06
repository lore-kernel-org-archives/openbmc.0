Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::235; helo=mail-oi0-x235.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6wHnfdq"; 
 dkim-atps=neutral
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kbkp6rQ6zF3HK
 for <openbmc@lists.ozlabs.org>; Mon,  6 Aug 2018 21:58:10 +1000 (AEST)
Received: by mail-oi0-x235.google.com with SMTP id b15-v6so21619461oib.10
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 04:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mmtbnHAflUZedpCq5200Ynw52CXqM9q94ZMXLXEvOVs=;
 b=e6wHnfdqzLR7bqOXKxob9fzWEGQkhlHU1qSebSgSijBiUe+tqKstv02rOy28FwhVDk
 sfdJ102CKX0skrP80Rnw7I9D5gdUK1aoEOj6qrnOuVW/M+Gr9vnZVvnYtZ+EXEnnMj4J
 OOZftmTe+JP7hyijVgr1a5l49FG/ttvPqj9qkTkF88CcLXsBSRT/0eTaVVa8VZLSivny
 lWsJIvuhwM6Nn4CLNzwSJBsHzQK4mjiNutQP9RG6N2ifzQFw1Zmx42MO1VrwJ8LjnRvu
 jK2yS4iwTRK6UNrlzl+MMR0h6GMzU1szFcGXRMa8bFjKxEjSRMJej1VvB4jFhZX1N7Id
 8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mmtbnHAflUZedpCq5200Ynw52CXqM9q94ZMXLXEvOVs=;
 b=luk5RcIo37tYSTSS/9E+E8jcQP7l1a4mJt8o3NaWqp08VR3FsgrBttquPXleodb8Rv
 +NxxRAKC/Qg5T1dAuQGQvG8Z42sD8yD6p2VrnW0WQSnGDz/pCLInOHhKls+ejopJ+b0Q
 nZZgqu5VCnbeCa1Mtspns0djWvzwT9hYj26OzNSovdXUUN23ZZiY9t9Fkxv+eHWm9823
 2OaNUDWicL5pm19BXyv+xO2IO1FBQESRGO0P27vbjaSFxJMKBoEY+ZlHkpYr/cLXSDK6
 OGgoK/5ndsA7orT7vBt9PwcIZgwK8ASrUwO/eJ7Sh+yxsrWzrHNx39shJEYdQElEKBKA
 ZMZQ==
X-Gm-Message-State: AOUpUlFFNzk9UMk+5VcpN8KJUXlcYhm2vOUwnF+4IkrNyEz48obpfDX6
 HuB5MjjnjH/4eCK3lanDy68Pew+LSjHTdlcN6CctaLZ5
X-Google-Smtp-Source: AAOMgpcHyn0PHB3lzGKYLtlZaid5/6a0MSSAMNG2+GLdm+4ecZyv2LELTGAGz4YLMYPZ8EhcKbwlL89chE1ohOtqraY=
X-Received: by 2002:aca:4d0a:: with SMTP id
 a10-v6mr14976001oib.175.1533556688430; 
 Mon, 06 Aug 2018 04:58:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 04:58:08 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 6 Aug 2018 17:28:08 +0530
Message-ID: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
Subject: Temperature Sensor and its Reading not Showing Up.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a829220572c2fd70"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 11:58:12 -0000

--000000000000a829220572c2fd70
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I tried to list sensors and its reading using the command "ipmitool -I dbus
sdr elist full". But temperature sensor and its reading is not displayed.
Please someone help to resolve this problem.



Thanks and Regards,

Akash

--000000000000a829220572c2fd70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I tried to list sen=
sors and its reading using the command &quot;ipmitool -I dbus sdr elist ful=
l&quot;. But temperature sensor and its reading is not displayed. Please so=
meone help to resolve this problem.</div><div><br></div><div><br></div><div=
><br></div><div>Thanks and Regards,</div><div><br></div><div>Akash<br></div=
></div>

--000000000000a829220572c2fd70--
