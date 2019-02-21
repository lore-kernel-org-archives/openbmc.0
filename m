Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K2k1aw8Y"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4452FH0p6NzDqTh
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 04:55:30 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id y4so14087253pgc.12
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fwiv1Efjw51gCfvMK5YnqxXonS1NuXE4LTOSh6zo0nw=;
 b=K2k1aw8YqRusdkXKNSTHM3UTb0Y/wO3L2Rpz1AIQJ0aeCjKXdEQU+OzTxhS0/NtdMk
 rCQbi5ZErrZ/f4N11aQdsMQhzAh84M+723xW+p48Az3IftRTPEcUg8fA9iz7MFWncy/3
 CDfkxX33bK1tG+H/Np/F2lOtjsKI9jTgL/bgyWHp0/T2ArT/6eqW0hKwyZIOYPr+wCYB
 jba5qxbhiwrIlii4N2xhkpuT70MvI68OemyNJ/QHHURxCweWbbOEF27BHVJilMdW6U48
 rc6K1qNqceAIELcIw1kZ801ji6oB3i6loE4ax2J41D3k6/GmsQPBx3u+S+Cn1Dv34pQp
 uduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fwiv1Efjw51gCfvMK5YnqxXonS1NuXE4LTOSh6zo0nw=;
 b=UutYbL86t+exGx4VpoYY5tiq8kR00e4wx4wVrr9/+Y/q2HBKZ0eecFgL4zArq527a+
 VpYrT/r1tygywQkSWKhwHgI0eX3UkJHXGM44rRTOAzZp6x/2YOHTSBr+bh3KM5DXoJyr
 llLVevhsb2WwBnKp424l27lTRCzZTZ+D25ZfE9hztCRxz8o1wu43vPTlpxjqjRVjNBBw
 L/B8YH60Alfg0KA2L1mhAj2QB+TSz5mKlTbaD6XZ2LpyLsQDOSCZYJG149jXc+UP2Rmu
 Hg0s1WDibRq/t7V5MKtVVrTqOab5ntoWZPtpv9slWweqfbuk29YMG5UhYGacf+SoVbdk
 O0KA==
X-Gm-Message-State: AHQUAuZiYHTZ8fVK/ZsIXl+zrhO6AUErI4dM00xqR0Eo/xSaMCwFwtP8
 kF8+qQ9eTZrgcrM57x+ZWQpmvEjNoB+ggXFjhAMyGl/f
X-Google-Smtp-Source: AHgI3IYjVDcjB+Ykg7fxtIRB4TE5U8ImPWCAMxWeZIvKnr+nbN1KxdrUeQ6B6R/BkKCpdj0iTmEodtnVQU+L7rBfQOA=
X-Received: by 2002:a62:449b:: with SMTP id m27mr42056447pfi.79.1550771728609; 
 Thu, 21 Feb 2019 09:55:28 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Thu, 21 Feb 2019 11:55:17 -0600
Message-ID: <CANT4Nr+t_s2FAov9X=0HNOqW1MfwDS6uG4ZmdvxnLUr+QO3uNg@mail.gmail.com>
Subject: Problem with license text file
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Thu, 21 Feb 2019 17:55:31 -0000

While talking with our layer today about the OpenBMC Apache license,
we were not able to open the open-bmc license file in GitHub. Will
someone please look at that file to see if there is a problem that
needs to be fixed?

Feel free to DM me if you don't find the same issue.

-- Susan Jasinski
