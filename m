Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t13df5VjfzDvbG
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 11:41:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ImdSGvno; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 139so1279895itm.2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4cpoos6G+oCPr1tIbmTx8h+DfBLoYqz+VK+hvOcXiEA=;
 b=ImdSGvno1QXO75e32PqRo8+hYzxBlX9Z9h5XCi6z0Qgza4Oo4y8lBBcmR2imqm7aYd
 w8HtKRewKLNcNgCFsUQ2wn+CysP6YdMhVI5UIpwIv5VJV1DW0SPucFMNSkAXwuBju/5i
 EI8iyxVCXiEgJO75R0uU6B0AgGtGmbooEO59KKYIcVVFPMOCwe7KNFinNB8GM81vLpfo
 q9XYwudg4NlJSqyAMn/1Qez8NbOWCEP6BOSlCW7lN+Lsj37fdekNbmIZm3nLI5h/DXJO
 DKgqxVC9Sz5g8gyKlzMPeCIck1HDpoZruh6IFUnJ4Gx8+V5goURA+Q2UY+vPgtN3hr42
 NsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4cpoos6G+oCPr1tIbmTx8h+DfBLoYqz+VK+hvOcXiEA=;
 b=SMfk3ujQ1ny6UwajpNpMRZEEbEF5kxZJdtedy4ksuOxG0GZ5iV9GFFn7zxr1j77RWq
 L9CEZ6Iw6goUEVt/E5HsjMvIzNJvCg5hioqcOc0IpA8WkMjRfHZby0PwQe9RG8hJPwjQ
 fHxDcLFUNQpdwXT90mHPnJJHBmDk6NhadsMqUalKmgqBMt/GtXBkzOWukPaxix0zeGmV
 ci+Lu3lSIZ2YqDYX0iTzo48S4xjnNY9PYjWKKBz1QoFl9Xyuz5pYIjQu1XsZiCCb84Jt
 3TbzZ7DiORPVdO5dbR4glB4riG2FIhwcAzcbOfq+ogNoOK20oeN0PPmRAql8ivInwiIs
 4yKg==
X-Gm-Message-State: AA6/9RkvNWMVqMv1REASGMdmglyWko4MgD9X0QG7puVWhZbjxiT5s1Y0ndMzfiFW1fdPwybVa3/GF5KLAf0f8g==
X-Received: by 10.202.94.7 with SMTP id s7mr12392826oib.134.1477096901088;
 Fri, 21 Oct 2016 17:41:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Fri, 21 Oct 2016 17:41:20 -0700 (PDT)
In-Reply-To: <1477070413-92621-2-git-send-email-xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
 <1477070413-92621-2-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 22 Oct 2016 11:11:20 +1030
X-Google-Sender-Auth: Nzdg3H-9IwacON8qvhI-NaIsIIU
Message-ID: <CACPK8XekEYGA95+u=+XUVgLBNwU1z6gSSqbNNOwyqgTBOtZScA@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: phy: broadcom: Update Auxiliary Control Register
 macros
To: Xo Wang <xow@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net,
 jaedon.shin@gmail.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Oct 2016 00:41:43 -0000

On Sat, Oct 22, 2016 at 3:50 AM, Xo Wang <xow@google.com> wrote:
> Add the RXD-to-RXC skew (delay) time bit in the Miscellaneous Control
> shadow register and a mask for the shadow selector field.
>
> Remove a re-definition of MII_BCM54XX_AUXCTL_SHDWSEL_AUXCTL.
>
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  include/linux/brcmphy.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
