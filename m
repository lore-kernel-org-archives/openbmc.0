Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0wdf4K6LzDq5y
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 23:25:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nMosAoYz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Q2Fy1oH9; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id w198so13691229oiw.2
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2016 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aC8DFx8h4kHaoYnv6ld+QaFWWnJdSR4a0jSylCfaLf4=;
 b=nMosAoYzNHjeubcOAkEYNxZz6Utkm07UOp3+g2xgaPvALqlUP1Hm4Fsgr++b71UEdN
 ZQ4YgH4VDEg5MMWgJbfJEMQXqI8y3AMIfxqYKfH7jzfQs1TkyiK2Qe4MaaFI6G/a/4E4
 NTBBRnm1QTz9a0JWag6H+3Y0f6yRvasItZ2ilEUgTgLvs/gp8cOLzdmCdHVs64RGqeXL
 JCO7G9eP9BIEevRusl85nIGQp9wmNc+2YzwjSAnM/SXmdcebZpqUSwgopITlGXpPXFH+
 4H3MI2e4wgpROyjvMR/SWDkVUhT6txvlS+JOPbxTgFlGoQfwT8sHT2ISOes5YtORPtM5
 O3GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aC8DFx8h4kHaoYnv6ld+QaFWWnJdSR4a0jSylCfaLf4=;
 b=Q2Fy1oH9oi2wvWe/j8Z5m5n+OdbkihQw34yImcquvuAFu+AVr7KGJtqnwNEWOVqBx7
 UH+2ePP6oXAxi6iNxSVcOoEAB3bra+iLaB91SKHAkjwj6isi5u0VMsoSr+FVGeWQpesB
 OaQpWQJsm4XQDTSxPCFF0Im0AqEJ9x6E7B4QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aC8DFx8h4kHaoYnv6ld+QaFWWnJdSR4a0jSylCfaLf4=;
 b=QRNzCvB56lnwJPMsm0ZNxL2FfLt9RQKvNgfLo5v6eSTRReWctkH206NT83772Uu/u2
 bAgmqXXlGwa5EiZjgzFDfM7SwlHHxAJQLO9x5KQv2xh6g7yqGuCwamkore9/+d0ws0wb
 5WZvXpk0/mWqFuUudOCFTZo94e8ZAdjCZGUmJMlcbBdx40bZNXWb+IdD/5qRs2rI/6sz
 wXud/oBTrDNsK+NvJk3ZE0VVNZHeIKr35O/2QxQTefWFuC27lxLsduHv7Xq/9apo0QNg
 iyCd4ZFRufn+pktfiVqmep/n2XLGu8DF1fhSMkZChW22F+8mD0oBG3rqBWDFUpkUHbVG
 RLkQ==
X-Gm-Message-State: AOPr4FX1piyjES20r7grvunWMkwWQ8+iVmzDmfLdgblFsUiQHDBdnbsFWlLyQwIZ+prm+uX781IGu6haUxbjnQ==
X-Received: by 10.157.41.202 with SMTP id g10mr7212709otd.122.1462454740732;
 Thu, 05 May 2016 06:25:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 5 May 2016 06:25:21 -0700 (PDT)
In-Reply-To: <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2016 22:55:21 +0930
X-Google-Sender-Auth: 8Ib6vUlvKuKsfsSgCbhY2sg4gR0
Message-ID: <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, chris austen <austenc@us.ibm.com>
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
X-List-Received-Date: Thu, 05 May 2016 13:25:43 -0000

On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> From: Gavin Shan <gwshan@linux.vnet.ibm.com>
>
> I don't know the specific PHY model deployed on Firestone BMC, but
> currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
> supports 1000base-T but the PHY on Firestone BMC shouldn't support
> that mode as uboot uses 100base-T mode.
>
> When exposing 1000base-T capability, the MAC is forced to have the
> same mode though the PHY is working in 100base-T mode in fact. It
> causes the mode mismatch between PHY/MAC and the ethernet network
> doesn't work.
>
> It's a temporary fix. After the PHY model is confirmed, we need
> to enable the correct PHY driver instead current one for BCM54210E.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>
> [Cyril]
> The plot thickens, it does appear that this IS the correct PHY on
> firestones. This patch is definitely required for networking to be
> functional though.

We should get someone in Austin to boot a firestone without this patch
and see what it does. You shouldn't need a pdu as long as you get it
right the first time :)

Joel
