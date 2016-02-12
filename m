Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF61B1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 15:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OU26eGP+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=VQqYBH+L; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id wg8so7666841obc.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 20:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=cuyTpyxQGOaiiI1hMDn6YvEeBwUgQJBO7ZB+ViJ4yTQ=;
 b=OU26eGP+6PMcMeXRdFdgzlS0rVMuW+rFrpowOtUi1Nb5yxID7n7m8Nm01L/8UnGxuJ
 AVO5xjDqXdBbi7LXHOeOFq9+GOtE5OQ5o1l5Z2Ix7Df8oW2jjVdxXNoEpX/0nwyjkw+T
 jtp/bx/w1Ss1fBaKmuB8IOQpjJcKgdz4avt8WbC1QPSe/qZ6P3bLoBC211A9Oykq2Mnb
 yONCUrMmwEHqhC7yyFh0Ezap0t1V6tV3RczKi697Il5S6DOZZXI4ZdCmPvIpuCrkaw1R
 1HaXgqVolJZnxQCCq2v3VCH9UFTKh8EZhdzfixAhSjCr1TRAmIeVDbEQTw5tSfeW9/om
 p8+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=cuyTpyxQGOaiiI1hMDn6YvEeBwUgQJBO7ZB+ViJ4yTQ=;
 b=VQqYBH+LQVMEaoVuJM0tYs9y6E1uE/KiGPicbnfV2Emt35WBvQjBWVyLpS8WHmKbOn
 g8arHt0Fqiist7cstTgKV0KFJP+NmHCUSS65VMToQ51P5C9ZTTNn4uZ8yDCNBtt3pURQ
 25eQ7+JP/uAPXBLRmJL5qrH8LggXRKP/dcmgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=cuyTpyxQGOaiiI1hMDn6YvEeBwUgQJBO7ZB+ViJ4yTQ=;
 b=inE++xERYv7nk1RW5GhfULK3Y4ycK8yk3RkY6pbgHYnB9DZZ5ZdYKbz/v42mtrp8bL
 Opy5gpIlHpfGnoXKsLF2H46yvedi7U4bD8h55Le4NarFffX2BOKNl1txqNmXEr/sVU7Z
 lY9nC+LNa/TKlcwS4J8LluKZ4obxmY3Fx2jDBOxe7OXSXxBz4ubDN+mwHBx4Rfa056jA
 QHvOrxVSBsrG1F55bxQwdghxkLq8nHxAUVtcXbhRkVMG3BsfhoPGX5HMPHtpmothl57T
 wBj/aQzlNGS06Orw7nATxKTVulWhGjqTAe3GyrUujv6AdkesJGxhPismD/obK8b+ObT2
 Vrkw==
X-Gm-Message-State: AG10YOSSnzeJOdnMPvzD3hC4NVnKTVUNnPpvZK/kWi6iXRgmo7ZCLfyFTcVz+tkAQ4wAgqRdE61ffiPmDt5H5g==
X-Received: by 10.60.117.233 with SMTP id kh9mr36963784oeb.23.1455252028010;
 Thu, 11 Feb 2016 20:40:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Thu, 11 Feb 2016 20:40:08 -0800 (PST)
In-Reply-To: <1455179366-13956-1-git-send-email-jk@ozlabs.org>
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
 <1455179366-13956-1-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Feb 2016 15:10:08 +1030
X-Google-Sender-Auth: DQ5Cwd87KU3WSVrqX27I--v1-lE
Message-ID: <CACPK8Xdiio5YtPm5__58ATtq1wiTFR4eecrA+Wdkyxzrn5Su6g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] serial/aspeed-vuart: Only disable host tx discard
 when serial port is in use
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 04:40:30 -0000

On Thu, Feb 11, 2016 at 6:59 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> OpenPOWER firmware doesn't like it when the host-side of the VUART's
> FIFO is not drained. This change only disables host TX discard mode when
> the port has been opened.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Thanks, applied.
