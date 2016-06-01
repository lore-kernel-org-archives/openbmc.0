Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKXvY66YWzDqZ6
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2016 00:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gV+E24IU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=H1N0K5hd; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id i187so13844325qkd.3
 for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2016 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=hFFpiNRKfP42AOppOBKmkkUGxJCilMI8YA9B68lZgzk=;
 b=gV+E24IUs28r7Y9ioQT3whmFKtZTDyQ8DUyxvMqanHm+6befD/MXc0fRvuR85Sa1B9
 mmPkKVI+Uty9AVdZkIsHgitOe9477+fXpYfUAgQbCkKb0+Chwk/FcY6xucAVJmzV7gL/
 m1xOrDQIZYDZWsMzR38IPsXuREs8QiTt7sXReFgXYfTBxdDmlgUi0VPFtePUoV2a2jIp
 FrsfrYCcEL0iapOlimXCExfJJ+H8c0IPwtGr4BsKp+ht+mAkZzqU+QL1F2GkSrq2UUdS
 Z2zjizJ2jrpbXzcKvkJ+bNoElGZ2HO2GxDHaq4ESE7urVcbbC7vFhAsG44N/20H6J23Z
 z8rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=hFFpiNRKfP42AOppOBKmkkUGxJCilMI8YA9B68lZgzk=;
 b=H1N0K5hdk42iF9yJlVZL8KBMtNxpeV2dMUa8w8IjOQ8sSI+Uhb9j+SYuyPNWR6z7Z+
 ruEcfeyON4GxcK9KDLPFNcuV4r4CBGGg3m/FZyxbi2GEKqib+C292+ci55zspGiAoTco
 F6pRTSWzMRS+AMhYLI8OafGuBfliMHGcXSH2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=hFFpiNRKfP42AOppOBKmkkUGxJCilMI8YA9B68lZgzk=;
 b=h/TANGRD7+e9noVdwKeyoG2bnRYKsmy9MYJGzFHRZJMt30pyB+4d8KO7BZ+m87Jc3b
 6Eyq8EweKSuTRBm6IriTSRSGGpJRpNuc+XkRYnA3u6LAawBwVoX7ERHMghQBjTWjKdZJ
 90N1pswab4SVmYawNEpbPoRSaS5FHnNF1lQLuyZU8Yh5gnWPZ5U3k83MySERXnr3WzQ7
 h0DthMSN5l1ADGq5qaJHTvvI1jrX3RZk57EHt8zbS2ErPr/YfYdNT9iLsnsm2Q2R58pw
 SuI8y7am8AvGR4WUeXIXW2BMadophmPZjz2M30qjUryvnQJE/zWN19CDgt9reJ/brZki
 nnFg==
X-Gm-Message-State: ALyK8tKWYcvtQ9HYoAayrPh+nt26xsOTAl/DR3zs3zPoxM8B1gU7UU7Ucp063GuGPZmYfy9kKgyNHPWqUi00nw==
X-Received: by 10.55.147.196 with SMTP id v187mr37495588qkd.7.1464791717064;
 Wed, 01 Jun 2016 07:35:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Wed, 1 Jun 2016 07:34:57 -0700 (PDT)
In-Reply-To: <AM3PR05MB093469618BEB77BB50C8C2AED5470@AM3PR05MB0934.eurprd05.prod.outlook.com>
References: <AM3PR05MB093469618BEB77BB50C8C2AED5470@AM3PR05MB0934.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jun 2016 09:34:57 -0500
X-Google-Sender-Auth: eyvi4jduV4QHL70IxsOQ4zfim0g
Message-ID: <CACPK8Xd44CZJ47wj_2hhQ2DCS+N+ddnx87wVrdVfWFg+gWmvhQ@mail.gmail.com>
Subject: Re: NC-SI support
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 01 Jun 2016 14:35:23 -0000

Hello Shay,

On Wed, Jun 1, 2016 at 7:58 AM, Shay Slobodkin <shays@mellanox.com> wrote:
> We found NC-SI support for ASPEED SoC in u-boot code.
>
> We don=E2=80=99t see NC-SI support in kernel.

We do have support in our kernel tree:

 https://github.com/openbmc/linux/tree/dev-4.4/net/ncsi

We intend to submit this upstream.

Cheers,

Joel
