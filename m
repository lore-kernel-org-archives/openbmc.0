Return-Path: <SRS0=tH5W=EF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614F7C56201
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2020 05:58:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A304221EB
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2020 05:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O89Vmn3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A304221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMs7P1KGTzDqs6
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2020 16:58:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O89Vmn3y; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMs4H5k0czDqtG
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 16:55:58 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id c11so5518340iln.9
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ij/+YOxHra7IdNfnCsgktMjzLc4ffMIbs2Y7nPKTtQQ=;
 b=O89Vmn3yhC6wHipTKIAb7UsFmszLConTEv/gzBwwR8mCd9mz9TaCeat4iacqMwjcu1
 rxcNqKSGf6m9KxVLfjNxZKjYGK/3FZ4TUcDtkEaQZQva7IAoYVUNhoSX427eWhJBmn1q
 S/i/r5RpWqRyWmV7Ank5uC4mFEtmeZ9chZvLdI9+kvU9M3888wdH7lPh02IJvlGzwlM7
 lDnbuoG9tvlfqUvoID9ADaMvGGx6vQtejl0mdCwFLUbXmnY9NpE987ZcLofST5Hv3YZt
 dM50jdIct4yQ+kjPv440s4atyRhB1tcV4oTuEKI3zaMHvW6il6Bf3Npd7UUSC+WinFl0
 Hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ij/+YOxHra7IdNfnCsgktMjzLc4ffMIbs2Y7nPKTtQQ=;
 b=p/Y5XTQnsUEYPGXfK9+gN/RXrPHEwn6+jykX8R6VjO5LwJs2Hr348PKuuyuSH/eheW
 CR5jxuc5RyGg1ARAdEmf7y4PTesTBfF1o6zXPxU9ErlVqnwlk2pHBEG4q28PhICRAqFE
 dbDq9I366lDEwUEzk2MrwAdZSuDSyuj7/erSGhO6zg8rOti/P6pzE0fDR3rKO4zMyF3E
 4Oq6r867faEvANxVi72FZuue6lzLDC8rq5v1khsifrjx5Q6I0LWqa6G0oq+sGVdHYr/+
 ndOsodU9dQVgIsu5+AL5otyfNkbrMyVwmgFGAlDnTIUGyJxAUp6bEYV5ePMAznR/Gxit
 YNbA==
X-Gm-Message-State: AOAM533tD1XSk31aKclQ6CxIul9GLo6o+TQt+bk/jDTsPqsEv4ILgBua
 nyefpX7mkBiQsWMM3XPc8TMVJmKwAmGtE9thpKg=
X-Google-Smtp-Source: ABdhPJyVriXDs2o4OM6DzvMwN7mInTcFrpv3vVIcDHdQ+rxl3Wo41PoS9XhBc5JDK7Mj/7v+RMZVNAQmgSTipf/zBrI=
X-Received: by 2002:a92:d3ce:: with SMTP id c14mr713613ilh.157.1604037354586; 
 Thu, 29 Oct 2020 22:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Fri, 30 Oct 2020 08:55:43 +0300
Message-ID: <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
Subject: Re: SELinux support question
To: Ivan Li11 <rli11@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Ivan,

Yocto has a layer for SELinux
(http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
it.
But the layer depends on Python for management tools, which does not
exist in the OpenBMC image anymore.
The problem is that Python significantly increases image size, it will
be more than 32MiB, which causes some troubles with qemu emulation.

--
Best regards,
Artem Senichev

On Thu, Oct 29, 2020 at 7:48 PM Ivan Li11 <rli11@lenovo.com> wrote:
>
> Hi Team,
>
>
>
> I would like to ask about SELinux support. It=E2=80=99s seems that there=
=E2=80=99s no SELinux related package in current OpenBMC.
>
> Therefore, is it not supported for now ?
>
> Please help to advise.
>
>
>
> Thanks.
