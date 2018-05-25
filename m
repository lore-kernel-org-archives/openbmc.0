Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22b; helo=mail-it0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tgbwOjXC"; 
 dkim-atps=neutral
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sTWG2CjMzF1Rc
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 11:41:45 +1000 (AEST)
Received: by mail-it0-x22b.google.com with SMTP id p3-v6so4888258itc.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 18:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F6x4CTvp/doSWMfpztB79yRfPf277u4PEuag9BM12Mk=;
 b=tgbwOjXCn+08G75+l6krUvxay8BRsL+Gy5DAicdOk8EHuOJXTQtQVuEk7Edqqo6nLP
 6S0f4btr3OQAwSo+lSXnNjsJ2kFzaEFd7cIxVLD4Qw0KwVPCqsKnUTrTSOZUf/KcNT7e
 sdh64jhG9oTErEu+q/TzKvy3/N3pM6dF3GsZc+0HLTMcBBVEIksIoo6b77IVpsDJSziq
 CdE4FINOG30VIrlcqWC7EIBSONh2I+LLNxWS61QYmvzWZGWFGlq0wGgwCx/Jt+LOc1tX
 U+67Q8heNWZwxYSd4AByqRIFHpdUbIBKMr+oeXJIL1hwmCUDAh8npxm1BPZVtxLy3diA
 M8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F6x4CTvp/doSWMfpztB79yRfPf277u4PEuag9BM12Mk=;
 b=hImrRkMedhWW5xdfK//ATZKR2uviKrb7EzP3f7t79zgAv7GHA0qWKTGBz2DjOc5xn6
 Jd9Z0C8mp+bjqo5b3pdRlBlJRQtbF3i+yoV6ovFtx+c2RySDSe3AN1NXzCi70ZAuhjmf
 3Mo4GSgEarKHy/TfL8yOAV6Ec4CVeqYuvwv5whFBr/wKbRRJRRcfQbHKZ0iHfc5NV9JV
 Q93cBUaGv6aqflJ24U8VbDFdXimWatMUIhtS80C05SZHefgNhalw4iGn4N/1t/xpsQ1T
 J1VVJOB/MBOhNvn0lTrf3BGGmxb5CoqCOZZ+tVDp/YBLHizoHIf+WyPjmoaJO3N00/XL
 9aHA==
X-Gm-Message-State: ALKqPwf7fOEJbn30SDRzc+8Ct0mcbcIRFzG0xSKWy2n2eHml3gSAuIRr
 bYEJ8HoY4wI43eoquHl0ewolCHQW9NGeAMqzAso=
X-Google-Smtp-Source: ADUXVKJ9J5LcQ7e2M5w6Osd9xx+76L5FWBq0Dtv1vGdETOp3WwaOAuBXk7hDEkyGj4ylF6BQfe+9hmF36aRpuQJLo2Q=
X-Received: by 2002:a24:7292:: with SMTP id
 x140-v6mr278824itc.14.1527212503396; 
 Thu, 24 May 2018 18:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Thu, 24 May 2018 18:41:42
 -0700 (PDT)
In-Reply-To: <90852837c20b4169a7d4d66efaca7399@ausx13mpc109.AMER.DELL.COM>
References: <90852837c20b4169a7d4d66efaca7399@ausx13mpc109.AMER.DELL.COM>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 25 May 2018 09:41:42 +0800
Message-ID: <CAARXrtmp_MdKe44q-dgMyO-P=FQRWH5JQ7zMVWVZSj=_HGykmQ@mail.gmail.com>
Subject: Re: openbmc build err "internal compiler error'
To: Lakesh.Sharma@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 25 May 2018 01:41:47 -0000

On Fri, May 25, 2018 at 12:55 AM,  <Lakesh.Sharma@dell.com> wrote:
> I am seeing following build err.
>
> =E2=80=9Carm-openbmc-linux-gnueabi-g++: internal compiler error: Killed (=
program
> cc1plus)=E2=80=9D
>

I guess g++ is killed due to using too much memory, maybe you can check you=
r
system log to see if there is any oom.
It is known issue that building phosphor-host-ipmid (more precisely, the
generated sensor-gen.cpp) consumes too much memory.

Possibly increase the RAM for your VM, e.g. my 16GiB VM is fine.
