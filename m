Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CFD7C1A0190
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2016 19:55:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 6A004140784;
 Mon,  8 Feb 2016 19:54:59 +1100 (AEDT)
Subject: Re: [PATCH docs] Update dbus-interfaces.md for Event Log api
To: openbmc@lists.ozlabs.org
References: <1454565011-29416-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454565011-29416-2-git-send-email-openbmc-patches@stwcx.xyz>
Cc: Chris Austen <causten@users.noreply.github.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56B857E2.9030306@ozlabs.org>
Date: Mon, 8 Feb 2016 16:54:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454565011-29416-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Mon, 08 Feb 2016 08:55:00 -0000

Hi Chris,

> From: Chris Austen <causten@users.noreply.github.com>

You may want to set your git user settings there? I can fix it for this
change though...


> diff --git a/dbus-interfaces.md b/dbus-interfaces.md
> index 28fe410..db0f232 100644
> --- a/dbus-interfaces.md
> +++ b/dbus-interfaces.md
> @@ -151,4 +151,30 @@ properties:
>  
>    *  `state`
>  
> +# Event Logs
>  
> +## `/org/openbmc/records/events`
> +
> +methods:
> +
> +  *  `Clear()`

All of our other methods start with a lowercase, is this intentional?


> +
> +## `/org/openbmc/records/events/<logid>`
> +
> +methods:
> +
> +  *  `delete()`
> +
> +properties:
> +
> +  *  `message`
> +
> +  *  `association`
> +
> +  *  `reported_by`
> +
> +  *  `severity`
> +
> +  *  `debug_data`
> +
> +  *  `time`

Looks good.

Cheers,


Jeremy
