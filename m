Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5jh4C0hzDt2p
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:04:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QK1en108; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so7336042vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=A/geFGXGwJUAYOZoj9JffEhXfgo5c4wOIi5oGuRkAFQ=;
 b=QK1en108vrtA0jWo/59IuWj6hXvLxyay6CD2H6tuuqC2DQpCn+/5Y85rHglMTU4tOl
 ekmfdUjMoIr5mJMwtReGQSTLF+95DiOoMMuhrf6lI+riYip+VzG87vMrGJBuIyK+/biG
 heZK0AdMXi5TDEgCULhLm50u1q31JAAn09Yj59zG/pAHKiTQvnZ++yWBPopEGf3w9ulc
 G5ndLCiKrq9PFkAaN9xHes3SDZLLXQaNZBMdKPEGDo2MGZDmS7H4WIZYAG4ftvIzl3eD
 frN4OmrXW2ZmLPAxT7/BnIxF2RB/m5Py8Fft7yPXbvj4V7rT8vdSr456cGvTEsvr4Mmz
 1OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=A/geFGXGwJUAYOZoj9JffEhXfgo5c4wOIi5oGuRkAFQ=;
 b=Vz4LA8t5z9nX//QCq6vy4susVT7uMBnbm5lVg/o2SyctSCgTCbPtDvYAfIPYbR9zvd
 eF7DQf+qrUzWz91YbL+8N55FqG1o6WRfwtkvcwPw69MEHfsRUtVDNSzomouSBfJ6/BUs
 JHHth+paZ5T7OQhP/RIWrvMEKtYsyZMHniYkqfGZ5gzJkqeU5ddN3fANSrL/eQq2B7xy
 nyouUv3JZozIKIUDiuUmDCOajS/94ReJxDjXgm+XxVD1NVbQZ+j8Z5XmPvlHxA95X4tj
 TQv7Bn4jNd0v8dAFjS5Eb3V3WQwynTXee7q9xWV70XNlE399DiqvBMm3JTdEVzYZ9Omy
 dB8Q==
X-Gm-Message-State: AA6/9Rn8ASlVaHsMz/AL1sobnEq7qJBSNjFzteAvM6PLQ/pHc4HQpxxre+v36TSWXOd4vq1Mk7q+0Yi3oo/MFA==
X-Received: by 10.31.140.147 with SMTP id o141mr13629892vkd.149.1476680694743; 
 Sun, 16 Oct 2016 22:04:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:04:34 -0700 (PDT)
In-Reply-To: <1476448684-6149-12-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-12-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:34:34 +1030
X-Google-Sender-Auth: RXAdTRcssEiotWhxzLR9kH5hD50
Message-ID: <CACPK8XehrO9Fnjg-9HdEVmAv896rPZ_5Gfm62z=TzeuwPDiedg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 11/12] mtd: spi-nor: aspeed: use property
 "aspeed, fmc-has-dma"
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
X-List-Received-Date: Mon, 17 Oct 2016 05:04:57 -0000

On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
