Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NKG2O6oW"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Crlb1CkCzDqWk
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 16:11:39 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id l14so7740918ioj.5
 for <openbmc@lists.ozlabs.org>; Sun, 09 Dec 2018 21:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRk1eqFKLo3QXbQHrq6KQ2Mj1GgHXZlbyRMPzDjs7gs=;
 b=NKG2O6oW8YIHV62fF6PIpSBT0gfml5Sm6ZXSougjNlzfzdwdhnjmohIK4mnVD7uu8c
 IJMBFZpgsc01zQPJb/JCkT/ff5pzc1w/cBC2NzwC3o2nwcZIjCqDAUcoHyleuvZNwsMX
 49dTnviQYKpRH3ztIJINL6l8/3anpjeJh/SvERjxvzp5eJe5ao9kVfeZTU8dg/WbpEW8
 Sn3w0nrPtKryyvgQgABVo/HerRdClWrpMJ9JrxFSI8nzPfgk8XXH8qDpAoqDGCfEQdNB
 BRPbVdLaJGdaCBCCj5TjweAVfN6P0k4eY0EJweNDh1S2EnwU4mtnJWJsXAr3V7+ocskP
 GCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRk1eqFKLo3QXbQHrq6KQ2Mj1GgHXZlbyRMPzDjs7gs=;
 b=Dn51jt+hfP6n2xWUlGtUD2ltg6vh5PMm/CHGWdpa7bCxBGxE7WEK4Hma7zwScbtBdw
 2XaaEIdm8O+ORdzJ1Y4UqDFijroB4Hv5j8Tyebhbmk2jxdYsL1FuCTspDN9DH7PtGIk5
 AySFBr/M4X+l6q2a+o5tm8CQ8QA+TdQyOydv/FlVCkYyxJs3pZeykROz3yy7An7ROSAI
 gC61phn6yW4Bi2QWPEpJwXfrDnEKZuSvhU6WzqX2xHHA88U4QfwX1UShf5S3YYVsvTff
 nqVcd1GMHI4Bs/wuoGPiYYfEoPJ3my3vpw2cSFEgQAb8VUxol6sDNDq3GAYAg/SFhI7N
 VqLg==
X-Gm-Message-State: AA+aEWYhh/g1rpOLPvCleqKxE4D/HUmxdRvS/uEeRgM/dpTXwj6lrAsl
 CB0JZFPYNaysTid00zPi+5z1q6kOFtkRS300Yj0=
X-Google-Smtp-Source: AFSGD/XxpBkPpQwigFWn48LX9njO3fesIfFVzeeuXrQ4kjfeRKvDSnQsbK6qEh5zj5uYIy3Rv/19M80lh7SvGRjCVWs=
X-Received: by 2002:a6b:4106:: with SMTP id n6mr8609754ioa.171.1544418694196; 
 Sun, 09 Dec 2018 21:11:34 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR02MB43933CFF8148D4AEA9328D3E92AB0@DB7PR02MB4393.eurprd02.prod.outlook.com>
In-Reply-To: <DB7PR02MB43933CFF8148D4AEA9328D3E92AB0@DB7PR02MB4393.eurprd02.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 10 Dec 2018 13:11:11 +0800
Message-ID: <CAARXrtmsQja0x+oobViG6Pnj08fpNBNaW2+tapXt3z+e235A_Q@mail.gmail.com>
Subject: Re: Help: Host powered ON and after seconds Host Power OFF script is
 started.
To: maheswari.a@atos.net
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
X-List-Received-Date: Mon, 10 Dec 2018 05:11:40 -0000

> What are all the process is responsible to send Host state signal as quiesce to phosphor-host-state-manager. ?.
> If phosphor-watchdog or system_manager is responsible.Please let us know clear view of understanding.
> In our platform, We are not using BOOTCOUNT sensor concept as initial phase.
>

You are hitting the issue because of watchdog timeout.

Behind that there are several pieces:
1. phosphor-watchdog@poweron.service is started when host is powered on;
2. During host boots, hostboot sends ipmi watchdog reset commands to BMC;
3. If the watchdog times out, the service will start
obmc-host-timeout@0.target, and the "Wanted" services will be started,
including obmc-host-quiesce target.
