Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G8wprP8Q"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g0tt1M7JzDqCk
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 22:38:29 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id d201so5176151iof.7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rZbpc/fsOKIqQ6ed17NJph7aSPPXT6DcOjCNOeTRSvM=;
 b=G8wprP8QLIUor5uSf2nNHRKig3J2PMSsKHpGSPibdghTMumxEjLPwsA9TbC+pF6Kgd
 qCjk+YZmTsUUnX7IV/x2jXvYvzicW2guHx4Udggnx3CLrIXnGRumHu7js9se/ENkKMnJ
 D4gBlRrvjoNp8avsqf3n4ceE9SuYv1gB4NHyzRhHL5wbkXdZ56zfIfWxRGgk7ROS0vNf
 cAumTeUzZ/FQQc0L0TWcFUuM/wvEr5vnOCS4jBhF+TAqSKnub+rblJDx+xOqWlNH6ciC
 kjAZc4FY4t73qpOl5hRBceVPOMTya2ZTAqU3Xf3sv3lVNZlCtuI8okXFh9bgHXongSAZ
 UUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rZbpc/fsOKIqQ6ed17NJph7aSPPXT6DcOjCNOeTRSvM=;
 b=LLuPccF7BAL2XVA9xxDxHCieUTWo5uQk0DJNIEme0o7cbsaEopA/BIwOUo82VBGBHZ
 THgpBGvDBGpmnZEKjF8X9vkFOSv/bsjadeYuXHBaiIWN76xnJ63M1n132cfz87f6IeQv
 LBi8F3bCJgKCoXvcvoDHHXxiqOXfQQUQWK7IgsByU+UYMgsjMZ+zAEwYRCchJpjT2PYQ
 jiMXGufw0MJudMTLFleVa0nu7jsgI0aLYakAPXHjd4Fqq1oXVsY2muoAROZwbwz0jYSS
 L5ZXet0KXvo7lrlp8lUHFny3MHb0/kjNpmMy2W6ZHrRcI3q6BDnAUIDbIj4pbJyg0rF9
 X/Qw==
X-Gm-Message-State: APjAAAUtbUSUE3dUFnokudHJKFUbuwsw6+kf/M7gntIvctCLrCSbXchR
 yQdvnfldqHg4z6oJtcl1EyqEGPSTL0TF+nhlvGLej42riIg=
X-Google-Smtp-Source: APXvYqxGi84c2qqJLzKe2ga1LF9mAPxY77Z4gWvf4EyzmfcHhoEKklIyK93X+xeZkl3/u+rwNV4kZd52tchPDYac3YY=
X-Received: by 2002:a6b:7015:: with SMTP id l21mr12824730ioc.12.1554986306231; 
 Thu, 11 Apr 2019 05:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <cd7788f6-1f41-0ab7-aebf-fed6f2a675d7@linux.ibm.com>
 <eb2c8def113944bfacad1d5aeafb94af@Eltsrv03.Eltan.local>
In-Reply-To: <eb2c8def113944bfacad1d5aeafb94af@Eltsrv03.Eltan.local>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 11 Apr 2019 20:38:08 +0800
Message-ID: <CAARXrtkjzG80mWxR=rjYX7WeMBz4JMVz-HB1aZcjbQzE4O3zng@mail.gmail.com>
Subject: Re: using phosphor-dbus-monitor
To: Wim Vervoorn <wvervoorn@eltan.com>
Cc: Matthew Barth <msbarth@linux.ibm.com>,
 Matt Spinler <mspinler@linux.ibm.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 Apr 2019 12:38:30 -0000

> I just found the reason why this wasn=E2=80=99t working. I overlooked a t=
ypo in the interface : Sensors instead of Sensor.

This is the sign of what needs to be improved. Either make it report error =
at
compile time, or at least have a tool to verify the yaml.
