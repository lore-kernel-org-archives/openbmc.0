Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="l1ud47Kx"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rdDN08nLzDqnw
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 17:26:11 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id r21-v6so4214410qtm.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FH2RO8IvsmIUT+VlUnG2l7++lp5YnEY5E6i1VcMS3HA=;
 b=l1ud47KxtGndgJng7xPNhOtfm4mPK/+m5XYXick6AzTgVYInRf5hHk1YvTpqU3I9kP
 0Te3hxQTLU+8fQkKNE0O2wKWckl86lT/a/dLAx6dE7742dcpPr4kTzASGxSJZuAc4V6Z
 GfhrWU19Y3/NGRkiLuLWEYlz3QvMD0q01a/h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FH2RO8IvsmIUT+VlUnG2l7++lp5YnEY5E6i1VcMS3HA=;
 b=j79WFFq447LCgY/5ihqlHJyWYoqvDogmhgExxBWHU2faYyvCDHmdUsV33Xjad1DSVw
 7oyKu+KdzXe8yCqLwwy60qfs3gYg37pBxrSHgjV+Q8tv37R3Cd/NK+ikpft8/OBS8hmE
 jq2Ydij4Ew6C/zaxvUQoQzpIAE0N+5W8idpO9ilY2GzOXQgCiXS2KtbkBKRZ81TzvZC6
 PHDrdHFQl+wj+RGYCJxLNIqxop/iOnXOmfroXvNpDtUso98ivhU85oZsDKQkxVl4DYaQ
 lcKTE8EkBXP6uf0SrZ3zPolcF09R/enlbpIy8xcoQ6lBYIFi5TSq+/16ux1LeqmSooc2
 BMuQ==
X-Gm-Message-State: AOUpUlEcSfSiCeDBwey3X7RbpOGI723OXgolJvxPV5NrazcP4rMUi64n
 qWpJMCprGBIv71yoaEoKigq2G9hJkEz6V5AzdP0=
X-Google-Smtp-Source: AA+uWPx/LTmLrK/NQwvhmClgDEEW6C7ebZKoc3xl5ziI/VXuX85MH4A0LIcOT9I0lzjElgqOOHOYl1QuzqGwBF0bnBI=
X-Received: by 2002:a0c:9b83:: with SMTP id
 o3-v6mr25746392qve.21.1534404368235; 
 Thu, 16 Aug 2018 00:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <03b3c32f-dcfd-54c1-b959-8067893c0758@yadro.com>
 <bcb1cf44-798c-11fe-3190-2c62d7002ac0@kaod.org>
In-Reply-To: <bcb1cf44-798c-11fe-3190-2c62d7002ac0@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Aug 2018 16:55:56 +0930
Message-ID: <CACPK8XfpKvNyfLsqsmxyxpZFSqKehtsZWmHafmGxgWgCqnrZHA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] mtd: spi-nor: fix options for
 mx66l51235f
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, a.soldatov@yadro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 07:26:13 -0000

On Thu, 16 Aug 2018 at 04:27, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 08/15/2018 05:13 PM, Alexander Amelkin wrote:
> > Currently in driver spi-nor there is a line for mx66l51235l.
> > According to Macronix site there is no such part number.
> > The chip detected as such is actually mx66l51235f.
> >
> > According to the datasheet for mx66l51235f,
> > "The device default is in 24-bit address mode" (section 9-10).
> > Hence we removed SPI_NOR_4B_OPCODES option with this commit.
> >
> > Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
>
> It fixes commit d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l5=
1235l")
>
> You should send this one to the linux-mtd@lists.infradead.org
> mailing list.
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Agreed. Please send this one to the upstream list, with Cc: stable and
Fixes: tags.

Thanks for sending the patch out. I have applied this and the other
one to dev-4.17 and pushed to github.

We will get this merged into openbmc once the backlog of kernel bumps
I have out there are merged.

Cheers,

Joel
