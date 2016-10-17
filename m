Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5hW3NNJzDt2r
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=I2Zkx/5c; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id b186so7321303vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=JA4DzmQxqUyyRRHvZBDUDiF++lxMRV1uofng0cZ6HrI=;
 b=I2Zkx/5c7Ilv4qIJm+I188pelNnGKSrEPHCyuUyJB634ZryBkWyRf2RA0xZnn8Z6FQ
 k4gAA7WK0l1BUe43elbSOlgVSrZd+UZYvM5DnH0onJ9jyE7JI4oIavbNInPcHN25DR7W
 rDm7Bw8RMAQS4byeU9pMNuIMN50V8paoBJvZb/KsE2pnD47emh9823VyuvE5QmVQ0d/T
 wmu49ees6rR+hjwBQLtYIj3SL8AbR2a6t7iE5c6mUQ48oIJuLlJs+SFz3ywccYutknLu
 WzMZLKneOxI5Qd29dDKgGpqRDHvvzQKe4TI97QAvXGEGKl7Ej4pspv4DzBUHlsfmuU00
 zJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=JA4DzmQxqUyyRRHvZBDUDiF++lxMRV1uofng0cZ6HrI=;
 b=inqTV+k60EqyrKbrdw0iuEqIJEn9DsWLTLL+YDuP7+1BJwQQ7pNDYxn0XVeV/P4ewI
 IO2EnRUSZ5x4Bu5fBN2J2gKN9Q3FTRbYwRj25yCHob2ZyVfHgHTLiVGpi82OeI/Ntns7
 1YPLlV5dqZ2rpvrV1zdF+tnoS9bNSJ38ixmwRy9mZwQjVlxGFZlZBi7HH5PcAoKNA8ES
 kirQxNAABLluXXLSlAF69WO2QtfIxLdJIT4STgwZY75t0g7kSYBDuZR/yqUm1VUHDU92
 CaCeBLcGaLSYT8ikoLw356amiMqHl+rCVDYGjGHjqEd94Z5FNkW0X+cI7G6QWIueLU8+
 CmQw==
X-Gm-Message-State: AA6/9Rl1gqN6a4C5hOqJXXt8rkL2PCPMGd75SUfCSpsya+UJYa6WTMAd8sXt9uwIAF+e+ITZ8+tz6PMwfhyHoQ==
X-Received: by 10.31.183.134 with SMTP id h128mr15257513vkf.124.1476680633615; 
 Sun, 16 Oct 2016 22:03:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:33 -0700 (PDT)
In-Reply-To: <1476448684-6149-9-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-9-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:33 +1030
X-Google-Sender-Auth: QNFF6aLOlfG_8dHR-tNRB19ZIAg
Message-ID: <CACPK8XeJjnHWMUjytg-916j+kV3RUu7RLKSVqP7dMOiv05_aUw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 08/12] mtd: spi-nor: aspeed: introduce a
 device under aspeed_smc_controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:03:56 -0000

On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> This will be useful for readability and also logging.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
