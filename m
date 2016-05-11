Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4PcX4HYfzDqRn
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 15:21:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XGhkfVA8; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=NEv6cxJK; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i2so5117941oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nTOw26+D/+e/ihkbeP3XcwMrfT+h43JC8WLq4OX3gcg=;
 b=XGhkfVA8mHPQB5+VscU0iS4o0rzbfm8+P2TT78CqFiG2iSNyoWV6IW98vLyn6QiIIb
 t2eN/068EqY82Xal3CgUoB+rSx4vp27ZIyfCl37Hb2bxcN1tS697RsfMYXysI6ZvNa+8
 G1mGttBFAz+sXmFy6AzOI3AyQ4zXhCcEvP0NqtYhU31YXMLTVv6DYJ8OtLwLieeoKdYz
 s2gTT4X14gsvM6nkXxdCnaPSM4QY93KRhTRcbgigRceh5Ksk66wcTJsimdU5XyaolT6a
 JtbjZqxTSLqNH3lFLwAG2nS/CXul74LxlZiEZQghUXNMBTjgs4Tn/YAAibfPXfXMUTAc
 ibCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nTOw26+D/+e/ihkbeP3XcwMrfT+h43JC8WLq4OX3gcg=;
 b=NEv6cxJK5rUwv0VJrBncrFW7TE7/7Xw66lObpNAoeIBF0g9ppy04MhX6T0rJdoKMcn
 Ylu9ZsoThdPgIGioFGoTiL/yO+rU9UQOLClR4cgX9rZyP52HvzAgBI3vISa8y30dm2zY
 oCxJHw9BCYdzc1GgzdCD1o+9pnFMZNo32QNJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nTOw26+D/+e/ihkbeP3XcwMrfT+h43JC8WLq4OX3gcg=;
 b=NIYxBJIdXiFpOoNuaixp1mxoQWTdMlyeF/nagQVNZ5Oxf2Qyp4ZVW6URMEjW5BTfR6
 it5wO8E9lS6CX1DojcdEelFgHTmi9gFb8kteESBphYwg5ZfvEfRfXWOOF3CruLFViFZY
 0ZU3YGVL4CXzV26AoxsnbpDN6QzM2DcBmy4cJI/3rjVkcuHMD15ob6vnU7Ii6coDi8xb
 zHaABV0Ysotr8uYbIOKsqiIjqf01jr1e869OqC69nxTlPBXiTzQGbVpTOAt+phrFKrNi
 HljgBuzuL6+dVwNiR/GBxFgenunmz3wkC6+3iBrRcQEeVDfHT9UvuWwrjV2ekUBGpzfb
 EaLA==
X-Gm-Message-State: AOPr4FXpQnYhw04odT8Ht7VD8oAUwiCun35xtSy/WyJfTaHoUrB6I5rU/yCVhc9Xjm0TkejMbLTOe3L3ASMxcw==
X-Received: by 10.157.8.43 with SMTP id 40mr815870oty.151.1462944106281; Tue,
 10 May 2016 22:21:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Tue, 10 May 2016 22:21:26 -0700 (PDT)
In-Reply-To: <1462943431-29445-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462943431-29445-1-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2016 14:51:26 +0930
X-Google-Sender-Auth: SY2Ofe8REY4iQphBiGfYRqWno0M
Message-ID: <CACPK8Xd+k1spKehvyotFjgyDobmnSDe+wfYa353urGXFkuGTYQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] [openbmc]: Build adm1275 pmbus driver into
 Barreleye kernel
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2016 05:21:50 -0000

On Wed, May 11, 2016 at 2:40 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> Barreleye has adm1278 devices. Build the driver into kernel.

Please do not apply this. We will enable it in the defconfig.

Cheers,

Joel
