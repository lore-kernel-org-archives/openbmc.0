Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EGaNNipF"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jZ8c0x7szDqMm
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 12:43:59 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id c21so11369325qkl.6
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jan 2019 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+KFDTsoK/r63fBni3RY22X3iT3hcX6rEGsepMscyNw=;
 b=EGaNNipFqA3rbsj1y6QuuPxgyGHGf2wXZ8ymKXXH5qW3++8wHHrgMjW7NqYZvMiQLz
 IRA5EvkwBd+UwxkWcNF4iyQ99rVB/uqhawZEDRGSM8TyezL37lVN5YkhB/j6yKH8koGL
 aX582lyqZkDba8mKjCHsQx0waiUVegcYdladc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+KFDTsoK/r63fBni3RY22X3iT3hcX6rEGsepMscyNw=;
 b=kP5oUYKJIrIMgwxoEB53RiEPjHBHaGAoulKozlIaEgT8eR6TsAQhYxX3B9wXjNq6CH
 cLs/Zm17kR40hVKOe/ctNY/IHZhZE4o+0eAfyNxGXLO2ZoUnrkK7WTiA0zAlAYrqUt9E
 ruoq2Y3n6ptqmh1VKTZ+Acl1APMqfcutrQVPfOnB2U/ANaJ7fx7tGBSUsc2sNlmI+j0s
 9fI5n1kN/UtbYB/R2nlRI+acGzhOsIDe1Lpm1pSe8mg/h6nKe5w3lC5iEWaFlv+dYY10
 LUmY31YgmK4pQ3wuM2yDzbBDRmqgOpGJTDNtXGIy6iSfHEX4Phyb1fmt5nnln/0O3S+C
 M4cw==
X-Gm-Message-State: AJcUukc0joGJUu45lTM+jj4jldu/NtCWrChfYW3WgDlQz7z7ONuIHRfn
 85iSmYMcKUXolrvB0ZwKlxojYLG+hVkeGlMErIY=
X-Google-Smtp-Source: ALg8bN7YxH2oBaUVpcZnskxkruSbJ+9QXgdTv/ur8D64I2CQQIr5+jfq5YEwbCYmh1bHorleNjZmSQPQtI4HFjmO9KA=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr23279654qkb.25.1548035037493; 
 Sun, 20 Jan 2019 17:43:57 -0800 (PST)
MIME-Version: 1.0
References: <1544509023-18923-1-git-send-email-medadyoung@gmail.com>
 <a1da3fff285fe13d04522f1a6e72bdc1@linux.vnet.ibm.com>
 <c2c5408cf1a715df1e7ac6447620b5de@linux.vnet.ibm.com>
In-Reply-To: <c2c5408cf1a715df1e7ac6447620b5de@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jan 2019 12:43:45 +1100
Message-ID: <CACPK8Xc-jB-vW60-+xGgf3igWTw=ZLBdjJG0niwbwU66_gA0KA@mail.gmail.com>
Subject: Re: [PATCH] nbd:clear NBD_BOUND flag when NBD connection is closed
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 medadyoung@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 21 Jan 2019 01:44:01 -0000

On Sat, 19 Jan 2019 at 02:38, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> Hi Joel,
>
> Why has this patch been archived and marked as "Not Applicable"? -

This is a patch for the upstream kernel, not openbmc.

OpenBMC patches follow this process and contain the target branch they
want the maintainer to apply them to:

https://github.com/openbmc/linux/wiki/DevelopmentProcess#patch-submitters-wishing-to-have-a-change-included-through-this-process

If you want this backported to the openbmc kernel I suggest you follow
this process.

(I notice that this patch has not been accepted upstream. I suggest
you follow up on the upstream list before asking it to be submitted).

Cheers,

Joel
