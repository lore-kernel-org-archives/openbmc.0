Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bzULQJIz"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410sM62dT3zF1yF
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 12:00:17 +1000 (AEST)
Received: by mail-qt0-x236.google.com with SMTP id x34-v6so4786838qtk.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 19:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Q3wYDWch1fhtm0grBtA7jF17HluMMX1RnIHCqeX/ZYs=;
 b=bzULQJIzXccql8wxjPcCwvCUC5LgCabJemlaHmQQxJckCDDuq+L/nP+FqIHVI2bOJ5
 74v2n1NmBFY9iBIqP9paF3WQxdR2WFkp5S83QP+/FHs7RI1RrZ+gFF8/0T3JOtJZE2dM
 0W4xn8NdX24irqrhj8BIdFZ1e1Fr9eUSbS2NF+WutrzmQkKWzObkXh4YI/ZOHqkKrEnN
 /KGznEBzngKyL3vY2cK6fO4CdJmX1DWF+uLiVDyU5QHLby/IihMEQZ+ZUHAWa2qcfwaJ
 g01biDR7DdxQAAkNjNpI/3Sf+mpJNI6LDJqfNXAGzEMhq73haAWXu0rY0YBsnowoTkSm
 8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Q3wYDWch1fhtm0grBtA7jF17HluMMX1RnIHCqeX/ZYs=;
 b=YrgZDidhNpXtspcWQnHQjxSh68S45UdzUiLLXJOEPORnhLO3Vu4IkWGJRY6lDWagcV
 NCsotWvcFJW43HPNqDP3gAcJ7nVZEQltvzdd3uBwC9yHCXq0R0XJgn0OgXPrHftNf83G
 OUGu+/B1JPgRHAXEgehiLRgm0VDDTbEYntjeBujVUrJ21rs0WkJLMJ4FGayUScJzjz+N
 2/GP+YhO0EbIn0INzLFgB4Ov6Gp86Y/4aAjk9qV9vTVtNMBF4Q8S6BzuLiJgIVFG+ZpA
 SS2cou/7t/ay+Q3moucLwEPslphgg/dM8VZIGgJjbv1d+w7FPO5ViX6aZKASSA2Cuels
 PBwA==
X-Gm-Message-State: APt69E0qC7LoDDxfEPx5G6imSMHBKVcHSObTaoN3CuaHIpPMXIeFD+6M
 BbBK9bnBepTvSfVlDMvQfXwRg3NmNB8dsx7UafLGUA==
X-Google-Smtp-Source: ADUXVKI4oWM9OqnP0r+cpNcbT566H4k/i1ZkBroI7etPrSH2iEFxlnwiqbs1fWMWS5xILsEa+Sq8otqKnibTNQZ6+Hw=
X-Received: by 2002:a0c:87c1:: with SMTP id 1-v6mr981639qvk.141.1528250414887; 
 Tue, 05 Jun 2018 19:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2965:0:0:0:0:0 with HTTP;
 Tue, 5 Jun 2018 19:00:14 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 6 Jun 2018 10:00:14 +0800
Message-ID: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
Subject: How to configure Clock Stop Control Register
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001b7917056def871d"
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
X-List-Received-Date: Wed, 06 Jun 2018 02:00:19 -0000

--0000000000001b7917056def871d
Content-Type: text/plain; charset="UTF-8"

Hi,

I found 'SCU0C[8] Stop LCLK' was set after boot into Kernel.

Could anyone share how/where I should configure the Clock Stop Control
Register?

Thanks your help.

-Henbin

--0000000000001b7917056def871d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I found &#39;SCU0C[8] Stop LC=
LK&#39; was set after boot into Kernel.</div><div><br></div><div>Could anyo=
ne share how/where I should configure the Clock Stop Control Register?</div=
><div><br></div><div>Thanks your help.</div><div><br></div><div>-Henbin</di=
v></div>

--0000000000001b7917056def871d--
