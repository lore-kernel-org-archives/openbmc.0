Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CCEB1A00A5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 14:24:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=e7hIK0bQ; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id w128so8222365pfb.2
 for <openbmc@lists.ozlabs.org>; Sun, 28 Feb 2016 19:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pg1mmHf3mnanuTs2eZB0QMqgFbIiGsQ6fpiIJg6fH1Y=;
 b=e7hIK0bQx+RcDoeA3j0b70PW+xkDlxbo0EtR8p8p9gQy9NMZ+z/9OaT7sVp4Drba4q
 xqLRwkaSGPiY4gK14AJ2256z4vUFKMLVlzqKtm3g8MGpRU5e/M51UeAZ3fdQss5VPIQb
 qHN1ygawrQ58b1Gka/XOQbbnDzmKcuu0+UmVXn7V43jJCobNnbxKQHF2S5OrrGW7esom
 H4VjH5srxqGW8sthdV2NXEg3mf9i4pPapYOs5tvRjNrHdzlM74947eHVd1Lo+lTh7XuR
 i+56cZr6ORRhH+SX5KfwtwqZHgviSzRoygO1Y0eY6GHtTWKv4Sz7e0WiFi3c9A3/wpmB
 5Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pg1mmHf3mnanuTs2eZB0QMqgFbIiGsQ6fpiIJg6fH1Y=;
 b=f/RHUJL9u6unzN2+EgmVS9oqMg6C71JYyuzfYWt+XnXyMI/XvnS+32ZuAOILUnJzm1
 p+K72+NiGkGCRtXml77evAAUdJyTznB/Czpoi+X3/zt3sLPAVePDdOQCQfop2DvfpEnp
 OhoYu0gelf4lLO36rhu6RlcdwOy/k3016D34HiTKOREIvix/04x9P48Ay4cDxM9sYeLa
 GVA4uHa1Zbo4u1PUBcDfwXCHRY42ARIHDHceb//EuExKJuOGDQeX4bQkK4gxNF7tKdGS
 u3ueqEyqTGc39ikCYG/lNqhVvTPbB+8FoS0naFdjhfAX904HOOZEAz8f7criHHbYGrqM
 JTPg==
X-Gm-Message-State: AD7BkJKhwxrN2Vov+vNDWyKPjVZN8qX9p7lUYS7FZ2YtFh24tyAhMbPkrP5p/v70bxoqug==
X-Received: by 10.98.64.202 with SMTP id f71mr19169330pfd.113.1456716266576;
 Sun, 28 Feb 2016 19:24:26 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ra1sm33896071pab.24.2016.02.28.19.24.24
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 28 Feb 2016 19:24:26 -0800 (PST)
Date: Mon, 29 Feb 2016 14:24:19 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux v2] net/ncsi: Fix possible deadlock caught with
 lockdep
Message-ID: <20160229142419.53427860@camb691>
In-Reply-To: <CACPK8XfBP74bp628a_CHNX6GzDYe7MGwut_wFWSP7Rdv9jw_=w@mail.gmail.com>
References: <1456467027-547-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456467027-547-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XfBP74bp628a_CHNX6GzDYe7MGwut_wFWSP7Rdv9jw_=w@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 03:24:30 -0000

On Mon, 29 Feb 2016 11:54:03 +1030
Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Feb 26, 2016 at 4:40 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Cyril Bur <cyrilbur@gmail.com>
> >
> > Bringing the interfaces down with ifdown -a directly after boot causes a
> > lockdep warning. It appears that a network interrupt would result in an
> > attempt to acquire that lock again.
> >
> > The solution is to soft disable interrupts.  
> 
> Thanks. So we can boot with and without lockdep enabled and the
> interface always comes up now?
> 

Yes.

> Cheers,
> 
> Joel
