Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nmvfkw1b"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434zSy2G8szDqsr
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 11:50:10 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id y78so100039qka.12
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 16:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=vFgyBemAshFxD4MNjy0sZ8LP1pv0nTXd+DDwIh379KM=;
 b=nmvfkw1b7LLDi65wxY05wk71wzd2BmwK2qpjJI5kmCx427Y2bJr2QecqTIdUkpvEPV
 IETOk7xbuYsEMADTpUGd13iO/mRnyALPh1XbMwSbvdHv4he0UmpFg792AxfYeuZgqbNj
 kcTNDoc3igeIoEEWTh8wPae4Y7uVZ8GEm7nlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vFgyBemAshFxD4MNjy0sZ8LP1pv0nTXd+DDwIh379KM=;
 b=oMwUIM9FEQRBnDA1fSXk6ejnSWlvaH6Wt7+7fc3UmI+xT9HINuNxAv6N6tcaa/Cri3
 IytvZguwNWmr+xlyxD8G8KW4EV3AHTBeYVYwjVSYDiciMZhvE1E2td5W23sUHHooY9FP
 HM6X08gPJXv1W/ApwKFU5giqKwUHs1h5J2AxV0A9vREJ/rSJR14n8J3QfhVNL8VXsVC+
 CZDEF5xswy1WHm31T8KLxttZNLI6NklhhJ1fZFBpNTLCOUhV05pgZm4z/czY/kS8jN/7
 DlTvJKMbGXWfrWcEKvVdDcSh7mx11xl1Eo2oZ4D93SrOcK7ZdjX5rm2TrEPTfdEm4AZm
 UgAg==
X-Gm-Message-State: AA+aEWb5W/fsVIPRPqnuon7o/fQwTu2gaXDlu3EgkBD2/zGzegMItolY
 5ceCDkW//E6rImUTqWYROB8O6vxvv0TNWTF1Dze6V2QC
X-Google-Smtp-Source: AFSGD/VwHfPtvMROwxNCoyp1jpitWEz5mVYaeBgL56lC90SPqGPyhDsUdb4LcLNJSwIYHMAqg+DxyIpzHrjXevXvolg=
X-Received: by 2002:a37:2b5b:: with SMTP id r88mr37180307qkh.336.1543452607477; 
 Wed, 28 Nov 2018 16:50:07 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Nov 2018 11:19:55 +1030
Message-ID: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
Subject: Linux dev-4.19
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 29 Nov 2018 00:50:11 -0000

I've had some off list questions about moving the openbmc tree to
4.19. Apologies for the delay responding, I was busy with another
project in recent weeks.

I will put together a 4.19 based tree next week. Once it's booting on
the hardware I have access to (ast2400 and ast2500 openpower
machines), I will push it to github and notify the list. Further
testing would be welcome.

If there are patches you would like to add to 4.19 please send them to
the list with the 'dev-4.19' subject. This is probably best done once
I've published the tree, so you can ensure they apply and are tested.

Note that 4.18 is now end of life, and today's update (4.18.20) will
be the last for security and stability updates:

https://lore.kernel.org/lkml/20181121103111.GA9112@kroah.com/

Cheers,

Joel
