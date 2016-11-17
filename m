Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK7hP341BzDvrN
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 15:39:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="wOHG5bpV"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id n68so12361567itn.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 20:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KNvCN3kNEWPzuRAVCWIKKjfl1UpQAgJm9GlesCiC/zA=;
 b=wOHG5bpVCPNmy6avGx1Yvoh6BM0B3/ARZaBbzFPJdclYobTexhypMJ0tE+QlrLDF87
 /tkt8L/4ao3J8nbcNd14zbNXc2dVyG/xJFEimDIkhf42OG9qdQMDMsFbUtY6T0NMPH6h
 HPXMZwHc8QLQZVz5DCGSJNTOJF7Hwe8P1MU0ggXLYRcybOmIIKrNxzcmvobg11fUV+K6
 67KNSHFLDRu8f1okiqHuBmNvVJ/zAV1e3Zk27CuCXjFj0RaWhVVEpcQ9cJ0t3+1t/ZDg
 lSBf874cnPf8DBlZINNUlCQq5744x952szGsPoJQc+F9QxvXw/rbnS+i7R/YHril2Fi+
 c8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KNvCN3kNEWPzuRAVCWIKKjfl1UpQAgJm9GlesCiC/zA=;
 b=DPeh0G+Yo7DbNLtw0tdMj+Je9E8rJEcxdRBaZgM3bs3N1xTIe206dEGxER0IxrJf5z
 8w5ulYWTUJidzd8OI3WGIBFT5vhQYtGq4OFAZF0EH5a36HcthAzEmfYSPbUrnf6dXNmi
 idRGCVyGZPY/DxrrGtROkxSsijXLUPxZ6j5pDlf5cbUR+U94nik/GIlgJ0PR81vm0TxL
 AfFz5j78QsNlxa9nWWYSmyBJ7YpdQmfBRLofMcItTJrtPt802MKvOrx+Ri03zr/hep9D
 luEWjUWXW/7P6ZclZoZXePszASj8KGjXEnpwnn/HBRiiL1/6XsJws2Fk8VfOQvrLnydS
 5YKA==
X-Gm-Message-State: AKaTC02pQssy9X48d3p/wmTYoqLMA0HOsOkm47EDYG+4+vsAPJobakPincRO+TghOiIdOzu74PTKcCXa84ArmA==
X-Received: by 10.157.24.41 with SMTP id b38mr441456ote.117.1479357587604;
 Wed, 16 Nov 2016 20:39:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 20:39:27 -0800 (PST)
In-Reply-To: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 15:09:27 +1030
X-Google-Sender-Auth: 5ll3FRCdFY886m_vJM9W71rjt5A
Message-ID: <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
Subject: Re: Query on image deployment on ASPEED board
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 Balaji Marimuthu <balaji.marimuthu@microsemi.com>
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
X-List-Received-Date: Thu, 17 Nov 2016 04:39:50 -0000

Hello Arjun,

On Thu, Nov 17, 2016 at 2:56 PM, Arjun Padmanabhan
<arjun.padmanabhan@microsemi.com> wrote:
> We purchased ASPEED demo board(2400).
>
> We need to set up the openbmc environment on the board.
>
> Is there any document/steps where I can refer to for building and deploying
> the openbmc image on ASPEED board and boot it up with the image?

Is this an AST2400 EDK? I we have not used one of these before. You
should be able to netboot a Palmetto image though, and from there
contribute patches to enable your board.

To build an image, take a look at the cheetsheet:

https://github.com/openbmc/docs/blob/master/cheatsheet.md#building-for-palmetto

I recommend building on modern Ubuntu or Fedora machine.

Once you have an image built in openbmc/build/tmp/deploy/images, you
can netboot it with tftp. If you need help with that then we can help
you out. I recommend joining #openbmc on irc.freenode.net.

Cheers,

Joel
