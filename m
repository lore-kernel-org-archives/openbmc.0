Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sI+/Wiim"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmdCF2b2TzDrFs
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 17:10:16 +1000 (AEST)
Received: by mail-io0-x232.google.com with SMTP id j141so7328356ioj.4
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 00:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuxXe3UGHsRai1J5nN4GzpyKvpf5pgbVbUFkPzbnFag=;
 b=sI+/WiimqFJmE+mEjeRomhyKYw1g33HDZZmlv1LYGEYMM2u78Ht3x/mBePYBN9tO/e
 y47fLLK2A6U3DgDqBLnatn4UVGBtZSqez7GKiJaE4DB87OeI7opsZ1gg60OkyocFOOQ+
 PSUHUd3f/ICgBG0Gx1bsNnmbmV45YKyyAoMr0qaCKuGCZwQTFbfMAHX3wxkqV6NVrUhU
 pSSMzyBOyWGipM8MREUL0pWQJXf2QhWReZE2WlejqfNGWrCXVKgx3Xa5VpPpovNZavZR
 Rrftnh7Qlaybi+G9+hijFLq65zXAoj/cL7yOOfgIeAYI0l3Y+HHvUzYOF1z6cvnLMy3y
 4oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuxXe3UGHsRai1J5nN4GzpyKvpf5pgbVbUFkPzbnFag=;
 b=MYmzJlMWo6XRkRNTwBSiFTrH/Bbv6oDnpl7OTuh+y2HvUkuM4KT2U+6v9KeqWQUweF
 LQyPeVRjw+uqV7nXB4JEmHnjUi7i9Dl6mlLA2MonsM4Q0I0flLa3GTe2O77h+/8CfROj
 0MLVVNK2Wd4JUFBEQ3xispCiWEkWn+4terQ2B/3hO7lw2If/GnMxA77JF+ClJa2kv5Z5
 4c2zM6IAlK71BslQQxYqxKiM8o60b5T3dBV3Dw3PHxtJJhe2nl+ER8zcnoLwo+Xv52sV
 issr46sj5DUwq5zGEdVIJ04T2T2KEDykdKVpcpDMvys6ak05ARbK3LqefLkDLKSCKomf
 04GA==
X-Gm-Message-State: AHPjjUhNnJcD0drbCrcvxtKoUF4o14EHb2RsoeiD7PtfPQmsc4+lgYMK
 6dHlIEtGfhs2ew==
X-Google-Smtp-Source: ADKCNb4L+2BJDRDaQ6lqh6yqT83aariVnyn14bxWOZkc235zcXIMBTekpSAxRAlxFnQmTpjyw2z4+Q==
X-Received: by 10.107.147.6 with SMTP id v6mr3174801iod.13.1504595414282;
 Tue, 05 Sep 2017 00:10:14 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id u94sm12145ioi.72.2017.09.05.00.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Sep 2017 00:10:13 -0700 (PDT)
Message-ID: <1504595408.7626.9.camel@gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, openbmc@lists.ozlabs.org, Joel Stanley
 <joel.stan@gmail.com>
Date: Tue, 05 Sep 2017 17:10:08 +1000
In-Reply-To: <20170905062510.GA16418@kroah.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
 <1504509469.4080.6.camel@gmail.com>
 <CABb+yY3K4AbqqHZuKqquOrN-gCQeRTvh2Ahk349zc8DNP-fajg@mail.gmail.com>
 <1504568239.7626.1.camel@gmail.com> <20170905062510.GA16418@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 05 Sep 2017 07:10:18 -0000

On Tue, 2017-09-05 at 08:25 +0200, Greg KH wrote:
> On Tue, Sep 05, 2017 at 09:37:19AM +1000, Cyril Bur wrote:
> > On Mon, 2017-09-04 at 20:13 +0530, Jassi Brar wrote:
> > > On Mon, Sep 4, 2017 at 12:47 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > > > Hi,
> > > > 
> > > > I haven't heard anything about this driver. I'm trying to interpret if
> > > > the silence is because there is something fundamentally wrong with the
> > > > driver or is it because it doesn't use any of the mailbox
> > > > infrastructure it is being ignored.
> > > > 
> > > 
> > > Its the latter.
> > 
> > Great! Thanks for your response, I'll resend it under char/misc.
> 
> Wait, no, please use the mailbox infrastructure for this, making a
> one-off char/misc driver isn't ok when there is a framework for you to
> use.
> 

Thanks very much for your response.

Yes you're absolutely correct, I'll send it to drivers/mailbox. I look
forward to working more closely with Jassi. I'll be sure to fully and
completely exploit all the features of this mailbox framework.

Looking forward to continued development,

Thanks very much to all involved,

Cyril

> thanks,
> 
> greg k-h
