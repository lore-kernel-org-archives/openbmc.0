Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pAyViGIp"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="miXdUb0I"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409MD15R8MzF286;
 Tue, 27 Mar 2018 17:53:21 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id c23so3860894qtj.5;
 Mon, 26 Mar 2018 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kuKDvRb0x66d1XqI4ph1q18LaaemibhC619dZygM6MY=;
 b=pAyViGIpOcLGqK7zpOTw71cO4DhsR7L+fME49xrA9SsVij2/YZnAklbk79X3xP49oS
 POqomvkdgf94kZmcfR/BynUdT8l96NvSQYxNni7mZlI3mZ258q/sddOQZMhZIwUHIedX
 mTNrjQGHTM468PKQB6sLDP0r7LxKZOXq++R01DnDPkCR8kIwpGHdTTYmeokas+pQRkvZ
 A4HELlw6qstYPS2mOIwIsvfcZalBJeAtrAYxkhYgH+xZWz6KN0T2yLKl7IlX6jpVrZy/
 flKv8D209Gipa4m+4d70fT2bikaCB9djVlwN5SjZGlhajRLrdgHhpBSD7A2Lnc3waXKo
 OzXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kuKDvRb0x66d1XqI4ph1q18LaaemibhC619dZygM6MY=;
 b=miXdUb0IVS47FrJIIrk4XkfZD/FtyjTh0YsRKBFrv9p2SlzO0euGwVU9AYE1xh+RYo
 Yqmsr6R6WhQFIOJp1dhHyLKW+A2EJ2kid+p+RO0wcIC6oddjCvOYKz8FYzXnHplc4GWM
 yCdXQlBtl8SLK2rbcRUHqqJ7eAXrBIr0VekB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kuKDvRb0x66d1XqI4ph1q18LaaemibhC619dZygM6MY=;
 b=reXiDhPXROIhp7ikbjKz3p5wIBxGoFDepJidjb/KCLMxaXr2KRrVY3AIPg+gnkIF7l
 lBI/D+FbIQuwLzC9nWCTZncluZW90Yt7m5Ku95V59xirCQqCg4puHFECbmzbpdSv1yCG
 tch2dJWf0e31scCfuOAPsoSKbHE5GUkczCiqOhjwLIidH8B6vT+3NiAZi/b/ZNGE4ORz
 Ach+YzA2Jjzzm4uTb+3Lnmz66RIhY7NKdR7WH0DHY2+TVueSbYOuaymEeRy+KbCOwDZS
 Yma/5KDDLWCqYJ+oUaCdn9nUw7NPpHvFDWtzMbzoPtsf7twfIBz1dkh2VkJpbXYbvX5y
 c02g==
X-Gm-Message-State: AElRT7FwRZ10+An57icC4ivBOUK67HV/UW7VpW+ERqOQriSAomrFUkXk
 2A5IjsohDAjj0hfRGp49G77EkSe/oQZB9soskvQ=
X-Google-Smtp-Source: AG47ELsaN2WgR8W/+a6kLedq/zsNaZt7DqsaAbk1YeDe3Jc2y5UnQD3FacUIqeAKpjvmR6T24BiJKzYgl5xh0yKmOtE=
X-Received: by 10.237.36.74 with SMTP id s10mr61230558qtc.23.1522133599230;
 Mon, 26 Mar 2018 23:53:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Mon, 26 Mar 2018 23:52:58 -0700 (PDT)
In-Reply-To: <20180327034827.20773-1-jk@ozlabs.org>
References: <20180323155116.GA31423@kroah.com>
 <20180327034827.20773-1-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Mar 2018 17:22:58 +1030
X-Google-Sender-Auth: cCNbiq69Ljg5kpu-NiUyq2mhS4k
Message-ID: <CACPK8Xfn_nh_d_7avCADsD6gpEky_RZAt_kROJAPF=hVthX_JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] serial: implement flow control for ASPEED VUART
 driver
To: Jeremy Kerr <jk@ozlabs.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 27 Mar 2018 06:53:22 -0000

On 27 March 2018 at 14:18, Jeremy Kerr <jk@ozlabs.org> wrote:
> --
> v2:
>  - rebase onto tty-next, dropping applied proc patch
>  - 1/4 simplify status mask checks
>  - 4/4 Use updated timer API, fix text wrap
>
>
> Jeremy Kerr (4):
>   serial: Introduce UPSTAT_SYNC_FIFO for synchronised FIFOs
>   serial/8250: export serial8250_read_char
>   serial/aspeed-vuart: Implement rx throttling
>   serial/aspeed-vuart: Implement quick throttle mechanism

I gave v2 a spin on top of 4.16:

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel


>
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 124 ++++++++++++++++++++++++++++
>  drivers/tty/serial/8250/8250_port.c         |   3 +-
>  drivers/tty/serial/serial_core.c            |   4 +-
>  include/linux/serial_8250.h                 |   1 +
>  include/linux/serial_core.h                 |   1 +
>  5 files changed, 130 insertions(+), 3 deletions(-)
>
> --
> 2.14.1
>
