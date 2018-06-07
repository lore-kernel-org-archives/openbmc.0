Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EFDIVjot"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Djlq9P29"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411Zrh4w39zF2vT
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 16:09:55 +1000 (AEST)
Received: by mail-qt0-x236.google.com with SMTP id y31-v6so9001776qty.9
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 23:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=7JJta2867QUCcbOVGGiJiOATboZnAYzFGu7OpFnsIO8=;
 b=EFDIVjotyL1prSo1AWmOcCR6rJJxDN6jn3UrnIrs5q4/e44+iM6XZKvA+jg7nGNhZc
 RtEheXe2EYgNFr+Ae229U3nx36zSBmmVytDQHZmRNMzKGu+j2FyKQCFya3GRMwQHiD/x
 cvlnPTNiM+H1CcYBF97gkq7jRrfpKG1bmqg3yfcbbMC9AXfRacc6TzZW51dw2D1qBWvG
 GRFW7LENw5ckNai5LyhJ9c+mhbMOAgIHwXimOHX9GgGZa1ehxgogUHiIphC3kYq4zJpd
 D2ukHP0wf/g7fyB5ytfHz4gP02mCUkIsQDfwCYalpKxmEwefN01jIWjFrwe5vFl/PASI
 vFWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=7JJta2867QUCcbOVGGiJiOATboZnAYzFGu7OpFnsIO8=;
 b=Djlq9P29rLhA+BGlLLwxpr3JdQ+8wXvhnLs4ffOsk3hSVsFRkyJ4Xm7TE2PbYyBmge
 XXpzNaoihm19Kf3IUmr8qLBU+nUsYpGDNFGRintR4+3GfFsI8AskCCwLxg5q9V1IGsJ8
 KGVUiv5sQE2yBu26UsF7NKyOVpj79jYVHXtUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=7JJta2867QUCcbOVGGiJiOATboZnAYzFGu7OpFnsIO8=;
 b=Od2+ygZK5p8KXKiiYXaxvVfVID3m5i+msyfn3vVGM6cNsyeWCeQTzlWo2erIf/mqAp
 JBtQs1HmgK7ze5DdmK2exmh4ypSPs4ktr/qlj/MnE07chh1ys/Q4bm/3C/nljji7NJJ2
 AO50kIQvvwyjEH/8wbiH/+dxiWyIZ/hXTiF7mPiRS6K3JpU+mSOYcdQe7yj/YGOCAN62
 /sAisQyOTiFZCEQmVHNvXL6a7nxLQxs/kIPLNU80GjsXyXslNWZGhtFfVtAw6efKs4Yu
 +Kdns1JD9Jv2KcFJhHx9exTCBEVd8BDGiTUa4jbWDClWaAE+EVRD3pvMrmIUdGvoouBb
 4X4Q==
X-Gm-Message-State: APt69E3t/Hm5/6ysLSMBqt77WFmI6+e7Oqq7ZsalNEvu9CMQen08PjZO
 IZQqaQIuxwo+6WuSMVLtQ892aE8zX8Vlb0Yg4qgLhQ==
X-Google-Smtp-Source: ADUXVKLirnMkmKzecM/6RNF+9hBio7dQwVmu7bu4mQ/vddOMYHBEZVruD6iJ5cigZ9s+23AsMYr/Vpj95nSOzNGt9h0=
X-Received: by 2002:ac8:65d1:: with SMTP id
 t17-v6mr438881qto.347.1528351792676; 
 Wed, 06 Jun 2018 23:09:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 23:09:32 -0700 (PDT)
In-Reply-To: <a2cdfa19c00f492992820f9fae001d39@AUSX13MPC105.AMER.DELL.COM>
References: <CACPK8Xc=utavS8Q42fkcWmVuOcnDbgHAMTQA3peJuxzHOzNYng@mail.gmail.com>
 <a2cdfa19c00f492992820f9fae001d39@AUSX13MPC105.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Jun 2018 15:39:32 +0930
X-Google-Sender-Auth: 2NExO2clvanOGUZF6USXImQXEAw
Message-ID: <CACPK8Xc3ykLX1meRF75Oc0Pu5o2-Y0piMCVvSj1=P-e1fTAoKQ@mail.gmail.com>
Subject: Re: lpc reset questions
To: Eugene.Cho@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 07 Jun 2018 06:09:58 -0000

On 6 June 2018 at 21:52,  <Eugene.Cho@dell.com> wrote:
> Thanks Joel. One more question -
>
> Are you aware of any ABI to notify User Space whenever a LPC reset occurs=
?
> I didn=E2=80=99t see anything... and I am unsure if this is something tha=
t only we/Dell needs...

No, we don't have any code to do that. I'm not sure if the aspeed
provides us with one.

If you want some advice on how to do this, let me know what the
hardware does, and what you need to see in userspace, and we can come
up with something.

Cheers,

Joel
