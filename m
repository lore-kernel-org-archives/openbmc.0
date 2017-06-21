Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wst4l1XP0zDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:07:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fhHJx7Oz"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id t7so43187979yba.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=0G6vnm3RdvD+2Iyhj/1W0B8137B5Hpi4Ku1C/XaMwOU=;
 b=fhHJx7Ozt01cxvm+xaDjHSudozt2Rz3dj5GPKS033uq9xMTxqkW2bzABt7MMRdU4w5
 JQK/OVbxvfOTbbsbXUg24RkBSizwgCsPwcVgs/0fQJzGa3VgfcKatn4QxmEyJtJp/0li
 B7E7plPu0Jb+MKxQf872aFiRhUFvMQ3T4V+0Dv6wbWPSYyG6RoO5ZqkybSX8qL8T9D2h
 kdIX4YNv3iqhFcIE3mI3TWOrEMHx+XHbSzu5KhB14ptqnKJHLkCtq+IqnTu50QOZ2YK8
 +MyxkeVn5g5+jN3jtONuBWQPB/jL7UTBeQtRdML5RUr3G0dPME2+gabX8ArrunnTW36k
 Fk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=0G6vnm3RdvD+2Iyhj/1W0B8137B5Hpi4Ku1C/XaMwOU=;
 b=qWtEpYh5l3ePodxYj8WWdo2Vkk0+6zqs41oXs/htXhqii73l1/iFSbUcm99UZANS+t
 oK68GjnYMmqZtWtswBNI+YuID2RyEiBaTpDkjMCwmdIWzT0zhu9SZzgotEQ2giLpIb/a
 gy2jJNe9pieAYVXHVlGckn7vPWjtk+SjwcplXtrPdiuNbb3MVmmJt941P0GfO7dG/8e5
 cWAO3JmdCc4m/oU29x23cackaefmpeZqdeUTmxmwm4hnXQhJ4j+CxWtrH2Hva1PgD2jN
 9WyvGUj2yvT39+aohWgR5p/37Kt5mlv4F39j+xwlYKsloVuy9WAT5yx/5JY6NMj7m+cz
 gfhg==
X-Gm-Message-State: AKS2vOx8oOwz5j8YtsDgNFbFSSRMK8XvlNMo0t6JdIuJrMGl52BVMcKP
 e9Xxnp74K2L01mrZyAR88ja+hwyj4uPr4Vk=
X-Received: by 10.37.207.202 with SMTP id f193mr16501841ybg.93.1498021652667; 
 Tue, 20 Jun 2017 22:07:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 20 Jun 2017 22:07:12 -0700 (PDT)
In-Reply-To: <20170619035549.18773-2-joel@jms.id.au>
References: <20170619035549.18773-1-joel@jms.id.au>
 <20170619035549.18773-2-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jun 2017 14:37:12 +0930
X-Google-Sender-Auth: XR_A9nhG96UZmnYH9MrNL6Chy20
Message-ID: <CACPK8XfUHz7phGzOApv0vj4h=cZmNotRQqpiPbVVbggo1MdReQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 2/2] ARM: configs: aspeed_g5: Add DPS310
 driver
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 21 Jun 2017 05:07:35 -0000

On Mon, Jun 19, 2017 at 1:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> Enables the DPS310 driver for Witherspoon OpenBMC platforms.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to dev-4.10.
