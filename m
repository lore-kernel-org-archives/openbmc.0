Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5gt4SSNzDt2r
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wyPx8Jhz; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 130so4883823vkg.2
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Fj7WorgcH8F38cW6RKbASiRFe+gSNvUqhqVOTdUwX7M=;
 b=wyPx8JhzSpCxpjpvdm+iFKKxu4EwA7+wRcPV1ORjhqa0KAWM21OBrEnW/vSfTiMBCV
 XS437TIO6wbA+MRCQyjMbIzKhV9aa1xEyD5cdYGqTDqd+5pZwRGPQZjed5GQtUABc19P
 fEbAqb0NEBzhacTid69ATA2TSVH6vq08v5ZQZyw0BD+TN4cWucORfVS5OWxo/4YgyAIZ
 oNUG5S5dusZyGCTg9+f+U2jITW09MVoeTU34MzNAkRXnEGr4OdF0XErhS1NJQVhyhZXC
 /vQCj4Vq2cy3LzLHYA2HBc/l/mhcvb+n/spnjYNMoQJtwjFWx29LroXfexb1NTAcNEzT
 KcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Fj7WorgcH8F38cW6RKbASiRFe+gSNvUqhqVOTdUwX7M=;
 b=XHPZ4NwcRdFfXMiyAwinRE5y7Sx3AgDJcyv7Iov9sswPne9ReomTSbPc+XXe5GxUbg
 xYuH5LkhmoYJibSxtSwEtQnQ1hal0Bkl2smI5/wOnq4uwhx7azbfB2Gp60ex2pq4qnKo
 6c9jghENRgFSt5A1gorEFpzoHYPBH8MXnXPKlJGzNh+tHkq/gNKOUwOmmSH7x9yYPQCL
 afXnbT2JCYGwtqRAwzEmxJUFXkVi8nv8dkYcpaubm4Mo5P+POEAbeVwFU83pJrkINwsr
 /H1ujt9EIlfG/dxdEBl/1RsZN5z4UJsGtA8w/wiUDCBaDAYuwLS8fEGBS9DzIIM3gHMA
 OaKQ==
X-Gm-Message-State: AA6/9RnJ5etG9zli6dGPY0u2BRC32bFMllTnumK1ouGoutnBcIkHaLKJ/y2LRdNTksTB3B3bpmP+WE5uCHTe9g==
X-Received: by 10.31.166.208 with SMTP id p199mr13362446vke.145.1476680600763; 
 Sun, 16 Oct 2016 22:03:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:00 -0700 (PDT)
In-Reply-To: <1476448684-6149-5-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:00 +1030
X-Google-Sender-Auth: ZZtD81nDaYMP-LmHu6QjzWAYxGU
Message-ID: <CACPK8Xe0LxvPR-7cLZVMo4HjRukJagyph8AnnHVvawUr4QGSjQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 04/12] ARM: dts: aspeed-g5: update for new
 spi-nor binding
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
X-List-Received-Date: Mon, 17 Oct 2016 05:03:23 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Milton Miller <miltonm@us.ibm.com>
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 63 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)
