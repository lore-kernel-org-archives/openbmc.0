Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x236.google.com (mail-ob0-x236.google.com
 [IPv6:2607:f8b0:4003:c01::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 301C91A074E
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 15:14:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=sy5n33Jm; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=dqHQJt5F; 
 dkim-atps=neutral
Received: by obbwb3 with SMTP id wb3so55354425obb.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 21:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=5VLQyy6RBUUrgJ1e5tlSSGbkL9pcnNOu5EkKTJQdF+I=;
 b=sy5n33JmsIpNxhMO/8nyMw+dafPBzz7ebw2TCCl8VKueInRHEWhEepiM1kX5YfROZm
 pj8pvSywIpaIVUoHLXBO81D4lIM9WeI02BO4dhvSahnrRvZ4rY6ZDKV7mWmgP2/vcNQd
 sf49BAvqj4HVr25xNTCTuo5/n8wg0Akfk91Fkt4oy2fX8X0o/cpW/FAw9LSj5eSfdvB8
 iKvS+6u6WFrRgD+iIZQd5AdKyUly/rKbcbpFSxQ7jtObQ4X7MM6vwg1VEqf/zCnkOv3U
 G+v39p8mPw2voaMk0onkxLvNII0bEc4OjrhzYnh8PKNmF+0CesebK2om9azsDZHOQTrK
 8l0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=5VLQyy6RBUUrgJ1e5tlSSGbkL9pcnNOu5EkKTJQdF+I=;
 b=dqHQJt5FlqNRkgdUrP3zZLypG7QB5AHnpeMdSWslKQkNuB9PpiFFQHiTTqBvDp7PVY
 qdYBZBZZb6sLLMS6av/MwFjN6vTMYxV/IWZgTvHOUbqcxlJRaR2jpegjq4s21lnUWq60
 FaYUBw+VEK+38BZP43/8xX8jEruFBtpgZHo5E=
X-Received: by 10.182.24.193 with SMTP id w1mr8272833obf.52.1444968860476;
 Thu, 15 Oct 2015 21:14:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Thu, 15 Oct 2015 21:14:01 -0700 (PDT)
In-Reply-To: <1444946041-22756-4-git-send-email-patches@stwcx.xyz>
References: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
 <1444946041-22756-4-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Oct 2015 14:44:01 +1030
X-Google-Sender-Auth: ClceyKidmMpZJ2t42pqTE_R56NQ
Message-ID: <CACPK8Xceo8bHyispt6EhY0egmOf6b544YjX89psFbFBdBa3WqQ@mail.gmail.com>
Subject: Re: [PATCH openbmc 3/4] phosphor-host-ipmid: refresh SRCREV
To: OpenBMC Patches <patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 04:14:23 -0000

On Fri, Oct 16, 2015 at 8:24 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Also required updating dependencies and installed files.
> ---
>  .../common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> index 9741e61..5e7ad64 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb

>  do_install() {
> -        install -m 0755 -d ${D}${sbindir} ${D}${libdir} ${D}${libdir}/host-ipmid/
> +        install -m 0755 -d ${D}${sbindir}
>          install -m 0755 ${S}/ipmid ${D}${sbindir}/
> -        install -m 0755 ${S}/libapphandler.so ${D}${libdir}/host-ipmid/
> +
> +        install -m 0755 -d ${D}${libdir}/host-ipmid
> +        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
> +
> +        install -m 0755 -d ${D}${includedir}/host-ipmid
> +        install -m 0644 ${S}/ipmid-api.h ${D}${includedir}/host-ipmid/
>  }

Should we be putting install rules such as these in the makefile
instead? That way the programs are useful outside of the poky
buildsystem.
