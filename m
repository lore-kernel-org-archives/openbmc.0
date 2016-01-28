Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B7351A0054
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 15:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=CIlgehGV; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id CE8BD604078;
 Wed, 27 Jan 2016 20:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=/5HD1PJupZctGbVrGqx7jtWQAd0=; b=CIlgehGVC17gryEv+50C1NV0hsl
 g5P8vysZQWKV6JPmBBjXBmn91pMwSvUwUCu82sHzpNnT3/XSiwFwFv27xLwx7XNr
 yOqgHpbLDBqvEUJJ4Tu8biyt8uPrb1PhFmaqNb8scfS4Wx60X6syMjeo17XFhKCM
 u4R5wHHfEMMYDgkI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 11EEC604076;
 Wed, 27 Jan 2016 20:57:55 -0800 (PST)
Message-ID: <1453957073.2269.9.camel@aj.id.au>
Subject: Re: [PATCH docs v2] README: Add overview page with index
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 28 Jan 2016 15:27:53 +1030
In-Reply-To: <1453950010-20498-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453950010-20498-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453950010-20498-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 04:58:01 -0000

On Wed, 2016-01-27 at 21:00 -0600, OpenBMC Patches wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

LGTM

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> 
> --
> v2: Fix typo, add links to other docs.
> ---
>  README.md       | 20 +++++++++++++++++++-
>  contributing.md |  2 +-
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 9b69328..c0bae54 100644
> --- a/README.md
> +++ b/README.md
> @@ -1 +1,19 @@
> -# docs
> +# OpenBMC documentation
> +
> +This repository contains documentation for OpenBMC as a whole. There may
> +be component-specific documentation in the repository for each component.
> +
> + - [cheatsheet.md](cheatsheet.md): Quick reference for some common
> +   development tasks
> +
> + - [contributing.md](contributing.md): Guidelines for contributing to
> +   OpenBMC
> +
> + - [dbus-interfaces.md](dbus-interfaces.md): Reference for APIs exposed
> +   to dbus
> +
> + - [kernel-development.md](kernel-development.md): Reference for common
> +   kernel development tasks
> +
> + - [rest-api.md](rest-api.md): Introduction to using the OpenBMC REST
> +   API
> diff --git a/contributing.md b/contributing.md
> index a975983..08ae384 100644
> --- a/contributing.md
> +++ b/contributing.md
> @@ -11,7 +11,7 @@ Authors:
>  Structure
>  ---------
>  
> -OpenBMC has quite a module structure, consisting of small daemons with a
> +OpenBMC has quite a modular structure, consisting of small daemons with a
>  limited set of responsibilities. These communicate over dbus with other
>  components, to implement the complete BMC system.
>  
