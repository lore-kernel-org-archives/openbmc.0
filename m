Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::230; helo=mail-lf0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l2M8HHcC"; 
 dkim-atps=neutral
Received: from mail-lf0-x230.google.com (mail-lf0-x230.google.com
 [IPv6:2a00:1450:4010:c07::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynNdb4DXtzDrpm
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 14:47:31 +1100 (AEDT)
Received: by mail-lf0-x230.google.com with SMTP id x204so6299307lfa.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 19:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=LA2nC6m36pKO6x2Cm437DqaFghHe9Tli9XnhIAQDIrY=;
 b=l2M8HHcCNDGUS7Widi3dqZvtdSCwhnaSO5vXt/EcvSxTXSwnIIogGRfTu3/C41ylfE
 tKsD/Qeovm6pcx4TgiP5IM2VCZEO35IS3c0Ezpi/bWZlrncKyt1yC+clceC2Db9X3OO/
 LmkXX1mUmZfsXgrVh3Lh/UVrOwovhfO/vGphytOQQB7pCJyhasU18CfIkZtHUnUYuQ4P
 Cq4HC1wGb/tGKmUaWbWTI3AZ7p4dvu8XXUqjgDtc/MlnTJHExUr6iiU0f6RTkHYvyZcR
 JKMkeuJMWcy6USqDL0X72gJLkJ42yz2Npyzv/dIPLFALw1oCNUyGezp6Wx1zVNKsUvbR
 lY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=LA2nC6m36pKO6x2Cm437DqaFghHe9Tli9XnhIAQDIrY=;
 b=UHkaWHi0BmxgHO3rc/yVvd5F92zFgGqdqEM3oxvYM93CundrVL1LxPj8qADA5tVGKo
 jqZBA25tHBs68oaH3lDRNoff2rTnZ+YIvtN7GGgBuxOU4omI3MGy+A4mdO+6AMVPNNsv
 vgHPRH8QRJ01FGDa6Z8mFgGk05wYa+7414DdwM7wzfESLsmhKUt8Y2yHmov7zXIG0RQo
 tB21iFsJenauxCufP3ywlQ/JKmGgg5HHs5D+tRSgY2zvs1lWfkVtF8fyLRc+dm+Kldzu
 nR4fRPLEK6IVMFWH9WGRGVEH8Z79PThg9TGx42caO0IPikwVxiBuuZKuWoMUyd8H5QjW
 sDWg==
X-Gm-Message-State: AJaThX5S1vnwO7nznzCxfym+mBFgLmf006KknYt0VpylMtCE9NiUicgr
 MWHXRL8ep7Mx770HdiKnE9AGhl0KUwxnmq6wK/z/Mw==
X-Google-Smtp-Source: AGs4zMY5n7n8l/r2L8UY5lRaPkajVuwXmEvjjN1x6xbOTHf0f3ttap2z45pFvc/iE/BaSjU9rmYqFQt91RtRXeZkREQ=
X-Received: by 10.25.168.140 with SMTP id r134mr1947788lfe.65.1512013646012;
 Wed, 29 Nov 2017 19:47:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 19:47:05 -0800 (PST)
In-Reply-To: <CACPK8Xd+U-F+ws23rtrBVH-T_xNDS1q2=yY3DYjURH1yRQD3_Q@mail.gmail.com>
References: <CACPK8Xd+U-F+ws23rtrBVH-T_xNDS1q2=yY3DYjURH1yRQD3_Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Nov 2017 14:17:05 +1030
X-Google-Sender-Auth: Ap1P8XaNqHBRiLtZ3MebnnFbWG4
Message-ID: <CACPK8XdYC00-AG=odzWs4qnWYBvBnA5Qn+LbqtnoTB=+3r8Q8w@mail.gmail.com>
Subject: Re: openpower.xyz outage
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 03:47:32 -0000

On Wed, Nov 29, 2017 at 8:11 PM, Joel Stanley <joel@jms.id.au> wrote:
> The hosting provider that donates the machine that we call
> openpower.xyz has had an outage. We've taken steps to bring the box
> back up, but it's not quite there yet.
>
> I'll update this thread when we know more.

The machine is back up, an running as before.

The IP address changed so if you're not seeing it, give DNS some time
to propagate.
