Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IEoATQiT"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="OBSvYI2W"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hXwV61tkzF2BG
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 22:44:10 +1000 (AEST)
Received: by mail-qt0-x22c.google.com with SMTP id f1-v6so2300145qtj.6
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nBfh7A7+NsLXFRnEQy1sn7WHEhqhtg/tJzrweuRPcPo=;
 b=IEoATQiTXh+ig1frwV10uo2Vwoaafd7QmR5ZsMtIf0XqbQebzi9qN/Kv6igcjM89IP
 FEsq+KUbjB8Tg730O5xvY+eHwZTqkICDQK34jjVQIL+Z5FUZR0XpLIodofU/gnFpiOf/
 MIXUCD+mGzRDdRIHUTatroMrqOYUGcgPyVzGSU+i7IT2dTbyg3/k081oxwbBK9kUv8aG
 1YfkZKBSkRPEF+L8Nl3RXuODt0RDLK5/kPYlZy0x5pMDHAQAuKucp9/pwdIsPbue1rA7
 B7RxUi6rSZisZjbzLI3gm99miKoiHk7P6CuXg/8aRz/GALEM6yCbi9+Pl4I2Rsq6+q/J
 cTFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nBfh7A7+NsLXFRnEQy1sn7WHEhqhtg/tJzrweuRPcPo=;
 b=OBSvYI2W5MGz3hJzq85aGNKNu8NZmlGnYqjOWH3cXdQKP1NoS8uuso1omOum1Tmi23
 TxeQPNFZgjy90rogNTVseBBmd+TjCKE+o9hsVz3z9s4JBV+Z7RkZOQfsXmRqhUfx3Knf
 Dbh/u1pjVZDe4IsTpl1kL5V/Z+/1oCjEnlQjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nBfh7A7+NsLXFRnEQy1sn7WHEhqhtg/tJzrweuRPcPo=;
 b=LqcZbpCfZmr5HQy5xb34NN+koz7f+BHYIuBIPhFXZ4RsXqwGzuOxZM7Mx4AzULqtNg
 lE1M9v7Y0eVVvPs2Q8YxyEUI3mbn8IFGMG78jirJGTBEw2IoJfEv0OGcMJ/bgmKZU1FZ
 f+HQ+o2BQmZyClJEnQhIVEBnHNxStC2FgkX9QrnhirXhjbFG6Dcfg0+zLrrkXSIiPD8v
 WzZJNRSQx/9NBc7iXPOYng3Yv99/KdmYDw6B/TFFPlXr4jex/iEJfOVauf+Ctsuup1pW
 UPCTwBFLNkY4soo8f9BVm5QoJ9F6O3Lk4r0+m19TzhdrrgUj9hXd1+xkeEvYeN+o1Kmx
 8rSw==
X-Gm-Message-State: ALKqPwdMVFD6dvLB+NYD2Jnf6GGANFcqzk7QXVNr/4dJKw0yotwSsE5b
 kUP7hw4BqOIEmfs2XwbNNOktPrL/dK5twc3MdAo=
X-Google-Smtp-Source: AB8JxZqWHifixotYoZC9uOZ6xZDlS/ZQA/YSlhjyVtt/T0MCVRuJ+mYmqkgdNGd9AWYpko6vkfsuMdsoh6nruMWQd3k=
X-Received: by 2002:aed:3b37:: with SMTP id
 p52-v6mr1170605qte.106.1525956247614; 
 Thu, 10 May 2018 05:44:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Thu, 10 May 2018 05:43:47 -0700 (PDT)
In-Reply-To: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 May 2018 22:13:47 +0930
X-Google-Sender-Auth: Yd9hglGQMQ9WqRqeyA5JVjhS6R4
Message-ID: <CACPK8XcTC_BnxVCW4fEymcfGGwpOPGY-cOhWx_1MfhJ6jD_stg@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: Nancy Yuen <yuenn@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 12:44:12 -0000

Hi Nancy,

On 9 May 2018 at 04:58, Nancy Yuen <yuenn@google.com> wrote:
> Please join my team for an OpenBMC  community "fix-it" event in June!
>
> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
> part of a larger fix-it initiative. OpenBMC is a large part of our project
> so I'd like to spend part of the week on a fix-it on OpenBMC.

> Anyone interested in participating?

I would be, as much as is practical given timezones :)

Cheers,

Joel
