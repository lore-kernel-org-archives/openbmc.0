Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgB43LLyzDvjP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SfnEJBa7"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id u15so1444624oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=uA25tzqxuZX2CL3txRip4a0v7TZVDmrRYP5yVr1+D7I=;
 b=SfnEJBa7YmhG++R5Xr65aExHT9PYmkWIUekL8E7gCdB1LWMK0h0KYwu3umU2YPt0OG
 ESKE8xPqcv0pEPH+KkdcF3GWhgn0JwcJVf0WpNmmYGvBjhNNfQ2O9igQDJvo7hWxkIM0
 yahy1lajk46mzXSa5VhkpIVQuGZmhdywA5dKS1XyNIogTXhVjp9P+2rq3n9TgJCgOJl6
 KfstGWtRpoK65X9dYz1HaRUG9aBNgBpW6yaqDgEbThcs2KhbjC8zzX85L4SyMEfYiofK
 p8tzwJOkLso6dAoCLQVzF7zVtoxY51WCNjIbcyNXFqab+fs8ej0JwhalVOz50JugKizh
 fJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=uA25tzqxuZX2CL3txRip4a0v7TZVDmrRYP5yVr1+D7I=;
 b=DEkVUu9vvBI43wY6FJODqu4vLbEix68jI0op9u5I3NxoN+lWpNv7bH0EInYLOZ75Kk
 h2YkAlQ/hd1GQyncSNIXdQp/meOmZgic2zsoE0oXJzI/L2azW7aDw2U4mQi4ibo5aVOQ
 ON3sX4VVFjvkS0cijXyB50leR07O+V9pwof5PzYr/i1eihy5Tk3X+LfU4Be9N/Oy/ORZ
 24VotdVJvx3sUv5JuO092JM3NoETmtw8BylZ4ZY+ESHiI/XduAo5+ywmltQaz0pTrrNN
 qxEbtd1V6Iq4UCay4OGeIoAvixK3rgT7ZmQkBi7rniITOiID/ttpsYb+qtObNSiDd+Ul
 3flA==
X-Gm-Message-State: AKaTC03QBUjiBvqRzTaU4yqa4XHufGD06RdgbODkkuqWIchxcj4enc4+xG1h38ZOBu6aQJX2w7E5A1KVs7RMdg==
X-Received: by 10.157.27.65 with SMTP id l59mr7447358otl.196.1479713146764;
 Sun, 20 Nov 2016 23:25:46 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:26 -0800 (PST)
In-Reply-To: <1479478938-13267-13-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-13-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:26 +1030
X-Google-Sender-Auth: Kvz0zVU2W3rNQi70WItKuy5hQfA
Message-ID: <CACPK8XdroeLvN6uFNi9ozPyPpYVOBphTXLa_QsEVuZ6V633MyQ@mail.gmail.com>
Subject: Re: [PATCH qemu 12/38] aspeed/smc: rework the prototype of the
 AspeedSMCFlash helper routines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:48 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Change the routines prototype to use a 'AspeedSMCFlash *' instead of
> 'AspeedSMCState *'. The result will help in making future changes
> clearer.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Once you've added in the one you put in patch 13:

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c         | 37 ++++++++++++++++++++++---------------
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  2 files changed, 23 insertions(+), 16 deletions(-)
