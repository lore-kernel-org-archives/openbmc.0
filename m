Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMg9x1Tf3zDvj4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QTwDe47T"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id u15so1444248oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Du7eK9v88O1qUo7pVewol6RnDU79mQdk1k2JhUixNxc=;
 b=QTwDe47TarBICc4gWTOkY1WA9PPZB2OQGWUaKhhvdXbArkdSAr2V0CKedFKD9yHB5k
 JDurXhgV6IksYQ5lhpem6m0iwED0qMBR5MvGwTmQbfOfnmdtH4qGt9ps7KPfumQ0UZ5W
 +McpaTddDeNXSNx7o7Pqxiv6/aB8v+U5JX1lkE4f5gaVq3rjQOIeb8ngOacV6/uLKtOE
 BVCpTPDtI2/FW95PYQipV7D+Razl6XFr1SDDBK6ia6VJYcTz5a5z1VoHz71JzuGBD3fP
 rZqVbboX6hfYeb0m7/qgfLv3XrFwGmCfV979inha1q+59mE/3331zueiZkPL0Q7yI5Dg
 94+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Du7eK9v88O1qUo7pVewol6RnDU79mQdk1k2JhUixNxc=;
 b=C8kRxBJYg/5+TVl1aRntyuwa3G7snniqVwG3moHywIvlnJlEeRKNgjqjTY8rlav3ye
 zpe9qVD+NTzqNp00NfLLvJZ8UsngwQ5EgEruHvDZxdku6jyncsM2dqZJmCW3AMqD+vZk
 cj7h2yMC7r2gsFxF2Wvx+tWKzmxPjAGjpE3+WXjqzlotAXVJTutNEHS+WgGsFyim6/f2
 iCkYp0+giJlRi6MtW3bVtBsmYWQx5/Ryie6sXVa9ovi3BD3fKTDXtWcelNuTY0hCFI5r
 wt/6SIgUYpaE343KvJmcojSZMwkjs6E//u/BCwZE6uji/D6FRhLuEVgl6lE/E6QHirkn
 Bohw==
X-Gm-Message-State: AKaTC02u0dcnC+Y42M5itQJs+wOfAb/NgS5LHoxhXqbr7Pthg/Omu0szJV0UqIYzk+vEaQSdvY/8orcSQiWUyQ==
X-Received: by 10.157.35.195 with SMTP id t61mr7229387otb.263.1479713139407;
 Sun, 20 Nov 2016 23:25:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:18 -0800 (PST)
In-Reply-To: <1479478938-13267-11-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-11-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:18 +1030
X-Google-Sender-Auth: JLMOTvGGXOIfsanr0pHujfDBpjY
Message-ID: <CACPK8XdJGQXi4tSWzvWVUOpxNdCVFEwhXxA7EEaBE2QmKG2zsQ@mail.gmail.com>
Subject: Re: [PATCH qemu 10/38] aspeed/smc: improve segment register support
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:41 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The HW does not enforce all the rules in the specs and allows a few
> "curious" setups like zero size segments and overlaps. So change the
> model to be in sync but keep the warnings which are always interesting
> for debug.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
