Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ty8TV1rtqzDqHs
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 09:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UTxOntwN"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id b22so9098732pfd.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 14:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciO5N136c6xDjAVnXDnxtyOxdLk/SY4cLhvwao9q7YQ=;
 b=UTxOntwNdUAyonwMVIf0NuKg+1uCdB0AVDZcXsTfE05EIBQnzCoBu4lgk8OoZN65io
 L/gK6DU3vGQYIuGv/7K83aXna2Dhy3DG4AU4Xe6NVfiu5hZ29LHuO0/fsX5giAWA/8tC
 zpRUptwSXXQQA8agKcBeQEpNdLpOfIVVsifnXkiBZuvfGqlDgtARx7EyftTnQcDKpZSM
 jWCPwwmdadKD/yqrNbjz1fBrlgme2c0yWFlEOmgo3FYIUpCqX99MVdigcC7hYQkdiwry
 ql6DGFritC9yq5hO4Or7qfa5q/fCvrPm7yKv/Ctd0PQvptD2BFfoPBVqDmptdLYh4ZYq
 i7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciO5N136c6xDjAVnXDnxtyOxdLk/SY4cLhvwao9q7YQ=;
 b=VhO7pBvOVVx5/GYWcOVWsopuZQ6Qh6Uo8Zk5EXx+4qgbsYItwHd1t7M+yxyviVtq2f
 rAgmPbOZy0CNjUNWaPz+1NSKFLXsAgB36akvCAkp2PJ0+/SXCI4C7I05TIfXM3+61w9z
 PzTanHLX2IZ2lnJkKlpw3lYF3jwMTJ3tkAgJSdqr6AyUKALfUYSzppaTWEwcGNbXo8NY
 SopBrnpmzStI3D5Q5Vl+D7uR/7nQBMALKmBw8dwGWhN+22wKeUsZ5EslNpr1PA6pFA2q
 kT8iZeUHkI9L7aigd+l+VSLbs1gmAVMlNrtt8kJODvBYuAHVr7YAObEvAas1BLXGHwr4
 GelQ==
X-Gm-Message-State: AIkVDXI7Agstue8awwzJEGiIElzfh5ZpDpIF0tMr1CVR4fHlNy52TvG2SXSb5jjAsJ53oQ==
X-Received: by 10.98.141.153 with SMTP id p25mr83269164pfk.148.1483999788622; 
 Mon, 09 Jan 2017 14:09:48 -0800 (PST)
Received: from [10.192.255.231] ([202.81.18.29])
 by smtp.googlemail.com with ESMTPSA id e5sm181562497pfd.77.2017.01.09.14.09.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Jan 2017 14:09:47 -0800 (PST)
Message-ID: <1483999740.6236.2.camel@gmail.com>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: benh@au1.ibm.com, Andrew Jeffery <andrew@aj.id.au>, 
 openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 09:09:00 +1100
In-Reply-To: <1483911906.15843.61.camel@au1.ibm.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 09 Jan 2017 22:09:50 -0000

On Sun, 2017-01-08 at 15:45 -0600, Benjamin Herrenschmidt wrote:
> On Tue, 2017-01-03 at 11:54 +1030, Andrew Jeffery wrote:
> > > > I think we should rename the IOCTL as what we do below doesn't
> > > > necessarily raise an interrupt.
> > > >  
> > > 
> > >  
> > > Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?
> > 
> > That suggestion works for me.
> 

Sorry about the blank one, I'll try typing something this time.

> If we are going to do that, maybe we should make this a write()
> at a specific lpos...
> 

Andrew, Joel what do you think of this, a write of count 1 at a
specific pos. I like this since it removes ioctls all together and
isn't any harder for userspace.

> Otherwise call it something like SET_ATTN or SET_FLAGS ...
> 
> Cheers,
> Ben.
> 
