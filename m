Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::231; helo=mail-oi0-x231.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZZ3irsJ"; 
 dkim-atps=neutral
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xzPq3lDtzDr2n
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 19:22:35 +1000 (AEST)
Received: by mail-oi0-x231.google.com with SMTP id 14-v6so13924460oie.3
 for <openbmc@lists.ozlabs.org>; Fri, 01 Jun 2018 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3PFYjv1FiuZuZJ8fEvZOON7ahc5XpobMkD2rfdsay68=;
 b=WZZ3irsJq+AaQWA9qu1K8irnf0tlgLN/1n148BvpZJCn3aLYwvSarZIdKigxb2XK4g
 fK3QyTRc46IRYoQQx4tC/nnxdTI6aI7euI1crFyBXfjEe/k9iES1DYunzZxCB+XFVkF5
 1N8Pv5tV9EmDWF0dBZcsyQU3+4LoP7oot/DmI+zqF1gEEoEWr89marKmIOoAvUkVjIXt
 Ug1JrWorav31Gzj1CmeOPwP9lnyD/+VHVROzNMT0tIliTbo505Q0nccrjGauVQZkyPD0
 RxNizRH5I1KbKu8OxfUQALl0ffgZEAJAj28E3rm9QFGcLxDVBWtnJ0k9IKPsArnpVNKn
 2/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3PFYjv1FiuZuZJ8fEvZOON7ahc5XpobMkD2rfdsay68=;
 b=XF5EV5cayFXDCXvkP29SPk4Ve6LFxicE9/gdtckOAZKoNKfs3oX6GoOz9go7FXbMKz
 qPIszWIt+rcr7JLFMrHXHXth56PhtGgBosV94JAF8+3ljqdWA37KstruCSLv1meq14Ll
 SzG2KvuZXXIVScW/rBxb+ghBCCllfT9kRt9vzvXqEF3lIFhwAMjgQMq3IVZl/J7hw2bZ
 ZFNuHHGIkeAjxwbKzxkbz7yRcC13E/68A0TeFL3iHZECy/YoKDVPNrlp9l3mvm2ardn2
 S2BEHRgQ7L06B+d8WhNMOUwyH3aeU22XiDZl1E3xDJRaXQ6zr1vniYLV8DA5Su+nbxs2
 tQQQ==
X-Gm-Message-State: ALKqPwcTt7XfYfJf38YnaeWZkYu5E67U95S9exBjxFcSHGX4tDuPCMRh
 F5vtOxRhgypmPi3rrj2hRJKW1PGR08+2MmaiJANJMA==
X-Google-Smtp-Source: ADUXVKKrPEnXeGPpnmQsBcJZlY+B24x6OYgGcYlFH3jtTzl7DdS1xV68yzm3tSjJBAXt2tULBbeH/VcQrLJY0GQQn24=
X-Received: by 2002:aca:3ad6:: with SMTP id
 h205-v6mr5287644oia.185.1527844952912; 
 Fri, 01 Jun 2018 02:22:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b05:0:0:0:0:0 with HTTP;
 Fri, 1 Jun 2018 02:22:32 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 1 Jun 2018 14:52:32 +0530
Message-ID: <CAE33tLHGzttgZG7b0kg8bn5XNFN6q=xcheiQhpFUu5FM0ABGig@mail.gmail.com>
Subject: IPMI and Redfish support in openbmc Linux
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b0b6d5056d911fdf"
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
X-List-Received-Date: Fri, 01 Jun 2018 09:22:40 -0000

--000000000000b0b6d5056d911fdf
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I build the Linux image using the steps given in
https://github.com/openbmc/openbmc, target machine as *Zaius*. Whether
support is available for IPMI 2.0 and Redfish interface? Is it possible to
use ipmitool in the cross compiled Linux?

--000000000000b0b6d5056d911fdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I build the Linux i=
mage using the steps given in <a href=3D"https://github.com/openbmc/openbmc=
">https://github.com/openbmc/openbmc</a>, target machine as <em>Zaius</em>.=
 Whether support is available for IPMI 2.0 and Redfish interface? Is it pos=
sible to use ipmitool in the cross compiled Linux?<br></div></div>

--000000000000b0b6d5056d911fdf--
