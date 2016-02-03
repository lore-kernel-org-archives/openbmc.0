Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 316351A0191
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 15:44:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oBJc7kfV; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 65so443575pfd.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 20:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=6++mFdcEsS3+hCVIKJDbueeY03b+TlEPtb1ruJL8Wx0=;
 b=oBJc7kfVhDlO3avoz3KHRhrIM9VZ5WEHZEOnE7l0t2t2l69FQYKCSpjxfP8l2lcgkh
 TzqLMtWBtzqsuNIlfil23cfRLgWXCnkiaHHDSol5IHNPGFW/6FeiVHdBj8MOvYfVxW3l
 Jbq0HHRfTA8z6g0zEEh7WZkI7s88xzJdPyppMAnldw5RSSBoKiswz+QcMsyfYq+SXQGp
 S7ZxsKmKIM9tCrN+cQ69xBbA9mOgfVjozceCXT8fJ5t77qBws+gJKQnjTbNfcNm5nfIB
 FxhnWsgcPyxidVhkrA4EM33Fevl67GIsiiYT20yFgcFlDKPtASKyH18L00DvHO0QhGci
 nfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=6++mFdcEsS3+hCVIKJDbueeY03b+TlEPtb1ruJL8Wx0=;
 b=ewrHDthwpm0um4vo5J+0iqgNlTxnX0YVSKUHC0zTdCJA62ThXiZhe/WaoBcI9fVd3S
 xIfS52ftPkZPkspFnz58WQR6qFnJfK/BELVrw9VVyYeZdBaTQHmNwkANQl6ZxAcs+vo+
 gg2bbsaO7DggKur24j3diIhzKaRTYBl7IshRw6/cizuvGuDqUrjYqYXV7zPp+YxDrNrq
 uUafIq/god6xTDE3jug+uDPfTPT2OwXIxmH87aLJ0Gh4mxuw27dAHRSPWGbjkOs1vQt+
 FhEiU/FohwlZ0yaxYygyp4b8wzVbBesJxjeMtkWmsVO7wLGFdO4ClLGfSEpSRNMi8x6q
 MWGA==
X-Gm-Message-State: AG10YORxv3LW492sPrWj/RwS+VgLMKMOIgKhQRkeSVyWQq8ZLbKwIaEoVZaNS1S+gG6H1A==
X-Received: by 10.98.13.7 with SMTP id v7mr52699789pfi.150.1454474675071;
 Tue, 02 Feb 2016 20:44:35 -0800 (PST)
Received: from camb691 ([138.44.251.171])
 by smtp.gmail.com with ESMTPSA id e1sm6157915pas.1.2016.02.02.20.44.33
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 02 Feb 2016 20:44:34 -0800 (PST)
Date: Wed, 3 Feb 2016 15:44:33 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: "Adriana Kobylak" <anoo@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc 1/2] Update recipes
Message-ID: <20160203154433.674e06a5@camb691>
In-Reply-To: <201602030128.u131SCvZ020249@d01av04.pok.ibm.com>
References: <1454386220-10574-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454386220-10574-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160203120841.6aabf916@camb691>
 <201602030128.u131SCvZ020249@d01av04.pok.ibm.com>
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
X-List-Received-Date: Wed, 03 Feb 2016 04:44:37 -0000

On Tue, 2 Feb 2016 19:28:06 -0600
"Adriana Kobylak" <anoo@us.ibm.com> wrote:

> Cyril Bur <cyrilbur@gmail.com> wrote on 02/02/2016 07:08:41 PM:
> 
> > From: Cyril Bur <cyrilbur@gmail.com>
> > To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, Adriana Kobylak/
> > Austin/IBM@IBMUS
> > Cc: openbmc@lists.ozlabs.org
> > Date: 02/02/2016 07:08 PM
> > Subject: Re: [PATCH openbmc 1/2] Update recipes
> > 
> > On Mon,  1 Feb 2016 22:10:19 -0600
> > OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
> >   
> > > From: Adriana Kobylak <anoo@us.ibm.com>
> > > 
> > > ---
> > >  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb |   
> 2 +-
> > >  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     |   
> 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/  
> > host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-
> > ipmid/host-ipmid-fru.bb  
> > > index 5eed1f4..06ee00e 100644
> > > ---   
> a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> > > +++   
> b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> > > @@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
> > > 
> > >  SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
> > > 
> > > -SRCREV = "63696f4b23c9fd0a84ce539a6414ada406aaf229"
> > > +SRCREV = "a14239a201443222906864273449a39cfa84118e"
> > > 
> > >  FILES_${PN} += "${libdir}/host-ipmid/*.so"
> > >  FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
> > > diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/  
> > host-ipmid.bb   
> b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > > index e74a6de..068d395 100644
> > > --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > > +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > > @@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
> > >  RDEPENDS_${PN} += "network"
> > >  SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
> > > 
> > > -SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
> > > +SRCREV = ""
> > >   
> > 
> > Does this not break the build?  
> 
> I inadvertently created 2 commits instead of amending the same one, making 
> the first commit an "intermediate" one with incomplete work, and the 2nd 
> commit the completed work.

You know this is something you can fix right? The public git repo doesn't need
to reflect your workflow... lets try to be tidy.

Sounds like what you might want to investigate is the `git rebase` command?

> >   
> > >  S = "${WORKDIR}/git"
> > >  INSTALL_NAME = "ipmid"  
> >   
> 
> 
