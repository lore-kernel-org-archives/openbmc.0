Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22f; helo=mail-lf0-x22f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lRha9QJa"; 
 dkim-atps=neutral
Received: from mail-lf0-x22f.google.com (mail-lf0-x22f.google.com
 [IPv6:2a00:1450:4010:c07::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymwXZ1hh9zDr4S
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 20:41:33 +1100 (AEDT)
Received: by mail-lf0-x22f.google.com with SMTP id a12so3121766lfe.4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 01:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=w1NObfUfk+Upx/rb2vl8im40aK5ZngwFRzK+/ApNlJs=;
 b=lRha9QJayhbecVwBVXfdQtABuZhS4fHVBLOpUQZXOPt0NHeoKQSUrtnLe8UYGRv2d/
 qB4oq27aFGEEIvoE6S7vFvNknXaq7gUIbgJrztDsedJs0TgJsrM5dBBasUKVKhlM9e6f
 wdUdRpMdu6ap1AhSuR5XgyHhRza2b25OIpLRcG2I0SDp8LnbUG07AewaI0NBc7+9OLbv
 McZNL8p1JnhnETdrP6M4aABym8B6MB8gwfkK0xxzC0nGZQuoflcIp8Sq6VNSAvA2Ak0s
 /rptF0FsAp/7uKsIGrfxH2DfbMvr6504q7LrkkKwQIbZFBnC++vt7CWPgg/w/Jg8PZke
 jTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=w1NObfUfk+Upx/rb2vl8im40aK5ZngwFRzK+/ApNlJs=;
 b=AVBp8/Bqire+ibJIZz+fRNzajpe0Xlx/CbUqbUCK1haPawdXR8jBLgZalfuGTLxnVC
 tw4p77s6lbvtURfpkJp6NXaNxMUf4piTLeoxKwDZuYbG9Pax0XbFYAYK3BT2ttt5Djkd
 tN4x2Eonragz+SufV9u+7Ey71we5V3E/lAtsVcBgjT2EV8xdRNVEsEs6myh6tBLBJSVB
 qjJ5O8D3CUrqayzE94AafTj31kEvr3HqLSzyByarR2VIgEGuJc5MkrOLSM+NNYslUNy8
 J4j+tOizYC3Dc4r1yHx3zw3AQay8xZifG2MmFj5bhAKxFn/Uy4d1p2bDVy590Ab1mveF
 DvtQ==
X-Gm-Message-State: AJaThX5mgSuMF8TvAFwiF3qqiXtD6SAMX0OQWCdJCq8L/UNiHIJQmPFN
 m/dxP7DmRXtWENrdO7yTdhASqr3Ibw3Ibq2rfOtxNQ==
X-Google-Smtp-Source: AGs4zMZ2tQKGXVuED7MgURQQ96YTdFOFvNo/IM9RYgWB9MP5dOghCYR9MgbKAZmN6DXy5/z6W01Dl9uvx7pMwKtWAls=
X-Received: by 10.46.64.6 with SMTP id n6mr1153252lja.129.1511948490205; Wed,
 29 Nov 2017 01:41:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 01:41:09 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Nov 2017 20:11:09 +1030
X-Google-Sender-Auth: bYMBk3whuwYT3Tfj059Lxd7gFVM
Message-ID: <CACPK8Xd+U-F+ws23rtrBVH-T_xNDS1q2=yY3DYjURH1yRQD3_Q@mail.gmail.com>
Subject: openpower.xyz outage
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
X-List-Received-Date: Wed, 29 Nov 2017 09:41:34 -0000

The hosting provider that donates the machine that we call
openpower.xyz has had an outage. We've taken steps to bring the box
back up, but it's not quite there yet.

I'll update this thread when we know more.

Cheers,

Joel
