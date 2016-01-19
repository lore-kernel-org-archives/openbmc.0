Return-Path: <andrew@aj.id.au>
Received: from hapkido.dreamhost.com (hapkido.dreamhost.com [66.33.216.122])
 by lists.ozlabs.org (Postfix) with ESMTP id 810D21A0023
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 11:24:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=do3lq0d5; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by hapkido.dreamhost.com (Postfix) with ESMTP id 562468C7BA
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 16:24:46 -0800 (PST)
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 8F3935EC079;
 Mon, 18 Jan 2016 16:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=JT/QPKRlxKw/mYrz2WvVO7NThoQ=; b=do3lq0d5TOvrRbWG6bK65HhngIq
 PuqQziSSNVPdaqOavNS0kFjc8WTv97aAiDuRHOznnNwVH8oJi9xmWMIqOnNxjOXz
 Gn81BcscnkldLbZjxjn2ocV3NFJwxD+7KiIoEpZ9YU5swsnYRf43/BS/3k2rYsO2
 KsOZZ+h1bf6d5BWQ=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id C575F5EC072;
 Mon, 18 Jan 2016 16:24:42 -0800 (PST)
Message-ID: <1453163031.2773.2.camel@aj.id.au>
Subject: Re: [PATCH docs] README: Add overview page with index
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 19 Jan 2016 10:53:51 +1030
In-Reply-To: <1453104608-22459-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453104608-22459-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453104608-22459-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 19 Jan 2016 00:24:49 -0000

On Mon, 2016-01-18 at 02:10 -0600, OpenBMC Patches wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  README.md | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index 9b69328..689cd3d 100644
> --- a/README.md
> +++ b/README.md
> @@ -1 +1,14 @@
> -# docs
> +# OpenBMC documentation
> +
> +This repository contains documentation for OpenBMC as a whole. There
> may
> +be component-specific documentation in the repository for each
> component.
> +
> + - cheatsheet.md: Quick reference for some common development tasks

It'd be nice to make all of these relative links[1], so:

    [cheatsheet.md](cheetsheet.md): Quick ...

And so on for the remaining bullets

> +
> + - contributing.md: Guidelines for contributing to OpenBMC
> +
> + - dbus-interfaces.md: Reference for APIs exposed to dbus
> +
> + - kernel-development.md: Reference for common kernel development
> tasks
> +
> + - rest-api.md: Introduction to using the OpenBMC REST API

Andrew

[1] https://github.com/blog/1395-relative-links-in-markup-files
